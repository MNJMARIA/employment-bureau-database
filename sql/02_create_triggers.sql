--СТВОРЕННЯ ТРИГЕРІВ

--1.Контроль дат у Work_Experience
CREATE OR REPLACE TRIGGER trg_check_work_experience
BEFORE INSERT OR UPDATE ON Work_Experience
FOR EACH ROW
BEGIN
    -- Дата початку не може бути в майбутньому
    IF :NEW.start_date > SYSDATE THEN
        RAISE_APPLICATION_ERROR (-20001, 'Дата початку не може бути в майбутньому');
    END IF;
  
    -- Дата завершення не може бути в майбутньому
    IF  :NEW.end_date IS NOT NULL AND :NEW.end_date > SYSDATE  THEN
        RAISE_APPLICATION_ERROR (-20002, 'Дата завершення не може бути в майбутньому');
    END IF;  
    
    -- Поточна робота не може мати дату завершення
    IF :OLD.is_current = 'Y' AND :NEW.end_date IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20003, 'Поточна робота не може мати дату завершення');
    END IF;
END;
/

--2.Автоматичне оновлення total_experience у Candidates
CREATE OR REPLACE TRIGGER trg_check_total_experience
AFTER INSERT OR UPDATE OR DELETE ON Work_Experience -- при будь яких змінах в досвіді роботи
FOR EACH ROW
DECLARE
    -- v_ показує, що це змінна
    v_total NUMBER;  -- змінна для збереження сумарного стажу
    v_resume_id NUMBER; -- визначимо, для якого резюме рахувати стаж
BEGIN
    -- ВИбираємо актуальне занчення для resume_id
    v_resume_id := NVL(:NEW.resume_id, :OLD.resume_id);
    
    --розрахунок стажу в роках
    --якшо вказагна кінцева дата використаємо її(кшо немає то поточна дата)
    --якшо досвід в роках відсутній - пишемо 0 
    SELECT NVL ( SUM( MONTHS_BETWEEN(NVL(end_date, SYSDATE), start_date)/12) ,0) 
    INTO v_total
    FROM Work_Experience
    WHERE resume_id = v_resume_id; 
    
     -- оновлюємо стаж кандидата
    UPDATE Candidates
    SET total_experience_years = ROUND(v_total, 1) --округлення розрахукнку до 1 десятої
    WHERE candidate_id = (
        SELECT candidate_id
        FROM Resumes
        WHERE resume_id = v_resume_id
    );
END;
/
--2. Автоматичне оновлення total_experience у Candidates
-- Змінено на COMPOUND TRIGGER щоб уникнути помилки mutating table,
-- яка виникає при FOR EACH ROW коли тригер читає свою таблицю
CREATE OR REPLACE TRIGGER trg_check_total_experience
FOR INSERT OR UPDATE OR DELETE ON Work_Experience
COMPOUND TRIGGER  -- дозволяє розділити логіку на "для кожного рядка" і "після операції"
    -- змінна для збереження resume_id рядків, які змінювались
    TYPE t_resume_ids IS TABLE OF NUMBER;
    g_resume_ids t_resume_ids := t_resume_ids();
    
    -- Ця частина виконується для кожного рядка (FOR EACH ROW)
    AFTER EACH ROW IS
    BEGIN
        -- запам'ятовуємо resume_id зміненого рядка
        g_resume_ids.EXTEND;
        g_resume_ids(g_resume_ids.LAST) := NVL(:NEW.resume_id, :OLD.resume_id);
    END AFTER EACH ROW;

    -- виконується один раз після завершення всієї SQL операції
    AFTER STATEMENT IS
        v_total NUMBER;
    BEGIN
        FOR i IN 1 .. g_resume_ids.COUNT LOOP
            -- розрахунок сумарного стажу для resume_id
            SELECT NVL(SUM(MONTHS_BETWEEN(NVL(end_date, SYSDATE), start_date)/12),0)
            INTO v_total
            FROM Work_Experience
            WHERE resume_id = g_resume_ids(i);

            -- оновлення поля total_experience_years у Candidates
            UPDATE Candidates
            SET total_experience_years = ROUND(v_total, 1)  -- округлення до 1 десятої
            WHERE candidate_id = (
                SELECT candidate_id
                FROM Resumes
                WHERE resume_id = g_resume_ids(i)
            );
        END LOOP;
    END AFTER STATEMENT;
END trg_check_total_experience;
/




--3.Контроль віку кандидата (мінімум 16 років)
CREATE OR REPLACE TRIGGER trg_check_age
BEFORE INSERT OR UPDATE ON Candidates
FOR EACH ROW
BEGIN
    IF MONTHS_BETWEEN(SYSDATE,:NEW.birth_date)/12 <16 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Кандидат має бути не молодше 16 років');
    END IF;
END;
/

--4. Контроль founded_year у Employers
CREATE OR REPLACE TRIGGER trg_check_founded_year
BEFORE INSERT OR UPDATE ON Employers
FOR EACH ROW
BEGIN
    IF :NEW.founded_year < 1800 OR :NEW.founded_year > EXTRACT(YEAR FROM SYSDATE) THEN
        RAISE_APPLICATION_ERROR(-20005,'Рік заснування має бути між 1800 і поточним роком');
    END IF;
END;
/


--5.Автоматична деактивація вакансій при деактивації компанії
CREATE OR REPLACE TRIGGER trg_auto_deactivate_vacancies
AFTER UPDATE OF is_active ON Employers
FOR EACH ROW
WHEN (:NEW.is_active='N')
BEGIN
    UPDATE Vacancies
    SET is_active = 'N' 
    WHERE employer_id = :NEW.employer_id;
END;
/

CREATE OR REPLACE TRIGGER trg_auto_deactivate_vacancies
AFTER UPDATE OF is_active ON Employers
FOR EACH ROW
BEGIN
    IF :NEW.is_active = 'N' THEN
        UPDATE Vacancies
        SET is_active = 'N'
        WHERE employer_id = :NEW.employer_id;
    END IF;
END;
/



--6.Логічне видалення компанії (перед видаленням деактивує вакансії)
CREATE OR REPLACE TRIGGER trg_before_delete_employer
BEFORE DELETE ON Employers
FOR EACH ROW
BEGIN
    UPDATE Vacancies
    SET is_active = 'N'
    WHERE employer_id = :OLD.employer_id;
END;
/
SHOW ERRORS TRIGGER trg_before_delete_employer;

--7.Контроль вікових обмежень у Vacancies
CREATE OR REPLACE TRIGGER trg_check_age_restriction
BEFORE INSERT OR UPDATE ON Vacancies
FOR EACH ROW
DECLARE 
    v_allow_age_restriction CHAR(1);
BEGIN
    SELECT allow_age_restriction
    INTO v_allow_age_restriction
    FROM Specialties
    WHERE specialty_id = :NEW.specialty_id;

    IF v_allow_age_restriction = 'N' AND (:NEW.age_min IS NOT NULL OR :NEW.age_max IS NOT NULL) THEN
        RAISE_APPLICATION_ERROR(-20006, 'Вікові обмеження не дозволені для цієї спеціальності' );
    END IF;
    
END;
/


--8.Перевірка відповідності кандидата вимогам вакансії
CREATE OR REPLACE TRIGGER trg_warn_application_suitability
AFTER INSERT ON Applications
FOR EACH ROW 
DECLARE
    v_candidate_age NUMBER;
    v_candidate_experience NUMBER;
    v_vacancy_age_min NUMBER;
    v_vacancy_age_max NUMBER;
    v_vacancy_experience NUMBER;
    v_candidate_id NUMBER;
BEGIN
    SELECT 
        (MONTHS_BETWEEN(SYSDATE, c.birth_date)/12), 
        c.total_experience_years,
        v.age_max,
        v.age_min,
        v.experience_required
    INTO 
        v_candidate_age,
        v_candidate_experience,
        v_vacancy_age_max,
        v_vacancy_age_min,
        v_vacancy_experience
    FROM Candidates c
    JOIN Resumes r ON r.candidate_id = c.candidate_id
    JOIN Vacancies v ON v.vacancy_id = :NEW.vacancy_id
    WHERE r.resume_id = :NEW.resume_id;
    
    
    IF (v_vacancy_age_min IS NOT NULL AND v_candidate_age < v_vacancy_age_min)
       OR (v_vacancy_age_max IS NOT NULL AND v_candidate_age > v_vacancy_age_max) THEN
        DBMS_OUTPUT.PUT_LINE('Попередження: вік кандидата не в межах вікового діапазону вакансії');
    END IF;
    
    IF v_candidate_experience < v_vacancy_experience THEN
        DBMS_OUTPUT.PUT_LINE('Попередження: стаж кандидата менший за вимоги вакансії');
    END IF;
    
END;
/



--всі тригери в поточній схемі
SELECT trigger_name, table_name, status
FROM user_triggers
ORDER BY table_name;



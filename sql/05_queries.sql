---ЗАПИТИ ДО БД---
--1.Пошук усіх активних вакансій із зарплатою від 25 000 грн у Києві та Львові
SELECT 
    v.vacancy_id AS vacancy_id,
    v.title AS vacancy_title,
    e.company_name,
    s.specialty_name AS specialty, --по specialty_id в specialties
    v.salary_min || ' - ' || v.salary_max  AS salary_range,
    v.work_schedule,
    city.city_name, --по vacancy_id через vacancy_cities
    v.description,
    c.contact_name, --по employer_id в contacts
    c.phone --по employer_id в contacts
FROM Vacancies v 
JOIN Employers e 
    ON v.employer_id = e.employer_id
JOIN Contacts c 
    ON e.employer_id = c.employer_id 
    AND c.is_primary = 'Y'
JOIN Specialties s 
    ON v.specialty_id = s.specialty_id
JOIN Vacancy_Cities vcity 
    ON v.vacancy_id = vcity.vacancy_id
JOIN Cities city 
    ON vcity.city_id = city.city_id
WHERE v.is_active ='Y' 
    AND v.salary_min >= 25000
    AND city.city_name IN ('Київ', 'Львів');


--2.Підбір кандидатів на конкретну вакансію №1 (з урахуванням віку, стажу, навичок)
SELECT
    r.title AS "Назва резюме",
    s.specialty_name AS "Спеціальність",
    c.last_name || ' ' || c.first_name  || ' ' ||  NVL(c.middle_name, '') AS "ПІБ",
    r.desired_salary AS "Бажана зарплата",
    r.about AS "Про себе",
    TRUNC(MONTHS_BETWEEN(SYSDATE, c.birth_date)/12) AS "Вік", -- повних років (TRUNC відкидає дробову частину)
    city.city_name AS "Місто",
    CASE c.relocation_possible
        WHEN '0' THEN 'Не готовий до релокації'
        WHEN '1' THEN 'Готовий розгялнути релокацію'
        WHEN '2' THEN 'Тільки віддалена робота'
        ELSE ''
    END AS "Релокація",
    c.total_experience_years AS "Стаж (років)",
    sk.skills AS "Навички"
FROM Vacancies v   
JOIN Resumes r ON v.specialty_id = r.specialty_id
JOIN Candidates c ON r.candidate_id = c.candidate_id
JOIN Cities city ON c.city_id = city.city_id
JOIN Specialties s ON v.specialty_id = s.specialty_id
LEFT JOIN (
    SELECT rsk.resume_id,
        LISTAGG(sk.skill_name, ', ') WITHIN GROUP (ORDER BY sk.skill_name) AS skills
    FROM Resume_Skills rsk
    JOIN Skills sk ON rsk.skill_id = sk.skill_id
    GROUP BY resume_id
    ) sk ON r.resume_id = sk.resume_id
WHERE v.vacancy_id = 1
    AND r.is_visible = 'Y'
    AND c.is_active = 'Y'
    AND (v.age_min IS NULL OR TRUNC(MONTHS_BETWEEN(SYSDATE, c.birth_date)/12)>= v.age_min) 
    AND (v.age_max IS NULL OR TRUNC(MONTHS_BETWEEN(SYSDATE, c.birth_date)/12)<= v.age_max)
    AND (v.experience_required IS NOT NULL OR c.total_experience_years >= v.experience_required)
    AND (
        (v.work_schedule = 'Remote' AND c.relocation_possible IN ('1','2')) OR
        (v.work_schedule IN ('Full-time','Part-time','Flexible') AND c.relocation_possible IN ('0','1'))
    )
ORDER BY 
    c.total_experience_years DESC, -- спочатку з найбільшим стажем
    TRUNC(MONTHS_BETWEEN(SYSDATE, c.birth_date)/12) ASC, -- потім молодші (якщо вік важливий)
    r.desired_salary ASC;  -- потім з меншими зарплатними очікуваннями


--3.ТОП-3 найпопулярніших спеціальностей за кількістю вакансій (2025 рік)
SELECT 
    specialty_name,
    vacancy_count
FROM ( SELECT 
            s.specialty_name,
            COUNT (v.vacancy_id) AS vacancy_count,
            --спочатку згрупувало а потім ПОВЕРХ DENSE_RANK обчислює значення
            DENSE_RANK() OVER (ORDER BY COUNT (v.vacancy_id) DESC) as rnk
        FROM Vacancies v
        JOIN Specialties s ON v.specialty_id = s.specialty_id
        WHERE EXTRACT (YEAR FROM v.published_date) = 2025
        GROUP BY s.specialty_name
) WHERE rnk <= 3
ORDER BY vacancy_count DESC;


--4.Усі резюме кандидата Коваль  Олена (з освітою, досвідом, навичками)
SELECT 
    c.candidate_id,
    c.last_name || ' ' || c.first_name || ' ' || NVL(c.middle_name, '') AS full_name,
    r.resume_id,
    r.title AS resume_title,
    r.desired_salary,
    r.about,
    -- Освіта
    e.institution,
    e.degree,
    e.specialty AS edu_specialty,
    e.start_year,
    e.graduation_year,
    -- Досвід роботи
    we.company_name,
    we.position,
    we.start_date,
    we.end_date,
    we.is_current,
    we.responsibilities,
    skills
FROM Candidates c
JOIN Resumes r ON r.candidate_id = c.candidate_id
LEFT JOIN Educations e ON e.resume_id = r.resume_id
LEFT JOIN Work_Experience we ON we.resume_id = r.resume_id
LEFT JOIN(
    SELECT rsk.resume_id,
        -- Навички
        LISTAGG( (sk.skill_name || ' - ' || rsk.skill_level ),', ') AS skills
    FROM Resume_Skills rsk
    LEFT JOIN Skills sk ON rsk.skill_id = sk.skill_id 
   GROUP BY rsk.resume_id
) sk_list ON sk_list.resume_id = r.resume_id
WHERE c.first_name = 'Олена' 
  AND c.last_name = 'Коваль';
-- Якщо такого кандидата немає в даних то результат буде порожній



--5.Вакансії, на які відгукнувся кандидат №8
SELECT v.vacancy_id, v.title, v.salary_min, v.salary_max, v.work_schedule
FROM Applications a
JOIN Vacancies v ON a.vacancy_id = v.vacancy_id
WHERE a.resume_id IN (SELECT resume_id FROM Resumes WHERE candidate_id = 8);


--6.Роботодавці, що розмістили більше 4 вакансій
SELECT 
    e.employer_id, 
    e.company_name, 
    COUNT(v.vacancy_id) AS vacancy_count
FROM Employers e
JOIN Vacancies v 
    ON e.employer_id = v.employer_id
GROUP BY 
    e.employer_id, 
    e.company_name
HAVING 
    COUNT(v.vacancy_id) > 4;



--7.Кандидати віком 25-35 років з досвідом Python >= 3 роки
SELECT 
    c.candidate_id,
    c.first_name || ' ' || c.last_name AS full_name,
    TRUNC(MONTHS_BETWEEN(SYSDATE, c.birth_date)/12) AS age_years,
    c.total_experience_years,
    LISTAGG(rs.skill_level, ', ') WITHIN GROUP (ORDER BY rs.skill_level DESC) AS python_levels
FROM Candidates c
JOIN Resumes r ON c.candidate_id = r.candidate_id
JOIN Resume_Skills rs ON r.resume_id = rs.resume_id
JOIN Skills s ON rs.skill_id = s.skill_id
WHERE s.skill_name = 'Python'
  AND rs.skill_level IN ('Середній', 'Просунутий', 'Експерт')  -- тільки реальний досвід
  AND c.total_experience_years >= 3
  AND TRUNC(MONTHS_BETWEEN(SYSDATE, c.birth_date)/12) BETWEEN 25 AND 35
GROUP BY 
    c.candidate_id, 
    c.first_name, 
    c.last_name, 
    c.birth_date, 
    c.total_experience_years
ORDER BY c.total_experience_years DESC, age_years;


-- 8. Середня запропонована зарплата по кожній спеціальності (у активних вакансіях)
SELECT 
    s.specialty_name AS "Спеціальність",
    COUNT(v.vacancy_id) AS "Кількість вакансій",
    ROUND(AVG(v.salary_min), 2) AS "Середня мінімальна зп",
    ROUND(AVG(v.salary_max), 2) AS "Середня максимальна зп",
    ROUND(AVG((v.salary_min + v.salary_max) / 2), 2) AS "Середня зп (по середині діапазону)"
FROM Vacancies v
JOIN Specialties s ON v.specialty_id = s.specialty_id
WHERE v.is_active = 'Y'
  AND v.salary_min IS NOT NULL  -- на випадок, якщо зарплата не вказана
GROUP BY s.specialty_name
ORDER BY "Середня зп (по середині діапазону)" DESC;


--9.Кількість відгуків по кожній вакансії за останній місяць
SELECT v.vacancy_id,
       v.title,
       COUNT(a.application_id) AS application_count
FROM Vacancies v
LEFT JOIN Applications a
  ON v.vacancy_id = a.vacancy_id
 AND a.applied_date >= ADD_MONTHS(SYSDATE, -1)
GROUP BY v.vacancy_id, v.title
ORDER BY v.vacancy_id;



--10.Кандидати без вищої освіти, але зі стажем > 5 років
SELECT c.candidate_id, c.first_name, c.last_name, c.middle_name, c.total_experience_years
FROM Candidates c
WHERE c.total_experience_years > 3
  AND c.candidate_id NOT IN (
    SELECT DISTINCT candidate_id 
    FROM Resumes r 
    JOIN Educations e ON r.resume_id = e.resume_id 
    WHERE e.degree IN ('Бакалавр','Магістр','Спеціаліст','Доктор філософії','Доктор наук')
    );


--11.Вакансії, що вимагають English Upper–Intermediate і вище
SELECT v.vacancy_id,
       v.title,
       v.description
FROM Vacancies v
WHERE v.is_active = 'Y'
  AND ( UPPER(v.description) LIKE '%ПРОСУНУТИЙ%' 
     OR UPPER(v.description) LIKE '%ЕКСПЕРТ%'
     OR UPPER(v.description) LIKE '%UPPER%INTERMEDIATE%'
     OR UPPER(v.description) LIKE '%UPPER-INTERMEDIATE%'
     OR UPPER(v.description) LIKE '%ADVANCED%'
     OR UPPER(v.description) LIKE '%FLUENT%'
     OR UPPER(v.description) LIKE '%C1%'
     OR UPPER(v.description) LIKE '%C2%' );


--12.ТОП-3 кандидати за кількістю навичок рівня «Експерт»
SELECT candidate_id, first_name, last_name, expert_skills
FROM (
    SELECT c.candidate_id,
           c.first_name,
           c.last_name,
           COUNT(*) AS expert_skills,
           DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM Candidates c
    JOIN Resumes r ON c.candidate_id = r.candidate_id
    JOIN Resume_Skills rs ON r.resume_id = rs.resume_id
    WHERE rs.skill_level = 'Експерт'
    GROUP BY c.candidate_id, c.first_name, c.last_name
)
WHERE rnk <= 3
ORDER BY expert_skills DESC;



--13.Вакансії, на які ще ніхто не відгукнувся
SELECT v.vacancy_id, v.title
FROM Vacancies v
LEFT JOIN Applications a ON v.vacancy_id = a.vacancy_id
WHERE a.application_id IS NULL;


--14.Кандидати, які подавалися на вакансії компанії «Tech Solutions»
SELECT DISTINCT c.candidate_id, c.first_name, c.last_name
FROM Candidates c
JOIN Resumes r ON c.candidate_id = r.candidate_id
JOIN Applications a ON r.resume_id = a.resume_id
JOIN Vacancies v ON a.vacancy_id = v.vacancy_id
JOIN Employers e ON v.employer_id = e.employer_id
WHERE e.company_name = 'Tech Solutions';


--15.Рейтинг міст за кількістю активних вакансій
SELECT ci.city_name, COUNT(vc.vacancy_id) AS active_vacancies
FROM Cities ci
JOIN Vacancy_Cities vc ON ci.city_id = vc.city_id
JOIN Vacancies v ON vc.vacancy_id = v.vacancy_id
WHERE v.is_active = 'Y'
GROUP BY ci.city_name
ORDER BY active_vacancies DESC;




--16.Кандидати з двома і більше вищими освітами
SELECT c.candidate_id, c.first_name, c.last_name, COUNT(DISTINCT e.education_id) AS degrees_count
FROM Candidates c
JOIN Resumes r ON c.candidate_id = r.candidate_id
JOIN Educations e ON r.resume_id = e.resume_id
WHERE e.degree IN ('Бакалавр','Магістр','Спеціаліст','Доктор філософії','Доктор наук')
GROUP BY c.candidate_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT e.education_id) >= 2
ORDER BY degrees_count DESC;


--17.Вакансії з гнучким графіком або віддаленою роботою з інформацією про компанію та місто
SELECT 
    v.vacancy_id,
    v.title AS vacancy_title,
    v.work_schedule,
    e.company_name,
    c.city_name
FROM Vacancies v
JOIN Employers e ON v.employer_id = e.employer_id
JOIN Vacancy_Cities vc ON v.vacancy_id = vc.vacancy_id
JOIN Cities c ON vc.city_id = c.city_id
WHERE v.work_schedule IN ('Flexible','Remote');


-- 18. Кількість успішних відгуків (статус "Прийнято") по місяцях
SELECT 
    TO_CHAR(a.applied_date, 'YYYY-MM') AS місяць,
    COUNT(*) AS кількість_прийнятих_кандидатів
FROM Applications a
JOIN Application_Status s ON a.application_status_id = s.application_status_id
WHERE s.application_status_name = 'Прийнято'
GROUP BY TO_CHAR(a.applied_date, 'YYYY-MM')
ORDER BY місяць;



--19.Кандидати, у яких загальний стаж > 7 років і зарплатні очікування <= 60 000
SELECT c.candidate_id, c.first_name, c.last_name, r.desired_salary, c.total_experience_years
FROM Candidates c
JOIN Resumes r ON c.candidate_id = r.candidate_id
WHERE c.total_experience_years > 7 AND r.desired_salary <= 60000;


--20.Найактивніші кандидати (кількість відгуків > 5)
SELECT c.candidate_id, c.first_name, c.last_name, COUNT(a.application_id) AS applications_count
FROM Candidates c
JOIN Resumes r ON c.candidate_id = r.candidate_id
JOIN Applications a ON r.resume_id = a.resume_id
GROUP BY c.candidate_id, c.first_name, c.last_name
HAVING COUNT(a.application_id) > 5;


--21. Вакансії, де мінімальна ЗП вища за середню бажану ЗП кандидатів тієї спеціальності
--виводимо середню бажану ЗП для порівняння
SELECT 
    v.vacancy_id,
    v.title,
    v.salary_min AS мінімальна_зп_у_вакансії,
    sp.specialty_name AS спеціальність,
    ROUND(avg_desired.avg_salary, 2) AS середня_бажана_зп_кандидатів
FROM Vacancies v
JOIN Specialties sp ON v.specialty_id = sp.specialty_id
LEFT JOIN (
    -- Підзапит середня бажана ЗП по резюме для кожної спеціальності
    SELECT 
        specialty_id,
        AVG(desired_salary) AS avg_salary
    FROM Resumes
    WHERE desired_salary IS NOT NULL
    GROUP BY specialty_id
) avg_desired ON avg_desired.specialty_id = v.specialty_id
WHERE v.salary_min > NVL(avg_desired.avg_salary, 0)
ORDER BY v.salary_min DESC;


--22.Кандидати, у яких є досвід роботи в компаніях–конкурентах (наприклад, EPAM, GlobalLogic)
SELECT DISTINCT c.candidate_id, c.first_name, c.last_name, w.company_name
FROM Candidates c
JOIN Resumes r ON c.candidate_id = r.candidate_id
JOIN Work_Experience w ON r.resume_id = w.resume_id
WHERE UPPER(w.company_name) LIKE 'EPAM%'
    OR UPPER(w.company_name) LIKE 'GLOBALLOGIC%';



--23.Статистика по статусам відгуків (Новий / На розгляді / Співбесіда / Відмова / Прийнято)
SELECT s.application_status_name, COUNT(a.application_id) AS count_applications
FROM Applications a
JOIN Application_Status s ON a.application_status_id = s.application_status_id
GROUP BY s.application_status_name;


--24. ТОП-10 роботодавців за середньою зарплатою у вакансіях
SELECT 
    e.employer_id,
    e.company_name AS компанія,
    ROUND(AVG((v.salary_min + v.salary_max)/2), 2) AS середня_зарплата
FROM Employers e
JOIN Vacancies v ON e.employer_id = v.employer_id
WHERE v.salary_min IS NOT NULL AND v.salary_max IS NOT NULL  -- на випадок NULL
GROUP BY e.employer_id, e.company_name
ORDER BY середня_зарплата DESC
FETCH FIRST 10 ROWS ONLY;  



--25.Повний звіт по вакансії (компанія, вимоги, міста, кількість відгуків, успішні кандидати)
SELECT
    v.vacancy_id,
    v.title,
    e.company_name,
    v.description,
    ca.cities,
    NVL(ac.total_applications, 0) AS total_applications,
    NVL(sc.successful_candidates, 0) AS successful_candidates
FROM Vacancies v
JOIN Employers e ON v.employer_id = e.employer_id
-- Міста вакансії
LEFT JOIN (
    SELECT
        vc.vacancy_id,
        LISTAGG(c.city_name, ', ')
            WITHIN GROUP (ORDER BY c.city_name) AS cities
    FROM Vacancy_Cities vc
    JOIN Cities c ON vc.city_id = c.city_id
    GROUP BY vc.vacancy_id
) ca ON v.vacancy_id = ca.vacancy_id
-- Загальна кількість відгуків
LEFT JOIN (
    SELECT
        vacancy_id,
        COUNT(*) AS total_applications
    FROM Applications
    GROUP BY vacancy_id
) ac ON v.vacancy_id = ac.vacancy_id
-- Успішні кандидати
LEFT JOIN (
    SELECT
        a.vacancy_id,
        COUNT(*) AS successful_candidates
    FROM Applications a
    JOIN Application_Status s
        ON a.application_status_id = s.application_status_id
    WHERE s.application_status_name = 'Прийнято'
    GROUP BY a.vacancy_id
) sc ON v.vacancy_id = sc.vacancy_id
ORDER BY total_applications DESC;






SELECT * FROM v$version;


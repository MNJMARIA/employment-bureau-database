--СТВОРЕННЯ ПРЕДСТАВЛЕНЬ--

-- 1. v_active_vacancies
-- Активні вакансії (компанія, зарплата, міста, спеціальність)
CREATE OR REPLACE VIEW v_active_vacancies AS
SELECT 
    v.vacancy_id,
    v.title AS vacancy_title,
    e.company_name,
    s.specialty_name AS specialty,
    v.salary_min,
    v.salary_max,
    v.salary_min || ' - ' || NVL(v.salary_max, '') AS salary_range,
    v.work_schedule,
    cities_agg.cities,
    v.description 
FROM Vacancies v
JOIN Employers e ON v.employer_id = e.employer_id
JOIN Specialties s ON v.specialty_id = s.specialty_id
LEFT JOIN (
    SELECT 
        vc.vacancy_id,
        LISTAGG(ci.city_name, ', ') WITHIN GROUP (ORDER BY ci.city_name) AS cities
    FROM Vacancy_Cities vc
    JOIN Cities ci ON vc.city_id = ci.city_id
    GROUP BY vc.vacancy_id
) cities_agg ON v.vacancy_id = cities_agg.vacancy_id
WHERE v.is_active = 'Y';

SELECT * FROM v_active_vacancies

-- 2. v_candidate_full_profile
-- Повний профіль кандидата (ПІБ, резюме, освіта, досвід, навички)
CREATE OR REPLACE VIEW v_candidate_full_profile AS
SELECT 
    c.candidate_id,
    c.last_name || ' ' || c.first_name || ' ' || NVL(c.middle_name, '') AS full_name,
    r.resume_id,
    r.title AS resume_title,
    r.desired_salary,
    ci.city_name AS city,
    TRUNC(MONTHS_BETWEEN(SYSDATE, c.birth_date)/12) AS age, 
    c.total_experience_years AS experience_years,
    e.institution,
    e.degree,
    CASE 
        WHEN e.start_year IS NOT NULL THEN TO_CHAR(e.start_year) || ' - ' || NVL(TO_CHAR(e.graduation_year), 'по теперішній час')
        ELSE NULL
    END AS education_period,
    we.company_name AS prev_company,
    we.position AS prev_position,
    CASE 
        WHEN we.start_date IS NOT NULL THEN TO_CHAR(we.start_date, 'DD.MM.YYYY') || ' - ' || NVL(TO_CHAR(we.end_date, 'DD.MM.YYYY'), 'по теперішній час')
        ELSE NULL
    END AS work_period,
    sk.skills
FROM Candidates c
JOIN Resumes r ON c.candidate_id = r.candidate_id
LEFT JOIN Cities ci ON c.city_id = ci.city_id
LEFT JOIN Educations e ON r.resume_id = e.resume_id
LEFT JOIN Work_Experience we ON r.resume_id = we.resume_id
LEFT JOIN (
    SELECT resume_id,
           LISTAGG(skill_name || ' - ' || skill_level, ', ') 
               WITHIN GROUP (ORDER BY skill_level DESC, skill_name) AS skills
    FROM Resume_Skills rs
    JOIN Skills s ON rs.skill_id = s.skill_id
    GROUP BY resume_id
) sk ON r.resume_id = sk.resume_id
WHERE r.is_visible = 'Y' AND c.is_active = 'Y';


-- 3. v_vacancy_matches
-- Підбір кандидатів під конкретну вакансію (на основі запиту №2)
CREATE OR REPLACE VIEW v_vacancy_matches AS
SELECT 
    v.vacancy_id,
    v.title AS vacancy_title,
    c.candidate_id,
    c.last_name || ' ' || c.first_name AS candidate_name,
    TRUNC(MONTHS_BETWEEN(SYSDATE, c.birth_date)/12) AS age,
    c.total_experience_years AS experience_years,
    r.desired_salary,
    sk.skills
FROM Vacancies v
JOIN Resumes r ON v.specialty_id = r.specialty_id
JOIN Candidates c ON r.candidate_id = c.candidate_id
LEFT JOIN (
    SELECT resume_id, 
        LISTAGG(skill_name, ', ') WITHIN GROUP (ORDER BY skill_name) AS skills
    FROM Resume_Skills rs 
    JOIN Skills s ON rs.skill_id = s.skill_id
    GROUP BY resume_id
) sk ON r.resume_id = sk.resume_id
WHERE r.is_visible = 'Y'
  AND c.is_active = 'Y'
  AND (v.age_min IS NULL OR TRUNC(MONTHS_BETWEEN(SYSDATE, c.birth_date)/12) >= v.age_min)
  AND (v.age_max IS NULL OR TRUNC(MONTHS_BETWEEN(SYSDATE, c.birth_date)/12) <= v.age_max)
  AND (v.experience_required IS NULL OR c.total_experience_years >= v.experience_required);


-- 4. v_specialty_statistics
-- Статистика по спеціальностях - вакансії, резюме, середня ЗП
CREATE OR REPLACE VIEW v_specialty_statistics AS
SELECT 
    s.specialty_name,
    COUNT(DISTINCT v.vacancy_id) AS vacancies_count,
    COUNT(DISTINCT r.resume_id) AS resumes_count,
    ROUND(AVG(v.salary_min), 2) AS avg_salary_min,
    ROUND(AVG(v.salary_max), 2) AS avg_salary_max,
    ROUND(AVG((v.salary_min + v.salary_max)/2), 2) AS avg_salary_mid,
    ROUND(AVG(r.desired_salary), 2) AS avg_desired_salary
FROM Specialties s
LEFT JOIN Vacancies v ON s.specialty_id = v.specialty_id AND v.is_active = 'Y'
LEFT JOIN Resumes r ON s.specialty_id = r.specialty_id AND r.is_visible = 'Y'
GROUP BY s.specialty_name;

SELECT * FROM v_specialty_statistics

-- 5. v_application_summary
-- Звіт по відгукам - вакансія, кількість відгуків, статусів, прийнятих
CREATE OR REPLACE VIEW v_application_summary AS
SELECT 
    v.vacancy_id,
    v.title,
    e.company_name,
    COUNT(a.application_id) AS total_applications,
    COUNT(CASE 
            WHEN st.application_status_name = 'Прийнято' THEN 1 
            END) AS accepted,
    COUNT(CASE 
            WHEN st.application_status_name = 'Інтерв''ю' THEN 1 
            END) AS interviews,
    COUNT(CASE 
            WHEN st.application_status_name = 'Відхилено' THEN 1 
            END) AS rejected
FROM Vacancies v
JOIN Employers e ON v.employer_id = e.employer_id
LEFT JOIN Applications a ON v.vacancy_id = a.vacancy_id
LEFT JOIN Application_Status st ON a.application_status_id = st.application_status_id
GROUP BY v.vacancy_id, v.title, e.company_name;


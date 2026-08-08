---ІМПОРТ ДАНИХ---

--Specialties
INSERT INTO Specialties (specialty_name, category, allow_age_restriction) VALUES ('Програмування', 'IT', 'Y');
INSERT INTO Specialties (specialty_name, category, allow_age_restriction) VALUES ('Маркетинг', 'Маркетинг', 'N');
INSERT INTO Specialties (specialty_name, category, allow_age_restriction) VALUES ('Дизайн', 'IT', 'Y');
INSERT INTO Specialties (specialty_name, category, allow_age_restriction) VALUES ('Фінанси', 'Бізнес', 'N');
INSERT INTO Specialties (specialty_name, category, allow_age_restriction) VALUES ('HR', 'Менеджмент', 'N');
INSERT INTO Specialties (specialty_name, category, allow_age_restriction) VALUES ('Продажі', 'Маркетинг', 'Y');
INSERT INTO Specialties (specialty_name, category, allow_age_restriction) VALUES ('Юриспруденція', 'Бізнес', 'N');
INSERT INTO Specialties (specialty_name, category, allow_age_restriction) VALUES ('Аналітика', 'IT', 'Y');
INSERT INTO Specialties (specialty_name, category, allow_age_restriction) VALUES ('Логістика', 'Менеджмент', 'N');
INSERT INTO Specialties (specialty_name, category, allow_age_restriction) VALUES ('Сервіс', 'Обслуговування', 'Y');




-- Cities
INSERT INTO Cities (city_name, region) VALUES ('Київ', 'Київська');
INSERT INTO Cities (city_name, region) VALUES ('Львів', 'Львівська');
INSERT INTO Cities (city_name, region) VALUES ('Одеса', 'Одеська');
INSERT INTO Cities (city_name, region) VALUES ('Харків', 'Харківська');
INSERT INTO Cities (city_name, region) VALUES ('Дніпро', 'Дніпропетровська');
INSERT INTO Cities (city_name, region) VALUES ('Вінниця', 'Вінницька');
INSERT INTO Cities (city_name, region) VALUES ('Чернігів', 'Чернігівська');
INSERT INTO Cities (city_name, region) VALUES ('Полтава', 'Полтавська');
INSERT INTO Cities (city_name, region) VALUES ('Івано-Франківськ', 'Івано-Франківська');
INSERT INTO Cities (city_name, region) VALUES ('Херсон', 'Херсонська');



-- Skills
INSERT INTO Skills (skill_name) VALUES ('Java');
INSERT INTO Skills (skill_name) VALUES ('Python');
INSERT INTO Skills (skill_name) VALUES ('Excel');
INSERT INTO Skills (skill_name) VALUES ('Photoshop');
INSERT INTO Skills (skill_name) VALUES ('PowerPoint');
INSERT INTO Skills (skill_name) VALUES ('SQL');
INSERT INTO Skills (skill_name) VALUES ('Marketing');
INSERT INTO Skills (skill_name) VALUES ('Sales');
INSERT INTO Skills (skill_name) VALUES ('Project Management');
INSERT INTO Skills (skill_name) VALUES ('Communication');
INSERT INTO Skills (skill_name) VALUES ('Figma');
INSERT INTO Skills (skill_name) VALUES ('C#');



-- Application_Status
INSERT INTO Application_Status (application_status_name) VALUES ('Подано');
INSERT INTO Application_Status (application_status_name) VALUES ('Розглядається');
INSERT INTO Application_Status (application_status_name) VALUES ('Відхилено');
INSERT INTO Application_Status (application_status_name) VALUES ('Прийнято');
INSERT INTO Application_Status (application_status_name) VALUES ('Інтерв''ю');
INSERT INTO Application_Status (application_status_name) VALUES ('На паузі');
INSERT INTO Application_Status (application_status_name) VALUES ('Скасовано');
INSERT INTO Application_Status (application_status_name) VALUES ('Очікує рішення');
INSERT INTO Application_Status (application_status_name) VALUES ('В процесі');
INSERT INTO Application_Status (application_status_name) VALUES ('Завершено');

-- Interview_Status
INSERT INTO Interview_Status (interview_status_name) VALUES ('Заплановано');
INSERT INTO Interview_Status (interview_status_name) VALUES ('Проведено');
INSERT INTO Interview_Status (interview_status_name) VALUES ('Скасовано');
INSERT INTO Interview_Status (interview_status_name) VALUES ('Відкладено');
INSERT INTO Interview_Status (interview_status_name) VALUES ('Пройдено успішно');
INSERT INTO Interview_Status (interview_status_name) VALUES ('Пройдено неуспішно');
INSERT INTO Interview_Status (interview_status_name) VALUES ('Очікує');
INSERT INTO Interview_Status (interview_status_name) VALUES ('На повторне інтерв''ю');
INSERT INTO Interview_Status (interview_status_name) VALUES ('В процесі');
INSERT INTO Interview_Status (interview_status_name) VALUES ('Завершено');

-- Interview_Types
INSERT INTO Interview_Types (interview_type_name) VALUES ('Телефонне інтерв''ю');
INSERT INTO Interview_Types (interview_type_name) VALUES ('Онлайн інтерв''ю');
INSERT INTO Interview_Types (interview_type_name) VALUES ('Особиста зустріч');
INSERT INTO Interview_Types (interview_type_name) VALUES ('Групове інтерв''ю');
INSERT INTO Interview_Types (interview_type_name) VALUES ('Технічне завдання');
INSERT INTO Interview_Types (interview_type_name) VALUES ('Практичне завдання');
INSERT INTO Interview_Types (interview_type_name) VALUES ('Кейс-інтерв''ю');
INSERT INTO Interview_Types (interview_type_name) VALUES ('Психологічне інтерв''ю');
INSERT INTO Interview_Types (interview_type_name) VALUES ('HR-інтерв''ю');
INSERT INTO Interview_Types (interview_type_name) VALUES ('Фінальне інтерв''ю');

-- Employers
INSERT INTO Employers (company_name, legal_form, industry, address, website, about, founded_year, employee_count, is_verified) 
VALUES ('Tech Solutions', 'ТОВ', 'IT', 'Київ, вул. Шевченка 10', 'www.techsolutions.ua', 'IT-компанія з розробки софту', 2010, 120, 'Y');
INSERT INTO Employers (company_name, legal_form, industry, address, website, about, founded_year, employee_count, is_verified) 
VALUES ('MarketPro', 'ПАТ', 'Маркетинг', 'Львів, вул. Січових Стрільців 15', 'www.marketpro.ua', 'Агентство цифрового маркетингу', 2005, 50, 'Y');
INSERT INTO Employers (company_name, legal_form, industry, address, website, about, founded_year, employee_count, is_verified) 
VALUES ('DesignHub', 'ФОП', 'Дизайн', 'Одеса, вул. Дерибасівська 22', 'www.designhub.ua', 'Студія графічного дизайну', 2018, 15, 'N');
INSERT INTO Employers (company_name, legal_form, industry, address, website, about, founded_year, employee_count, is_verified) 
VALUES ('FinanceCorp', 'ТОВ', 'Фінанси', 'Харків, вул. Сумська 40', 'www.financecorp.ua', 'Фінансова компанія', 2000, 80, 'Y');
INSERT INTO Employers (company_name, legal_form, industry, address, website, about, founded_year, employee_count, is_verified) 
VALUES ('HR Experts', 'ПрАТ', 'HR', 'Дніпро, вул. Гоголя 11', 'www.hrexperts.ua', 'HR-консалтинг', 2012, 20, 'Y');
INSERT INTO Employers (company_name, legal_form, industry, address, website, about, founded_year, employee_count, is_verified) 
VALUES ('SalesForce', 'ТОВ', 'Продажі', 'Вінниця, вул. Соборна 5', 'www.salesforce.ua', 'Компанія з продажу та консалтингу', 2015, 30, 'N');
INSERT INTO Employers (company_name, legal_form, industry, address, website, about, founded_year, employee_count, is_verified) 
VALUES ('LegalAid', 'ПП', 'Юриспруденція', 'Чернігів, вул. Мстиславська 12', 'www.legalaid.ua', 'Юридичні послуги', 2008, 25, 'Y');
INSERT INTO Employers (company_name, legal_form, industry, address, website, about, founded_year, employee_count, is_verified) 
VALUES ('AnalyticsPro', 'ТОВ', 'Аналітика', 'Полтава, вул. Леніна 3', 'www.analyticspro.ua', 'Консалтинг та аналітика', 2016, 18, 'Y');
INSERT INTO Employers (company_name, legal_form, industry, address, website, about, founded_year, employee_count, is_verified) 
VALUES ('LogisticsPlus', 'ТОВ', 'Логістика', 'Івано-Франківськ, вул. Франка 7', 'www.logisticsplus.ua', 'Логістична компанія', 2011, 40, 'Y');
INSERT INTO Employers (company_name, legal_form, industry, address, website, about, founded_year, employee_count, is_verified) 
VALUES ('ServiceCenter', 'КП', 'Сервіс', 'Херсон, вул. Потьомкінська 9', 'www.servicecenter.ua', 'Сервісна компанія', 2013, 22, 'N');

-- Contacts 
INSERT INTO Contacts (employer_id, contact_name, position, phone, email, is_primary) VALUES (1,'Іваненко Олександр','HR менеджер','+380501112233','ivanenko@techsolutions.ua','Y');
INSERT INTO Contacts (employer_id, contact_name, position, phone, email, is_primary) VALUES (2,'Петренко Марія','HR спеціаліст','+380631234567','petrenko@marketpro.ua','Y');
INSERT INTO Contacts (employer_id, contact_name, position, phone, email, is_primary) VALUES (3,'Сидоренко Олег','Керівник','+380671112345','sidorenko@designhub.ua','Y');
INSERT INTO Contacts (employer_id, contact_name, position, phone, email, is_primary) VALUES (4,'Ковальчук Ірина','Фінансовий директор','+380991112233','kovalchuk@financecorp.ua','Y');
INSERT INTO Contacts (employer_id, contact_name, position, phone, email, is_primary) VALUES (5,'Мельник Сергій','HR консультант','+380631112244','melnik@hrexperts.ua','Y');
INSERT INTO Contacts (employer_id, contact_name, position, phone, email, is_primary) VALUES (6,'Ткаченко Олексій','Менеджер з продажу','+380501223344','tkachenko@salesforce.ua','Y');
INSERT INTO Contacts (employer_id, contact_name, position, phone, email, is_primary) VALUES (7,'Козак Наталія','Юрист','+380971112233','kozak@legalaid.ua','Y');
INSERT INTO Contacts (employer_id, contact_name, position, phone, email, is_primary) VALUES (8,'Бойко Дмитро','Аналітик','+380631112355','boyko@analyticspro.ua','Y');
INSERT INTO Contacts (employer_id, contact_name, position, phone, email, is_primary) VALUES (9,'Дмитренко Олена','Логіст','+380501112366','dmytrenko@logisticsplus.ua','Y');
INSERT INTO Contacts (employer_id, contact_name, position, phone, email, is_primary) VALUES (10,'Гнатенко Світлана','Менеджер сервісу','+380971112377','hnatenko@servicecenter.ua','Y');

--Candidates
INSERT INTO Candidates (first_name, middle_name, last_name, birth_date, phone, email, city_id)
VALUES ('Олена', 'Ігорівна', 'Коваль', DATE '1998-05-14', '+380501000001', 'koval1@gmail.com', 1);
INSERT INTO Candidates (first_name, middle_name, last_name, birth_date, phone, email, city_id, is_active, relocation_possible, total_experience_years) VALUES ('Андрій',NULL,'Шевченко',DATE '1995-03-22','+380501000002','shevchenko@gmail.com',2,'Y','1',0);
INSERT INTO Candidates (first_name, middle_name, last_name, birth_date, phone, email, city_id, is_active, relocation_possible, total_experience_years) VALUES ('Марія','Олександрівна','Петренко',DATE '2000-11-01','+380501000003','petrenko@gmail.com',3,'Y','0',0);
INSERT INTO Candidates (first_name, middle_name, last_name, birth_date, phone, email, city_id, is_active, relocation_possible, total_experience_years) VALUES ('Іван',NULL,'Бондар',DATE '1992-07-10','+380501000004','bondar@gmail.com',4,'Y','2',0);
INSERT INTO Candidates (first_name, middle_name, last_name, birth_date, phone, email, city_id, is_active, relocation_possible, total_experience_years) VALUES ('Наталія','Сергіївна','Мельник',DATE '1999-01-30','+380501000005','melnyk@gmail.com',5,'Y','1',0);
INSERT INTO Candidates (first_name, middle_name, last_name, birth_date, phone, email, city_id, is_active, relocation_possible, total_experience_years) VALUES ('Олег',NULL,'Ткаченко',DATE '1990-09-18','+380501000006','tkachenko@gmail.com',6,'Y','2',0);
INSERT INTO Candidates (first_name, middle_name, last_name, birth_date, phone, email, city_id, is_active, relocation_possible, total_experience_years) VALUES ('Ірина','Володимирівна','Кравчук',DATE '1997-12-05','+380501000007','kravchuk@gmail.com',7,'Y','0',0);
INSERT INTO Candidates (first_name, middle_name, last_name, birth_date, phone, email, city_id, is_active, relocation_possible, total_experience_years) VALUES ('Дмитро',NULL,'Савченко',DATE '1994-06-21','+380501000008','savchenko@gmail.com',8,'Y','1',0);
INSERT INTO Candidates (first_name, middle_name, last_name, birth_date, phone, email, city_id, is_active, relocation_possible, total_experience_years) VALUES ('Юлія','Олегівна','Романюк',DATE '2001-02-14','+380501000009','romanyuk@gmail.com',9,'Y','0',0);
INSERT INTO Candidates (first_name, middle_name, last_name, birth_date, phone, email, city_id, is_active, relocation_possible, total_experience_years) VALUES ('Максим',NULL,'Лисенко',DATE '1996-10-08','+380501000010','lysenko@gmail.com',10,'Y','2',0);
INSERT INTO Candidates (first_name, middle_name, last_name, birth_date, phone, email, city_id)
VALUES ('Ігор', null, 'Андрієць', DATE '1996-08-17', '+380501000011', 'andihor@gmail.com', 1);

INSERT INTO Candidates
(first_name, middle_name, last_name, birth_date, phone, email, city_id,
 is_active, relocation_possible, total_experience_years)
VALUES
('Сергій', NULL, 'Мороз', DATE '1988-04-12',
 '+380501000099', 'moroz@gmail.com', 1,
 'Y', '1', 6);
 

--Resumes
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about)
VALUES (1,'Junior Java Developer',1,25000,'Початковий рівень Java');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (2,'Marketing Manager',2,22000,'Досвід у digital-маркетингу',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (3,'Graphic Designer',3,20000,'Photoshop та Figma',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (4,'Financial Analyst',4,30000,'Фінансовий аналіз',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (5,'HR Specialist',5,21000,'Підбір персоналу',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (6,'Sales Manager',6,24000,'B2B продажі',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (7,'Lawyer',7,28000,'Господарське право',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (8,'Data Analyst',8,32000,'SQL, Excel',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (9,'Logistics Coordinator',9,23000,'Планування перевезень',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (10,'Customer Support',10,18000,'Робота з клієнтами',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (1,'Junior C# Developer',1,18000,'Амбітний початківець у C#',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (8,'Senior Python Developer',1,75000,'Досвід у написанні коду на Python',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (11,'Middle Python Developer',1,45000,'Хобі - створення застосунків на Python',SYSDATE,'Y');
INSERT INTO Resumes (candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible) VALUES (11,'Middle Python Developer',1,45000,'Тест резюме на Python',SYSDATE,'N');

INSERT INTO Resumes
(candidate_id, title, specialty_id, desired_salary, about, created_date, is_visible)
VALUES
(12, 'Senior Sales Manager', 6, 35000,
 'Понад 6 років досвіду у продажах без вищої освіти',
 SYSDATE, 'Y');


--Educations
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, graduation_year)
VALUES (1,'КПІ ім. Ігоря Сікорського','ІТ','Інженерія програмного забезпечення','Бакалавр',2024,2028);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, graduation_year) VALUES (2,'КНУ ім. Шевченка','ІТ','Компʼютерні науки','Бакалавр',2016,2020);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, is_current, current_year, graduation_year) VALUES (3,'ЛНУ','Маркетинг','Маркетинг','Магістр',2015,'N',NULL,2019);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, is_current, current_year, graduation_year) VALUES (4,'ОНАХТ','Дизайн','Графічний дизайн','Бакалавр',2017,'N',NULL,2021);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, is_current, current_year, graduation_year) VALUES (5,'ХНЕУ','Фінанси','Фінанси','Магістр',2012,'N',NULL,2017);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, is_current, current_year, graduation_year) VALUES (6,'ДНУ','Психологія','HR','Бакалавр',2016,'N',NULL,2020);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, is_current, current_year, graduation_year) VALUES (7,'ВНТУ','Економіка','Продажі','Бакалавр',2014,'N',NULL,2018);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, is_current, current_year, graduation_year) VALUES (8,'ЧНУ','Право','Юриспруденція','Магістр',2013,'N',NULL,2018);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, is_current, current_year, graduation_year) VALUES (9,'ПНТУ','Аналітика','Data Science','Магістр',2017,'N',NULL,2022);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, is_current, current_year, graduation_year) VALUES (10,'ІФНТУНГ','Логістика','Логістика','Бакалавр',2016,'N',NULL,2020);

-- Кандидат з resume_id = 1 має дві освіти
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, graduation_year)
VALUES (1,'КНУ ім. Шевченка','ІТ','Компʼютерні науки','Магістр',2028,2030);

INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, graduation_year)
VALUES (12,'КПІ ім. Ігоря Сікорського','ІТ','Інженерія програмного забезпечення','Бакалавр',2022,2026);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, graduation_year)
VALUES (12,'КПІ ім. Ігоря Сікорського','ІТ','Інженерія програмного забезпечення','Магістр',2026,2028);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, graduation_year)
VALUES (13,'КПІ ім. Ігоря Сікорського','ІТ','Інженерія програмного забезпечення','Бакалавр',2020,2024);
INSERT INTO Educations (resume_id, institution, faculty, specialty, degree, start_year, is_current, current_year, graduation_year) VALUES (7,'ЧНУ','Право','Юриспруденція','Бакалавр',2018,'N',NULL,2022);


--Work_Experience
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current)
VALUES (1, 'SoftServe', 'Trainee Java Dev', DATE '2021-01-01', NULL, 'Y');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (2, 'MarketPro', 'Marketing Specialist', DATE '2020-02-01', DATE '2022-01-01', 'N', 'Digital campaigns');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (3, 'DesignHub', 'Designer', DATE '2021-03-01', DATE '2023-03-01', 'N', 'Branding');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (4, 'FinanceCorp', 'Analyst', DATE '2018-05-01', NULL, 'Y', 'Reports');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (5, 'HR Experts', 'Recruiter', DATE '2020-06-01', DATE '2022-12-01', 'N', 'Hiring');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (6, 'SalesForce', 'Sales Manager', DATE '2019-04-01', NULL, 'Y', 'B2B');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (7, 'LegalAid', 'Lawyer', DATE '2018-01-01', NULL, 'Y', 'Legal support');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (8, 'AnalyticsPro', 'Data Analyst', DATE '2020-09-01', NULL, 'Y', 'Analytics');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (9, 'LogisticsPlus', 'Coordinator', DATE '2019-11-01', DATE '2021-10-01', 'N', 'Logistics');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (10, 'ServiceCenter', 'Support Agent', DATE '2021-02-01', NULL, 'Y', 'Clients');

INSERT INTO Work_Experience
(resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES
(15, 'BigSales Ltd', 'Sales Manager',
 DATE '2017-01-01', NULL, 'Y',
 'Активні B2B продажі, ведення клієнтів');

-- Досвід роботи в компаніях-конкурентах
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (12, 'EPAM Systems', 'Senior Python Developer', DATE '2020-03-01', DATE '2023-06-30', 'N', 'Розробка backend-сервісів на Python, Django, мікросервіси');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (13, 'GlobalLogic', 'Middle Python Developer', DATE '2021-09-01', DATE '2023-12-31', 'N', 'Розробка API, інтеграції, робота з AWS');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (8, 'SoftServe', 'Data Analyst', DATE '2018-06-01', DATE '2020-08-31', 'N', 'Аналіз даних, SQL-запити, звітність у Tableau');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (1, 'Luxoft', 'Junior Java Developer', DATE '2022-01-01', DATE '2023-12-31', 'N', 'Розробка на Java Spring, підтримка legacy-коду');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (11, 'EPAM Systems', 'Junior .NET Developer', DATE '2023-01-01', DATE '2024-06-30', 'N', 'Розробка на C#, ASP.NET, підтримка веб-додатків');
INSERT INTO Work_Experience (resume_id, company_name, position, start_date, end_date, is_current, responsibilities)
VALUES (15, 'GlobalLogic', 'Technical Sales Manager', DATE '2019-01-01', DATE '2021-12-31', 'N', 'Продажі IT-послуг, робота з міжнародними клієнтами');

--Vacancies
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (1, 'Java Developer', 1, 25000, 40000, 1, NULL, NULL, NULL, 'Full-time', NULL, 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (2, 'Marketing Manager', 2, 22000, 35000, 2, NULL, NULL, NULL, 'Remote', NULL, 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (3, 'UI Designer', 3, 20000, 30000, 1, NULL, NULL, NULL, 'Full-time', NULL, 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (4, 'Financial Analyst', 4, 30000, 45000, 3, NULL, NULL, NULL, 'Full-time', NULL, 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (5, 'HR Specialist', 5, 21000, 32000, 1, NULL, NULL, NULL, 'Flexible', NULL, 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (6, 'Sales Manager', 6, 23000, 38000, 2, NULL, NULL, NULL, 'Full-time', NULL, 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (7, 'Lawyer', 7, 28000, 42000, 3, NULL, NULL, NULL, 'Full-time', NULL, 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (8, 'Data Analyst', 8, 32000, 50000, 2, NULL, NULL, NULL, 'Remote', NULL, 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (9, 'Logistics Manager', 9, 24000, 36000, 2, NULL, NULL, NULL, 'Full-time', NULL, 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (10, 'Customer Support', 10, 18000, 25000, 0, NULL, NULL, NULL, 'Part-time', NULL, 'Y', SYSDATE);

-- Додаткові вакансії
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (1, 'Python Developer', 1, 30000, 60000, 2, NULL, 20, 35, 'Full-time', 'Розробка на Python', 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (3, 'UI/UX Designer', 3, 25000, 40000, 2, NULL, 22, 40, 'Full-time', 'Дизайн інтерфейсів', 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (8, 'Data Scientist', 8, 40000, 70000, 3, NULL, 23, 38, 'Remote', 'Аналітика та машинне навчання', 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (1, 'Junior Python Developer', 1, 20000, 35000, 0, NULL, 18, 30, 'Full-time', 'Початковий рівень Python', 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (6, 'Sales Executive', 6, 22000, 38000, 1, NULL, NULL, NULL, 'Full-time', 'Продажі B2B', 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (2, 'Digital Marketing Specialist', 2, 25000, 40000, 2, NULL, NULL, NULL, 'Remote', 'Маркетинг у соцмережах', 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (3, 'Senior C# Developer', 1, 50000, 80000, 4, NULL, 25, 40, 'Full-time', 'Розробка на C#', 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (4, 'Financial Controller', 4, 35000, 50000, 3, NULL, NULL, NULL, 'Full-time', 'Контроль фінансів компанії', 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (5, 'HR Manager', 5, 25000, 40000, 2, NULL, NULL, NULL, 'Flexible', 'Управління персоналом', 'Y', SYSDATE);
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES (8, 'Machine Learning Engineer', 8, 45000, 75000, 3, NULL, 23, 40, 'Remote', 'Розробка алгоритмів ШІ', 'Y', SYSDATE);

UPDATE Vacancies
SET description =
    NVL(description, '') ||
    ' Вимоги: знання англійської мови на рівні не нижче Середнього.'
WHERE specialty_id = 1;

UPDATE Vacancies
SET description =
    NVL(description, '') ||
    ' Обовʼязкове володіння англійською мовою на рівні Просунутий.'
WHERE specialty_id = 8;

UPDATE Vacancies
SET description =
    NVL(description, '') ||
    ' English B2'
WHERE specialty_id = 6;

UPDATE Vacancies
SET is_active = 'N'
WHERE vacancy_id IN (3, 7, 10);



-- Нові вакансії
INSERT INTO Vacancies (employer_id, title, specialty_id, salary_min, salary_max, experience_required, education_level, age_min, age_max, work_schedule, description, is_active, published_date)
VALUES 
(1, 'Frontend Developer', 1, 27000, 45000, 2, NULL, NULL, NULL, 'Full-time', 'Розробка фронтенду веб-додатків. Англійська рівня C1', 'Y', SYSDATE),
(2, 'SEO Specialist', 2, 20000, 35000, 1, NULL, NULL, NULL, 'Remote', 'Оптимізація сайтів та контенту', 'Y', SYSDATE),
(3, 'Graphic Designer Junior', 3, 18000, 30000, 0, NULL, NULL, NULL, 'Full-time', 'Початковий рівень графічного дизайну', 'Y', SYSDATE),
(4, 'Accountant', 4, 25000, 40000, 2, NULL, NULL, NULL, 'Full-time', 'Ведення бухгалтерії та фінансової звітності', 'Y', SYSDATE),
(5, 'HR Coordinator', 5, 22000, 35000, 1, NULL, NULL, NULL, 'Flexible', 'Координація HR процесів', 'Y', SYSDATE),
(6, 'Sales Representative', 6, 21000, 38000, 1, NULL, NULL, NULL, 'Full-time', 'Продажі продуктів та послуг', 'N', SYSDATE),
(7, 'Junior Lawyer', 7, 24000, 40000, 0, NULL, NULL, NULL, 'Full-time', 'Підготовка юридичних документів', 'Y', SYSDATE),
(8, 'Business Analyst', 8, 32000, 50000, 2, NULL, NULL, NULL, 'Remote', 'Аналіз бізнес-процесів та даних', 'Y', SYSDATE),
(9, 'Logistics Assistant', 9, 20000, 32000, 1, NULL, NULL, NULL, 'Full-time', 'Підтримка логістичних операцій', 'Y', SYSDATE),
(10, 'Customer Support Specialist', 10, 18000, 25000, 0, NULL, NULL, NULL, 'Part-time', 'Обслуговування клієнтів', 'N', SYSDATE);

-- Прив'язка нових вакансій до міст
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (48, 3); -- Одеса 23
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (49, 4); -- Харків
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (50, 5); -- Дніпро
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (51, 6); -- Вінниця
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (52, 7); -- Чернігів
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (53, 8); -- Полтава
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (54, 9); -- Івано-Франківськ
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (55, 10); -- Херсон
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (56, 1); -- Київ
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (57, 2); -- Львів

--Vacancy_Cities
INSERT INTO Vacancy_Cities VALUES (1,1);
INSERT INTO Vacancy_Cities VALUES (2,2);
INSERT INTO Vacancy_Cities VALUES (3,3);
INSERT INTO Vacancy_Cities VALUES (4,4);
INSERT INTO Vacancy_Cities VALUES (5,5);
INSERT INTO Vacancy_Cities VALUES (6,6);
INSERT INTO Vacancy_Cities VALUES (7,7);
INSERT INTO Vacancy_Cities VALUES (8,1);
INSERT INTO Vacancy_Cities VALUES (9,9);
INSERT INTO Vacancy_Cities VALUES (10,10);

-- Resume_Skills
-- Junior Java Developer
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (1, 1, 'Початковий'); -- Java
-- Marketing Manager
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (2, 6, 'Середній'); -- Marketing
-- Graphic Designer
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (3, 4, 'Середній'); -- Photoshop
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (3, 5, 'Середній');  
-- Financial Analyst
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (4, 3, 'Середній'); -- Excel
-- HR Specialist
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (5, 10, 'Середній'); -- Communication (приклад для HR)
-- Sales Manager
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (6, 8, 'Середній'); -- Sales
-- Lawyer
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (7, 7, 'Середній'); 
-- Data Analyst
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (8, 6, 'Середній'); -- SQL
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (8, 3, 'Середній'); -- Excel
-- Logistics Coordinator
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (9, 9, 'Середній'); -- Project Managemen
-- Customer Support
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (10, 10, 'Початковий'); -- Communication
-- Junior C# Developer
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (11, 1, 'Початковий'); -- Java 
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (11, 12, 'Середній'); -- C#
-- Senior Python Developer
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (12, 2, 'Експерт'); -- Python
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (12, 6, 'Експерт'); -- SQL
-- Middle Python Developer
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (13, 2, 'Середній'); -- Python
INSERT INTO Resume_Skills (resume_id, skill_id, skill_level) VALUES (14, 2, 'Початковий'); -- Python 
-- Resume 8 – Data Analyst
INSERT INTO Resume_Skills VALUES (8, 2, 'Експерт'); -- Python
INSERT INTO Resume_Skills VALUES (8, 10, 'Середній'); -- Communication
-- Resume 13 – Middle Python Developer
INSERT INTO Resume_Skills VALUES (13, 6, 'Експерт'); -- SQL
INSERT INTO Resume_Skills VALUES (13, 10, 'Середній'); -- Communication
-- Resume 1 – Junior Java Developer
INSERT INTO Resume_Skills VALUES (1, 12, 'Середній'); -- C#





-- Resume 1 (Junior Java Developer)  Java Developer
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, cover_letter)
VALUES (1, 1, 1, 'Зацікавлений у позиції Junior Java Developer');
-- Resume 1  Junior Python Developer
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (1, 14, 2);
-- Resume 2 (Marketing Manager)  Marketing Manager
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (2, 2, 4);
-- Resume 2  Digital Marketing Specialist
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (2, 16, 2);
-- Resume 3 (Graphic Designer)  UI Designer
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (3, 3, 5);
-- Resume 3  UI/UX Designer
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (3, 12, 2);
-- Resume 4 (Financial Analyst)  Financial Analyst
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (4, 4, 4);
-- Resume 4  Financial Controller
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (4, 18, 2);
-- Resume 5 (HR Specialist)  HR Specialist
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (5, 5, 3);
-- Resume 5  HR Manager
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (5, 19, 2);
-- Resume 6 (Sales Manager)  Sales Manager
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (6, 6, 4);
-- Resume 6  Sales Executive
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (6, 15, 2);
-- Resume 8 (Data Analyst)  Data Analyst
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (8, 8, 4);
-- Resume 8  Data Scientist
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (8, 13, 5);
-- Resume 8  Machine Learning Engineer
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (8, 20, 2);

-- Resume 7 (Lawyer) -  Lawyer
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, cover_letter)
VALUES (7, 7, 1, 'Маю досвід у господарському праві та супроводі компаній');

-- Resume 9 (Logistics Coordinator) - Logistics Manager
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (9, 9, 2);

-- Resume 10 (Customer Support)- Customer Support
INSERT INTO Applications (resume_id, vacancy_id, application_status_id)
VALUES (10, 10, 4);


-- ще відгуки на Java Developer (vacancy_id = 1)
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date)
VALUES (11, 1, 1, SYSDATE - 5);

INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date)
VALUES (12, 1, 2, SYSDATE - 10);

INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date)
VALUES (13, 1, 1, SYSDATE - 20);





TRUNCATE TABLE Vacancy_Cities;

ALTER TABLE Vacancy_Cities
MODIFY pk_vacancy_cities
GENERATED BY DEFAULT AS IDENTITY
(RESTART START WITH 1);

SELECT constraint_name, search_condition
FROM user_constraints
WHERE table_name = 'VACANCIES'
  AND constraint_type = 'C';




SELECT * FROM Vacancies


-- Нові вакансії в жовтні 2025 (2 штуки, обидві активні)
INSERT INTO Vacancies (
    employer_id, title, specialty_id, 
    salary_min, salary_max, experience_required, 
    work_schedule, description, is_active, published_date
) VALUES (
    1, 'Senior Java Developer', 1, 
    50000, 80000, 5, 
    'Full-time', 'Розробка backend на Java, мікросервіси', 'Y', 
    TO_DATE('2025-10-15', 'YYYY-MM-DD')
);

INSERT INTO Vacancies (
    employer_id, title, specialty_id, 
    salary_min, salary_max, experience_required, 
    work_schedule, description, is_active, published_date
) VALUES (
    2, 'Content Manager', 2, 
    25000, 40000, 2, 
    'Remote', 'Створення контенту для соцмереж та сайту', 'Y', 
    TO_DATE('2025-10-25', 'YYYY-MM-DD')
);

-- Нові вакансії в листопаді 2025 (3 штуки)
-- Одна з них  неактивна
INSERT INTO Vacancies (
    employer_id, title, specialty_id, 
    salary_min, salary_max, experience_required, 
    work_schedule, description, is_active, published_date
) VALUES (
    1, 'DevOps Engineer', 1, 
    45000, 70000, 3, 
    'Full-time', 'CI/CD, Kubernetes, AWS', 'Y', 
    TO_DATE('2025-11-05', 'YYYY-MM-DD')
);

INSERT INTO Vacancies (
    employer_id, title, specialty_id, 
    salary_min, salary_max, experience_required, 
    work_schedule, description, is_active, published_date
) VALUES (
    8, 'Senior Data Analyst', 8, 
    45000, 65000, 4, 
    'Remote', 'Поглиблений аналіз даних, Tableau/Power BI', 'Y', 
    TO_DATE('2025-11-12', 'YYYY-MM-DD')
);

-- Ця вакансія в листопаді буде неактивною
INSERT INTO Vacancies (
    employer_id, title, specialty_id, 
    salary_min, salary_max, experience_required, 
    work_schedule, description, is_active, published_date
) VALUES (
    3, 'Lead UI/UX Designer', 3, 
    40000, 60000, 5, 
    'Full-time', 'Керівництво командою дизайнерів, Figma', 'N',  -- неактивна
    TO_DATE('2025-11-20', 'YYYY-MM-DD')
);


-- Прив'язка нових вакансій до міст
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (58, 1); -- Senior Java Developer - Київ
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (59, 2); -- Content Manager - Львів
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (60, 1); -- DevOps Engineer - Київ
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (61, 1); -- Senior Data Analyst - Київ
INSERT INTO Vacancy_Cities (vacancy_id, city_id) VALUES (62, 3); -- Lead UI/UX Designer - Одеса


-- Відгуки на вакансії з жовтня (58 і 59) - по 3-4 штуки
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (1, 58, 1, TO_DATE('2025-10-16', 'YYYY-MM-DD')); -- Подано
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (11, 58, 2, TO_DATE('2025-10-18', 'YYYY-MM-DD')); -- Розглядається
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (12, 58, 4, TO_DATE('2025-10-20', 'YYYY-MM-DD')); -- Прийнято

INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (2, 59, 1, TO_DATE('2025-10-26', 'YYYY-MM-DD'));
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (3, 59, 2, TO_DATE('2025-10-28', 'YYYY-MM-DD'));
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (8, 59, 4, TO_DATE('2025-10-30', 'YYYY-MM-DD')); -- Прийнято

-- Відгуки на активні вакансії листопада (60 і 61)
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (12, 60, 1, TO_DATE('2025-11-06', 'YYYY-MM-DD'));
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (13, 60, 2, TO_DATE('2025-11-08', 'YYYY-MM-DD'));

INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (8, 61, 4, TO_DATE('2025-11-13', 'YYYY-MM-DD')); -- Прийнято
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (4, 61, 1, TO_DATE('2025-11-15', 'YYYY-MM-DD'));

-- Відгуки на НЕАКТИВНУ вакансію листопада (62) - 4 відгуки, з них 2 з статусом "Прийнято"
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (3, 62, 4, TO_DATE('2025-11-21', 'YYYY-MM-DD')); -- Прийнято
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (11, 62, 4, TO_DATE('2025-11-22', 'YYYY-MM-DD')); -- Прийнято
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (1, 62, 3, TO_DATE('2025-11-23', 'YYYY-MM-DD')); -- Відхилено
INSERT INTO Applications (resume_id, vacancy_id, application_status_id, applied_date) VALUES (12, 62, 2, TO_DATE('2025-11-24', 'YYYY-MM-DD')); -- Розглядається


COMMIT;

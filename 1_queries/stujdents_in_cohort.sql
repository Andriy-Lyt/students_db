SELECT id, name FROM students WHERE cohort_id = 1 ORDER BY name;
SELECT count(id) FROM students WHERE cohort_id BETWEEN 1 AND 3;
SELECT id, name, cohort_id FROM students WHERE email IS NULL OR phone IS NULL;
SELECT id, name, email, cohort_id FROM students WHERE email NOT LIKE '%gmail.com' OR phone IS NULL;
SELECT id, name, cohort_id FROM students WHERE end_date IS NULL ORDER BY cohort_id;
SELECT name, email, phone FROM students WHERE end_date > IS NOT NULL AND github IS NULL;
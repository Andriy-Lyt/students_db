SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100;

SELECT day, count(id) as total_assignments  
FROM assignments
GROUP BY day
HAVING count(id) >= 10
ORDER BY day;

SELECT cohorts.name, count(students.name) as student_count 
FROM students 
JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING count(students.name) >= 18
ORDER BY count(students.name);

SELECT cohorts.name, count(a_s.*) as total_submissions 
FROM assignment_submissions a_s
JOIN students ON a_s.student_id = students.id 
JOIN cohorts ON students.cohort_id = cohorts.id 
GROUP BY cohorts.name
ORDER BY count(a_s.*) DESC;

SELECT students.name as student, avg(a_s.duration) as duration
FROM students
JOIN assignment_submissions a_s ON a_s.student_id = students.id 
-- WHERE students.end_date = NULL
GROUP BY students.name
ORDER BY count(a_s.duration) DESC;

SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;
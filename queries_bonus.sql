-- 1. Contare quanti iscritti ci sono stati ogni anno

SELECT count(id), enrolment_date -- SELECT YEAR(`enrolment_date`), COUNT(*)
FROM `students`
GROUP BY `enrolment_date`;

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT count(id), office_address -- SELECT `office_address`, COUNT (*)
FROM teachers
GROUP BY office_address;

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT `exam_id`, AVG(`vote`)
FROM `exam_student`
GROUP BY `exam_id`

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT `department_id`, COUNT (*)
FROM `degrees`
GROUP BY `department_id`
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

-- SECONDA PARTE

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami

SELECT `students`.`id`, `students`.`name`, `students`.`surname`, `courses`.`name` AS `course_name`, `courses`.`id` AS `course_id`, COUNT(`exam_student`.`vote`), MAX(`exam_student`.`vote`)
FROM `students`
INNER JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
INNER JOIN `exams`
ON `exam_student`.`exam_id` = `exams`.`id`
INNER JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
GROUP BY `students`.`id`, `courses`.`id`
HAVING MAX(`exam_student`.`vote`) >= 18
ORDER BY `students`.`id`, `courses`.`name`;
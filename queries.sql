-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT *
FROM `students`
WHERE `date_of_birth` LIKE "1990%" --WHERE YEAR (`date_of_birth`) = 1990;

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT *
FROM `courses`
WHERE `cfu` > 10;

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT *, DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(), date_of_birth)), '%Y') + 1 AS age
FROM students;
/* SELECT `id`, `name`, `surname`, `date_of_birth`, TIMESTAMPDIFF(YEAR, `date_of_birth, CURDATE())
 FROM `students`
 WHERE TIMESTAMPDIFF (YEAR, `date_of_birth`, CURDATE()) > 30
 ORDER BY `age`*/

/* 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286)*/

SELECT *
FROM `courses`
WHERE `period` LIKE "I semestre"
AND year = 1;

/*5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020 (21)*/

SELECT `date`, `hour`
FROM `exams`
WHERE `hour` > "14:00:00"
AND `date` = "2020-06-20";


-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT *
FROM `degrees`
WHERE `level` = "magistrale";

-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(*)
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT *
FROM `teachers`
WHERE `phone` IS NULL;

                                -- SECONDA PARTE

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `students`.`name` AS `student_name`, `surname`, `degrees`.`name` AS `degree_name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`id` = `degrees`.`id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT `degrees`.`name` AS `degree_name`, `level`, `departments`.`name` AS `department_name`
FROM `courses`
INNER JOIN `degrees`
ON `courses`.`id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze'
AND `degrees`.`level` = 'magistrale';


-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `teachers`.`name` AS `teacher_name`, `surname`, `courses`.`name` AS `course_name`, `description`, `cfu`
FROM `teachers`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
WHERE `course_teacher`.`teacher_id` = 44;

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`name` AS `student_name`, `surname`, `degrees`.`name` AS `degree_name`, `level`, `departments`.`name` AS `department_name`
FROM `students`
INNER JOIN `degrees`
ON `students`.`id` = `degrees`.`id`
INNER JOIN `departments`
ON `degrees`.`id` = `departments`.`id`
ORDER BY `students`.`surname`, `students`.`name` ASC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `teachers`.`name` AS `teacher_name`, `surname`, `courses`.`name` AS `course_name`, `description`, `period`, `year`, `cfu`, `degrees`.`name` AS `degree_name`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`course_id`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `degrees`
ON `courses`.`id` = `degrees`.`id`;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

SELECT DISTINCT `teachers`.*, `departments`.`name` AS `department_name`
FROM `departments`
INNER JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `departments`.`name` = 'Dipartimento di Matematica'
ORDER BY `teachers`.`surname`, `teachers`.`name`





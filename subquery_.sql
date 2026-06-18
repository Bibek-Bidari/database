use lms_db;
drop database lms_db;

create database lms_db;
create database lms_db;
use lms_db;

create table students (
student_id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(100),
registration_date date,
country varchar(50)
);

create table instructors (
instructor_id int auto_increment primary key,
instructor_name varchar(100),
specialization varchar(100),
joining_date date
);

create table courses (
course_id int auto_increment primary key,
course_name varchar(100),
category varchar(50),
course_fee decimal(10,2),
instructor_id int,
foreign key (instructor_id) references instructors(instructor_id)
);

create table enrollments (
enrollment_id int auto_increment primary key,
student_id int,
course_id int,
enrollment_date date,
completion_status varchar(20),
foreign key (student_id) references students(student_id),
foreign key (course_id) references courses(course_id)
);

create table assignments (
assignment_id int auto_increment primary key,
course_id int,
assignment_title varchar(100),
max_marks int,
due_date date,
foreign key (course_id) references courses(course_id)
);

create table assignment_submissions (
submission_id int auto_increment primary key,
assignment_id int,
student_id int,
marks_obtained int,
submission_date date,
foreign key (assignment_id) references assignments(assignment_id),
foreign key (student_id) references students(student_id)
);

create table payments (
payment_id int auto_increment primary key,
student_id int,
amount_paid decimal(10,2),
payment_date date,
payment_method varchar(20),
foreign key (student_id) references students(student_id)
);

insert into students values
(1,'aarav','sharma','aarav1@gmail.com','2024-01-10','nepal'),
(2,'sita','thapa','sita2@gmail.com','2024-01-12','nepal'),
(3,'ram','kc','ram3@gmail.com','2024-01-15','nepal'),
(4,'nabin','shrestha','nabin4@gmail.com','2024-01-18','nepal'),
(5,'priya','gautam','priya5@gmail.com','2024-01-20','nepal'),
(6,'suman','rai','suman6@gmail.com','2024-01-22','nepal'),
(7,'anita','lama','anita7@gmail.com','2024-01-25','nepal'),
(8,'bishal','gurung','bishal8@gmail.com','2024-01-28','nepal'),
(9,'karan','adhikari','karan9@gmail.com','2024-02-01','nepal'),
(10,'rohan','karki','rohan10@gmail.com','2024-02-03','nepal'),
(11,'dipika','shah','dipika11@gmail.com','2024-02-05','nepal'),
(12,'sandip','pandey','sandip12@gmail.com','2024-02-07','nepal'),
(13,'manish','bhatta','manish13@gmail.com','2024-02-09','nepal'),
(14,'smriti','neupane','smriti14@gmail.com','2024-02-11','nepal'),
(15,'yogesh','poudel','yogesh15@gmail.com','2024-02-13','nepal'),
(16,'alina','shrestha','alina16@gmail.com','2024-02-15','nepal'),
(17,'sagar','thapa','sagar17@gmail.com','2024-02-17','nepal'),
(18,'meera','kc','meera18@gmail.com','2024-02-19','nepal'),
(19,'dipesh','rai','dipesh19@gmail.com','2024-02-21','nepal'),
(20,'kritika','lama','kritika20@gmail.com','2024-02-23','nepal');

insert into instructors values
(1,'john doe','programming','2022-01-01'),
(2,'jane smith','data science','2022-02-01'),
(3,'michael lee','web development','2022-03-01'),
(4,'sarah khan','database','2022-04-01'),
(5,'david roy','ai','2022-05-01'),
(6,'emma stone','cloud','2022-06-01'),
(7,'robert brown','cyber security','2022-07-01'),
(8,'lisa ray','mobile development','2022-08-01');

insert into courses values
(1,'python basics','programming',5000,1),
(2,'advanced python','programming',8000,1),
(3,'data science intro','data science',9000,2),
(4,'machine learning','data science',12000,2),
(5,'web design','web development',6000,3),
(6,'react js','web development',7000,3),
(7,'sql fundamentals','database',4000,4),
(8,'advanced sql','database',6500,4),
(9,'ai basics','ai',11000,5),
(10,'deep learning','ai',15000,5),
(11,'cloud basics','cloud',7500,6),
(12,'aws advanced','cloud',10000,6),
(13,'network security','cyber security',8500,7),
(14,'ethical hacking','cyber security',9500,7),
(15,'android dev','mobile development',7000,8);

insert into enrollments values
(1,1,1,'2024-02-01','completed'),
(2,2,1,'2024-02-02','pending'),
(3,3,2,'2024-02-03','completed'),
(4,4,2,'2024-02-04','pending'),
(5,5,3,'2024-02-05','completed'),
(6,6,3,'2024-02-06','pending'),
(7,7,4,'2024-02-07','completed'),
(8,8,4,'2024-02-08','pending'),
(9,9,5,'2024-02-09','completed'),
(10,10,5,'2024-02-10','pending'),
(11,11,6,'2024-02-11','completed'),
(12,12,6,'2024-02-12','pending'),
(13,13,7,'2024-02-13','completed'),
(14,14,7,'2024-02-14','pending'),
(15,15,8,'2024-02-15','completed'),
(16,16,8,'2024-02-16','pending'),
(17,17,9,'2024-02-17','completed'),
(18,18,9,'2024-02-18','pending'),
(19,19,10,'2024-02-19','completed'),
(20,20,10,'2024-02-20','pending'),
(21,1,11,'2024-02-21','completed'),
(22,2,11,'2024-02-22','pending'),
(23,3,12,'2024-02-23','completed'),
(24,4,12,'2024-02-24','pending'),
(25,5,13,'2024-02-25','completed'),
(26,6,13,'2024-02-26','pending'),
(27,7,14,'2024-02-27','completed'),
(28,8,14,'2024-02-28','pending'),
(29,9,15,'2024-03-01','completed'),
(30,10,15,'2024-03-02','pending'),
(31,11,1,'2024-03-03','completed'),
(32,12,2,'2024-03-04','pending'),
(33,13,3,'2024-03-05','completed'),
(34,14,4,'2024-03-06','pending'),
(35,15,5,'2024-03-07','completed'),
(36,16,6,'2024-03-08','pending'),
(37,17,7,'2024-03-09','completed'),
(38,18,8,'2024-03-10','pending'),
(39,19,9,'2024-03-11','completed'),
(40,20,10,'2024-03-12','pending'),
(41,1,3,'2024-03-13','completed'),
(42,2,4,'2024-03-14','pending'),
(43,3,5,'2024-03-15','completed'),
(44,4,6,'2024-03-16','pending'),
(45,5,7,'2024-03-17','completed'),
(46,6,8,'2024-03-18','pending'),
(47,7,9,'2024-03-19','completed'),
(48,8,10,'2024-03-20','pending'),
(49,9,11,'2024-03-21','completed'),
(50,10,12,'2024-03-22','pending');

insert into assignments values
(1,1,'intro python quiz',100,'2024-03-01'),
(2,1,'python loops',100,'2024-03-02'),
(3,2,'oop concepts',100,'2024-03-03'),
(4,2,'python project',100,'2024-03-04'),
(5,3,'data cleaning',100,'2024-03-05'),
(6,3,'eda task',100,'2024-03-06'),
(7,4,'ml regression',100,'2024-03-07'),
(8,4,'ml classification',100,'2024-03-08'),
(9,5,'html basics',100,'2024-03-09'),
(10,5,'css styling',100,'2024-03-10'),
(11,6,'react components',100,'2024-03-11'),
(12,6,'react project',100,'2024-03-12'),
(13,7,'sql select',100,'2024-03-13'),
(14,7,'sql joins',100,'2024-03-14'),
(15,8,'advanced queries',100,'2024-03-15'),
(16,8,'indexing',100,'2024-03-16'),
(17,9,'ai intro',100,'2024-03-17'),
(18,9,'search algorithms',100,'2024-03-18'),
(19,10,'neural nets',100,'2024-03-19'),
(20,10,'deep learning project',100,'2024-03-20'),
(21,11,'cloud basics',100,'2024-03-21'),
(22,11,'vm setup',100,'2024-03-22'),
(23,12,'aws services',100,'2024-03-23'),
(24,12,'deployment',100,'2024-03-24'),
(25,13,'network basics',100,'2024-03-25'),
(26,13,'firewall config',100,'2024-03-26'),
(27,14,'ethical hacking intro',100,'2024-03-27'),
(28,14,'penetration testing',100,'2024-03-28'),
(29,15,'android ui',100,'2024-03-29'),
(30,15,'android project',100,'2024-03-30');

insert into assignment_submissions values
(1,1,1,85,'2024-03-02'),
(2,1,2,78,'2024-03-02'),
(3,2,3,90,'2024-03-03'),
(4,2,4,88,'2024-03-03'),
(5,3,5,75,'2024-03-04'),
(6,3,6,80,'2024-03-04'),
(7,4,7,92,'2024-03-05'),
(8,4,8,81,'2024-03-05'),
(9,5,9,77,'2024-03-06'),
(10,5,10,84,'2024-03-06'),
(11,6,11,89,'2024-03-07'),
(12,6,12,91,'2024-03-07'),
(13,7,13,73,'2024-03-08'),
(14,7,14,76,'2024-03-08'),
(15,8,15,88,'2024-03-09'),
(16,8,16,79,'2024-03-09'),
(17,9,17,85,'2024-03-10'),
(18,9,18,82,'2024-03-10'),
(19,10,19,90,'2024-03-11'),
(20,10,20,87,'2024-03-11'),
(21,1,1,80,'2024-03-12'),
(22,2,2,75,'2024-03-12'),
(23,3,3,92,'2024-03-13'),
(24,4,4,89,'2024-03-13'),
(25,5,5,78,'2024-03-14'),
(26,6,6,81,'2024-03-14'),
(27,7,7,85,'2024-03-15'),
(28,8,8,88,'2024-03-15'),
(29,9,9,90,'2024-03-16'),
(30,10,10,86,'2024-03-16'),
(31,11,11,91,'2024-03-17'),
(32,12,12,84,'2024-03-17'),
(33,13,13,79,'2024-03-18'),
(34,14,14,83,'2024-03-18'),
(35,15,15,88,'2024-03-19'),
(36,16,16,90,'2024-03-19'),
(37,17,17,85,'2024-03-20'),
(38,18,18,87,'2024-03-20'),
(39,19,19,92,'2024-03-21'),
(40,20,20,89,'2024-03-21'),
(41,1,5,80,'2024-03-22'),
(42,2,6,78,'2024-03-22'),
(43,3,7,88,'2024-03-23'),
(44,4,8,85,'2024-03-23'),
(45,5,9,82,'2024-03-24'),
(46,6,10,84,'2024-03-24'),
(47,7,11,90,'2024-03-25'),
(48,8,12,91,'2024-03-25'),
(49,9,13,87,'2024-03-26'),
(50,10,14,86,'2024-03-26'),
(51,11,15,88,'2024-03-27'),
(52,12,16,89,'2024-03-27'),
(53,13,17,90,'2024-03-28'),
(54,14,18,85,'2024-03-28'),
(55,15,19,83,'2024-03-29'),
(56,16,20,87,'2024-03-29'),
(57,17,1,89,'2024-03-30'),
(58,18,2,90,'2024-03-30'),
(59,19,3,91,'2024-03-31'),
(60,20,4,88,'2024-03-31'),
(61,1,6,85,'2024-04-01'),
(62,2,7,86,'2024-04-01'),
(63,3,8,87,'2024-04-02'),
(64,4,9,88,'2024-04-02'),
(65,5,10,89,'2024-04-03'),
(66,6,11,90,'2024-04-03'),
(67,7,12,91,'2024-04-04'),
(68,8,13,92,'2024-04-04'),
(69,9,14,85,'2024-04-05'),
(70,10,15,86,'2024-04-05'),
(71,11,16,87,'2024-04-06'),
(72,12,17,88,'2024-04-06'),
(73,13,18,89,'2024-04-07'),
(74,14,19,90,'2024-04-07'),
(75,15,20,91,'2024-04-08'),
(76,16,1,92,'2024-04-08'),
(77,17,2,85,'2024-04-09'),
(78,18,3,86,'2024-04-09'),
(79,19,4,87,'2024-04-10'),
(80,20,5,88,'2024-04-10');

insert into payments values
(1,1,5000,'2024-02-01','esewa'),
(2,2,5000,'2024-02-02','khalti'),
(3,3,8000,'2024-02-03','esewa'),
(4,4,8000,'2024-02-04','bank'),
(5,5,9000,'2024-02-05','esewa'),
(6,6,9000,'2024-02-06','khalti'),
(7,7,12000,'2024-02-07','esewa'),
(8,8,12000,'2024-02-08','bank'),
(9,9,6000,'2024-02-09','esewa'),
(10,10,6000,'2024-02-10','khalti'),
(11,11,7000,'2024-02-11','esewa'),
(12,12,7000,'2024-02-12','bank'),
(13,13,4000,'2024-02-13','esewa'),
(14,14,4000,'2024-02-14','khalti'),
(15,15,6500,'2024-02-15','esewa'),
(16,16,6500,'2024-02-16','bank'),
(17,17,11000,'2024-02-17','esewa'),
(18,18,11000,'2024-02-18','khalti'),
(19,19,15000,'2024-02-19','esewa'),
(20,20,15000,'2024-02-20','bank'),
(21,1,5000,'2024-03-01','esewa'),
(22,2,8000,'2024-03-02','khalti'),
(23,3,9000,'2024-03-03','esewa'),
(24,4,12000,'2024-03-04','bank'),
(25,5,6000,'2024-03-05','esewa'),
(26,6,7000,'2024-03-06','khalti'),
(27,7,4000,'2024-03-07','esewa'),
(28,8,6500,'2024-03-08','bank'),
(29,9,11000,'2024-03-09','esewa'),
(30,10,15000,'2024-03-10','khalti'),
(31,11,7500,'2024-03-11','esewa'),
(32,12,10000,'2024-03-12','bank'),
(33,13,8500,'2024-03-13','esewa'),
(34,14,9500,'2024-03-14','khalti'),
(35,15,7000,'2024-03-15','esewa'),
(36,16,5000,'2024-03-16','bank'),
(37,17,8000,'2024-03-17','esewa'),
(38,18,9000,'2024-03-18','khalti'),
(39,19,12000,'2024-03-19','esewa'),
(40,20,11000,'2024-03-20','bank');

select * from students
where student_id in (
select student_id from payments
where amount_paid > (select avg(amount_paid) from payments)
);

select * from courses
where course_fee > (select avg(course_fee) from courses);

select * from instructors
where instructor_id in (
select instructor_id from courses
where course_fee = (select max(course_fee) from courses)
);

select * from students
where student_id in (
select student_id from enrollments
where course_id = (select course_id from courses order by course_fee desc limit 1)
);

select * from assignments
where max_marks > (select avg(max_marks) from assignments);

select * from students
where student_id in (
select distinct student_id from assignment_submissions
);

select * from students
where student_id not in (
select distinct student_id from assignment_submissions
);

select * from courses
where course_id in (
select distinct course_id from enrollments
);

select * from courses
where course_id not in (
select distinct course_id from enrollments
);

select * from instructors
where instructor_id not in (
select distinct instructor_id from courses
);

select * from students s
where (
select sum(amount_paid) from payments p
where p.student_id = s.student_id
) > (
select avg(total_paid) from (
select sum(amount_paid) as total_paid from payments group by student_id
) t
);
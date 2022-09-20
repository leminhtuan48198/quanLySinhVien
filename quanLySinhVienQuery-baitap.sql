create database QuanLySinhVien;
use QuanLySinhVien;
create table Class(
ClassID int not null auto_increment primary key,
ClassName varchar(60) not null,
StartDate Datetime not null,
Status Bit
);
create table Student(
StudentID int not null primary key auto_increment,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
Status bit,
ClassID int not null,
foreign key(ClassID) references class(ClassID)
);
create table Subject(
SubId int not null primary key auto_increment,
SubName varchar(30) not null,
Credit tinyint not null default 1,
check(Credit >=1),
Status bit default 1
);
create table Mark(
MarkID int not null primary key auto_increment,
SubID int not null ,
StudentID int not null ,
Mark float default 0,
check(Mark between 0 and 100),
ExamTimes tinyint default 1,
foreign key(SubID) references Subject(SubID),
foreign key(StudentID) references Student(StudentID)
);

use quanlysinhvien;
insert into class value (1,'A1','2008/12/08',1),
						(2,'A2','2008/12/08',1),
                        (3,'B3',current_date,0);
insert into student value(1,'Hung','Ha Noi','0912113113',1,1),
						(2,'Hoa','Hai Phong',null,1,1),
                        (3,'Manh','HCM','0123123123',0,2);
insert into subject values(1,'CF',5,1),
                          (2,'C',6,1),
                          (3,'HDJ',5,1),
                          (4,'RDBMS',10,1);
insert into mark values(1,1,1,8,1);
insert into mark values	(2,1,2,10,2);
insert into mark values(3,2,1,12,1);
select * from student;
select * from student where status=1;
select * from subject where credit<10;
select student.studentName, class.classname 
from student join class on student.classid=class.classid
where class.classname='A1';
select student.studentName, subject.subname,mark.mark
from mark join student on mark.studentid=student.studentid
join subject on mark.subid=subject.subid
where subject.subname='CF';
select * from student where studentname like 'h%';
select * from class
where startdate like '%-12-%';
select * from subject
where credit between 3 and 5;

update student set classid =2 where StudentID=1;
select student.studentName, subject.subname, mark.mark
from mark join student on mark.studentid=student.studentid 
join subject on mark.subid=subject.subid
order by mark.mark desc, student.studentName asc;

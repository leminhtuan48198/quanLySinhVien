use quanLysinhvien;
select address, count(studentid) as 'number of student'
from student 
group by address;
select student.studentId, student.studentName, avg(mark.mark) as 'Average mark'
from student left join mark on student.StudentID=mark.StudentID
group by student.StudentID;
select student.studentId, student.studentName, avg(mark.mark) as AverageMark
from student left join mark on student.StudentID=mark.StudentID
group by student.StudentID
having AverageMark>15;
select student.studentId, student.studentName, avg(mark.mark) as AverageMark
from student left join mark on student.StudentID=mark.StudentID
group by student.StudentID
having AverageMark>= all (select avg(mark) from mark group by studentid);
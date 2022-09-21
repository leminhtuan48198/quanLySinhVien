use quanlysinhvien;
select *
from subject
where credit=  ( select max(Credit) from subject);
select * from subject join mark on subject.subid=mark.SubID
where mark.mark = (select max(mark) from mark);
select *, avg(mark.mark) as AverageMark 
from student 
left join mark on student.StudentID=mark.StudentID
group by student.StudentID
order by averageMark desc;

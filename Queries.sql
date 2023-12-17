select 
a.Name, a.Surename, 
case 
	when a.Gender like 'M' then 'MUŠKI'
	when a.Gender like 'F' then 'ŽENSKI'
	when a.Gender like 'O' then 'OSTALO'
	else 'NEPOZNATO' 
	end,
c.Name, c.AverageWage
from Authors a
join Countries c on a.Country = c.Id
/*1*/

select b.Name, ab.PublicationDate,
(select STRING_AGG( a.Name || ' ' || substring(a.Surename from 0 for 2) || '.' , ' ; ') from authors a
	where(select count(*) from AuthorBook ab
		  where( ab.AuthorId = a.Id and ab.BookId = b.Id)) >= 1)
from books b 
join authorBook ab on b.Id = ab.BOOKId
/*2*/

select distinct b.Id, b.Name, rb.* from books b
left join(
	select * from ReaderBook rb
	where rb.BorrowDate between timestamp '2023/12/1' and timestamp '2024/1/1' 
) rb on rb.BookId = b.id 
order by b.Id

/*3*/

select l.Name, (select count(*) from Books b where b.LibraryId = l.Id)
from libraries l
order by(select count(*) from Books b where b.LibraryId = l.Id) desc
limit 3

/*4*/

select b.Id, b.Name, 
(select Count(*) from ReaderBook rb where b.Id = rb.BookId and rb.BookReturned = true)
from Books b
order by (select count(*) from ReaderBook rb where b.Id = rb.BookId and rb.BookReturned = true) desc

/*5*/

select r.Name from Readers r
where (select Count(*) from ReaderBook rb where r.Id = rb.ReaderId and rb.BookReturned = false)>0

/*6*/

select * from authors a
where 0 < (select Count(*) from AuthorBook ab 
		   where a.Id = ab.AuthorId and ab.PublicationDate between timestamp '2019/1/1' and timestamp '2022/1/1')

/*7*/

select c.Name, Count(*)
from countries c 
join authors a on a.Country = c.Id 
join authorBook ab on ab.AuthorId = a.Id
join (select * from Books where genre like 'Artistic') b on ab.BookId = b.Id
group by c.Name

/*8*/
select distinct on (a.Id, b.Genre) a.Name, b.Genre, Count(*)
from Authors a
join AuthorBook ab on ab.AuthorId = a.Id
join Books b on b.Id = ab.BookId
group by a.Id, b.Genre	
/*9*/

select r.Name,
case 
 	when (select Count(*) from ReaderBook rb
				where Now() - rb.BorrowDate > interval '20 days' and rb.BookReturned = false and r.Id = rb.ReaderId
		    ) > 0 then		
			    Cast((select Now() - (rb.BorrowDate + interval '20 days') from ReaderBook rb
				where Now() - rb.BorrowDate > interval '20 days' and rb.BookReturned = false and r.Id = rb.ReaderId) as varchar)   
	else 'ČISTO' end
from Readers r
/**/


select a.Name, a.Id,
(select b.Name from (select * from AuthorBook ab where ab.AuthorId = a.Id) ab
 	join Books b on ab.BookId = b.Id
 	order by ab.PublicationDate
 	limit 1)
from Authors a
/*11*/

select c.Name,
(select b.Name from (select * from authors a where a.Country = c.Id ) a 
	join AuthorBook ab on a.Id = ab.AuthorId
 	join Books b on ab.BookId = b.Id
 	order by ab.PublicationDate asc offset 1
 	limit 1
)
from Countries c
/*12*/

select b.Name , Count(*) 
from books b
join (select * from ReaderBook where BookReturned = false) rb on b.Id = rb.BookId
where (select Count(*) from books b
		join (select * from ReaderBook where BookReturned = false) rb on b.Id = rb.BookId)  >= 10
group by b.Name

/*13*/
select c.Name, Count(*) / Count(b)
from countries c
join authors a on a.Country = c.Id
join AuthorBook ab on ab.AuthorId = a.Id
join books b on ab.BookId = b.Id
join ReaderBook rb on rb.BookId = b.Id
group by c.Name

/**/
select * from authors a where  5 < (select Count(*) from AuthorBook ab where ab.AuthorId = a.Id)

select Date_Trunc('Decade', a.BirthDate), count(*)
from authors a where  0 < (select Count(*) from AuthorBook ab where ab.AuthorId = a.Id)
group by Date_Trunc('Decade', a.BirthDate)

select a.gender,Count(*) from authors a where  5 < (select Count(*) from AuthorBook ab where ab.AuthorId = a.Id)
Group by a.gender
/**/

select distinct on (a.Id) a.name, sqrt(Count(b)) / Count(distinct(abo.AuthorId)) from authors a
join authorBook ab on ab.AuthorId = a.Id
join Books b on ab.BookId = b.Id
join AuthorBook abo on abo.BookId = b.Id
group by a.Id
limit 10
/*16*/






















select * from Countries
insert into Countries (Id, Name, Population, AverageWage) values
(1,'Croatia',3400000,2000),
(2,'Germany',86000000,2500),
(3,'Hungary',6400000,2100),
(4,'USA',345000000,3000)

insert into Authors (Id, Name, Surename, Gender, BirthDate, Country, Alive) values
(1,'Ivan','Gundulić','M',timestamp '1488/1/1',1, False),
(2,'Johan Wolfgang', 'Goethe','M',timestamp '1689/1/1',2, False),
(3,'Georgy', 'Išpan','M',timestamp '1800/1/1',3, False),
(4,'Nemo', 'Ramjet','M',timestamp '1987/11/12',4, True)

insert into Libraries (Id, Name, OpenTime, CloseTime) values
(1, 'GKMM', time '08:00:00', time '20:00:00'),
(2, 'Knjižnica Pokemona', time '08:00:00', time '14:00:00'),
(3, 'Knjižnica podstrana', time '08:00:00', time '18:00:00'),
(4, 'Knjižnica Zagreb', time '09:00:00', time '18:30:00')



select * from books
insert into Books (Id, Name, Genre, LibraryId) values
(1,'Dubravka','Reading',1),
(2,'Patnje mladoga Werthera','Reading',1),
(3,'Junaci Pavlove ulice','Reading',1),
(4,'Junaci Pavlove ulice','Reading',2),
(5,'Junaci Pavlove ulice','Reading',2),
(6,'Junaci Pavlove ulice','Reading',3),
(7,'Junaci Pavlove ulice','Reading',3),
(8,'Junaci Pavlove ulice','Reading',3),
(9,'Junaci Pavlove ulice','Reading',1),
(10,'All tomorrows','Artistic',4),
(11,'All tomorrows','Artistic',4),
(12,'All tomorrows','Artistic',4),
(13,'Osman','Reading',1),
(14,'Faust','Artistic',2)



select * from authorBook
order by AuthorId
insert into AuthorBook (AuthorId,BookId,Authortype, PublicationDate) values
(1,1,'Primary',timestamp '2000/1/1'),
(2,2,'Primary',timestamp '2018/2/1'),
(3,3,'Primary',timestamp '2019/2/1'),
(1,2, 'Secondary',timestamp '2020/2/1'),
(3,2, 'Secondary',timestamp '1900/2/1'),
(4,10, 'Primary',timestamp '2000/2/11'),
(4,11, 'Primary',timestamp '2000/2/11'),
(4,12, 'Primary',timestamp '2000/2/11'),
(3,9,'Primary',timestamp '1991/2/11'),
(2,14, 'Primary',timestamp '1800/8/14')


delete from AuthorBook *

insert into readers (Id, Name, Surename, BirthDate, Gender) values
(1,'James','Jamie',timestamp '1989/1/1','M'),
(2,'Michael','Jamie',timestamp '1987/1/1','M'),
(3,'Charlotte','Mary',timestamp '1981/1/1','F'),
(4,'Bob','Holmes',timestamp '2001/1/1','O')

select * from readerBook
insert into ReaderBook (ReaderId, BookId, BorrowDate, BookReturned) values
(1,1,timestamp '2023/12/1',True),
(1,2,timestamp '2020/12/2',False),
(2,3,timestamp '2023/12/2',False),
(2,2,timestamp '2020/12/1',True),
(4,5,timestamp '2023/12/7',True),
(4,7,timestamp '2023/11/7',True),
(4,8,timestamp '2020/12/1',True),
(1,5,timestamp '2023/12/1',True),
(1,3,timestamp '2020/12/2',True),
(2,4,timestamp '2023/12/2',True),
(2,5,timestamp '2020/12/1',True),
(4,6,timestamp '2023/12/7',True),
(4,2,timestamp '2023/11/7',True),
(4,9,timestamp '2020/12/1',True)








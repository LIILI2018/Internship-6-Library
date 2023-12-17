 create table Libraries(
	Id serial primary key not null,
	Name varchar(40) not null,
	OpenTime time not null,
	CloseTime time not null
)
alter table Libraries
	add constraint NameISEmpty check(Name != '')
alter table Libraries
	add constraint NameIsEmpty check (Name != '')

create table Books(
	Id serial primary key not null,
	Name varchar(55) not null,
	Genre varchar(12) not null,
	LibraryId int references Libraries(Id)
)
alter table Books
	add constraint NameISEmpty check(Name != '')
alter table Books
	add constraint BookGenre check (Genre in ('Reading', 'Artistic', 'Scientific', 'Biography', 'Professional'))

create table Authors(
	Id serial primary key not null,
	Name varchar(20) not null,
	Surename varchar(20),
	Gender varchar(1),
	BirthDate Timestamp,
	Country int references Countries(Id),
	Alive bool default(True)
)
alter table Authors
	add constraint NameISEmpty check(Name != '')
alter table Authors
	add constraint SurenameISEmpty check(Surename != '')
alter table Authors
	add constraint AuthorGender check (Gender in ('M', 'F', 'O', null))

create table Librarians(
	Id serial primary key not null,
	Name varchar(20) not null,
	Surename varchar (20) not null,
	Gender varchar(1),
	BirthDate Timestamp,
	LibraryId int references Libraries(Id) not null,
	WorkingHours time not null
)
alter table Librarians
	add constraint NameISEmpty check(Name != '')
alter table Librarians
	add constraint SurenameISEmpty check(Surename != '')
alter table Librarians
	add constraint LibrarianGender check (Gender in ('M', 'F', 'O', null))

create table Readers(
	Id serial primary key not null,
	Name varchar(20) not null,
	Surename varchar (20) not null,
	Gender varchar(1),
	BirthDate Timestamp
)
alter table Readers
	add constraint NameISEmpty check(Name != '')
alter table Readers
	add constraint SurenameISEmpty check(Surename != '')
alter table Readers
	add constraint ReaderGender check (Gender in ('M', 'F', 'O', null))

Create table Countries(
	Id serial primary key not null,
	Name varchar(50) not null,
	Population int not null,
	AverageWage int not null
)
alter table Countries
	add constraint NameISEmpty check(Name != '')
alter table Countries
	add constraint PositivePopulation check(Population > 0)
alter table Countries
	add constraint PositiveAverageWage check(AverageWage > 0)
	
create table AuthorBook(
	AuthorId int references Authors(Id) not null,
	BookId int references Books(Id) not null,
	AuthorType varchar(10),
	PublicationDate Timestamp,
	Primary key (AuthorId, BookId)
)
alter table AuthorBook
	add constraint AuthorType check (AuthorType in ('Primary', 'Secondary'))

create table ReaderBook(
	ReaderId int references Readers(Id) not null,
	BookId int references Books(Id) not null,
	BorrowDate TimeStamp,
	BookReturned bool default(False),
	Primary key (ReaderId, BookId)
)	

/*Procedura za posudbu knjiga*/

select * from Books
select * from Readers

insert into ReaderBook (ReaderId, BookId, BorrowDate) values
(ReaderId,BookId, Now())

	
	
	
	
	
	
	
	
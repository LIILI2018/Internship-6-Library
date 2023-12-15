create table Libraries(
	Id serial primary key not null,
	Name varchar(40) not null,
	WorkingHours time not null
)
alter table Libraries
	add constraint NameISEmpty check(Name != '')
alter table Libraries
	add constraint NameIsEmpty check (Name != '')

create table Books(
	Id serial primary key not null,
	Name varchar(55) not null,
	Genre varchar(12) not null,
	PublicationDate Timestamp
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
	BirthDate Timestamp
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
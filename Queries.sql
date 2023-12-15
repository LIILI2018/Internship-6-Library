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
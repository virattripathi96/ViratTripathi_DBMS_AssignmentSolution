create schema travel_on_the_go;
use travel_on_the_go;

create table passenger(
Passenger_name varchar(30),
Category varchar(30),
Gender char,
Boarding_City varchar(30),
Destination_City varchar(30),
Distance int,
Bus_Type varchar(30));

create table price(
Bus_Type varchar(30),
Distance int,
Price int);

insert into passenger values("Sejal", "AC", 'F', "Bengaluru", "Chennai", 350, "Sleeper");
insert into passenger values("Anmol", "Non-AC", 'M', "Mumbai", "Hyderabad", 700, "Sitting");
insert into passenger values("Pallavi", "AC", 'F', "Panaji", "Bengaluru", 600, "Sleeper");
insert into passenger values("Khusboo", "AC", 'F', "Chennai", "Mumbai", 1500, "Sleeper");
insert into passenger values("Udit", "Non-AC", 'M', "Trivandrum", "panaji", 1000, "Sleeper");
insert into passenger values("Ankur", "AC", 'M', "Nagpur", "Hyderabad", 500, "Sitting");
insert into passenger values("Hemant", "Non-AC", 'M', "panaji", "Mumbai", 700, "Sleeper");
insert into passenger values("Manish", "Non-AC", 'M', "Hyderabad", "Bengaluru", 500, "Sitting");
insert into passenger values("Piyush", "AC", 'M', "Pune", "Nagpur", 700, "Sitting");

insert into price values("Sleeper", 350, 770);
insert into price values("Sleeper", 500, 1100);
insert into price values("Sleeper", 600, 1320);
insert into price values("Sleeper", 700, 1540);
insert into price values("Sleeper", 1000, 2200);
insert into price values("Sleeper", 1200, 2640);
insert into price values("Sleeper", 1500, 2700);
insert into price values("Sitting", 500, 620);
insert into price values("Sitting", 600, 744);
insert into price values("Sitting", 700, 868);
insert into price values("Sitting", 1000, 1240);
insert into price values("Sitting", 1200, 1488);
insert into price values("Sitting", 1500, 1860);


#3
select Gender, count(*) as Count from passenger
where Distance >= 600
group by Gender;

#4
select min(Price) as min_ticket_price from price where Bus_Type = "Sleeper";

#5
select Passenger_name from passenger where Passenger_name like "S%";

#6
select Passenger_name, Boarding_City, Destination_City, PS.Bus_Type, Price
from passenger PS, price PR
where PS.Distance = PR.Distance and PS.Bus_Type = PR.Bus_Type;

#7
select Passenger_name, Price from passenger PS, price PR
where PS.Distance = PR.Distance and PS.Bus_Type = PR.Bus_Type
and PS.Bus_type = "Sitting" and PS.Distance = 1000;

#8
select Passenger_name, PR.Bus_Type, Price 
from passenger PS right join price PR
on PS.Distance = PR.Distance
where Passenger_name = "Pallavi"
and PR.Distance = (select Distance from Passenger where Passenger_name = "Pallavi");

#9
select distinct(Distance) from passenger order by Distance desc;

#10
select Passenger_name, (Distance / (select sum(Distance) from passenger))*100 as "% Distance" from passenger;

#11
select Distance, Price, 
Case
	when Price >= 1000 then "Expensive"
    when Price between 500 and 1000 then "Average Cost"
    else "Cheap"
end as Category from price;
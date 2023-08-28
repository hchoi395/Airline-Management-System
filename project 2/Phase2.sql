
DROP DATABASE IF EXISTS airline_management;
CREATE DATABASE IF NOT EXISTS airline_management;
USE airline_management;

drop table if exists Location;
create table Location (
	locID char(50) not null,
	primary key (locID)
) ENGINE=InnoDB;

drop table if exists Person;
create table Person (
	personID char(50) not null,
	f_name char(100) not null,
	l_name char(100) not null,
	location char(50) not null,
	primary key(personID)
) ENGINE = InnoDB;

drop table if exists Airline;
create TABLE Airline (
	airlineID char(50) not null,
	revenue decimal(11, 2) not null,
	primary key (airlineID)
) ENGINE=InnoDB;

drop table if exists Airplane;
create TABLE Airplane (
	airlineID char(50) not null,
	tail_num decimal(11, 0) not null,
	seat_cap decimal(11, 0) not null,
	speed decimal(11, 2) not null,
	locID char(50) not null,
	primary key (airlineID, tail_num)
) ENGINE=InnoDB;

drop table if exists Pilot;
create table Pilot (
	personID char(50) not null,
	taxID char(8) not null,
	experience decimal(11, 0) not null,
	airlineID char(50) not null,
	tail_num decimal(11, 0) not null,
	primary key(personID),
	unique key(airlineID, tail_num)
) ENGINE = InnoDB;

drop table if exists License;
create table License (
	personID char(50) not null,
	license char(50) not null,
	primary key(personID, license)
) ENGINE = InnoDB;

drop table if exists Passenger;
create table Passenger (
	personID char(50) not null,
	miles decimal(11, 2) not null,
	primary key(personID)
) ENGINE = InnoDB;

drop table if exists Airport;
create table Airport (
	airportID char(3) not null,
	name char(100) not null,
	city char(100) not null,
	state char(100) not null,
	locID char(50) not null,
	primary key(airportID)
) ENGINE = InnoDB;


drop table if exists Prop;
create TABLE Prop (
	airlineID char(50) not null,
	tail_num decimal(11, 0) not null,
	skids decimal(11, 0) not null,
	prop decimal(11, 0) not null,
	primary key (airlineID, tail_num)
) ENGINE=InnoDB;

drop table if exists Jet;
create TABLE Jet (
	airlineID char(50) not null,
	tail_num decimal(11, 0) not null,
	engine decimal(11, 0) not null,
	primary key (airlineID, tail_num)
) ENGINE=InnoDB;

drop table if exists Flight;
create TABLE Flight (
	flightID char(50) not null,
	routeID char(50) not null,
	airlineID char(50) not null,
    tail_num decimal(11, 0) not null,
	primary key (flightID)
) ENGINE=InnoDB;

drop table if exists Route;
create table Route (
	routeID char(50) not null,
	primary key (routeID)
) ENGINE=InnoDB;

drop table if exists Leg;
create table Leg (
	legID char(50) not null,
	distance decimal(11, 2) not null, 
	arriveAirportID char(3) not null,
	departAirportID char(3) not null,
	primary key (legID)
) ENGINE=InnoDB;

drop table if exists Ticket;
create table Ticket (
	ticketID char(50) not null, 
    	cost decimal(11, 2) not null, 
    	personID char(50) not null, 
    	airportID char(3) not null, 
	flightID char(50) not null,
    	primary key (ticketID)
) ENGINE=InnoDB;

drop table if exists Seat;
create table Seat (
	ticketID char(50) not null, 
	seat char(50) not null,
    primary key (ticketID, seat)
) ENGINE=InnoDB;

drop table if exists Contains;
CREATE TABLE Contains (
routeID char(50) NOT NULL,
legID char(50) NOT NULL,
primary key(routeID),
unique key(legID)
) ENGINE=InnoDB;

drop table if exists Supports;
CREATE TABLE Supports (
flightID char(50) not null,
    	airlineID char(50) not null,
    	tail_num decimal(11, 0) not null,
  	progress decimal(11, 0) not null,
 	next_time DATETIME not null,
	status char(50) not null,
   	PRIMARY KEY (airlineID, tail_num),
    	unique key(flightID)
) ENGINE=InnoDB;

alter table Person add constraint fk1 foreign key (location) references location (locID);
alter table Pilot add constraint fk2 foreign key (personID) references Person(personID);
alter table Pilot add constraint fk3 foreign key (airlineID, tail_num) references Airplane(airlineID, tail_num);
alter table License add constraint fk4 foreign key(personID) references Pilot(personID);
alter table Passenger add constraint fk5 foreign key(personID) references Person(personID);
alter table Airplane add constraint fk6 foreign key (airlineID) references airline (airlineID);
alter table Prop add constraint fk7 foreign key (airlineID, tail_num) references Airplane(airlineID, tail_num);
alter table Jet add constraint fk8 foreign key (airlineID, tail_num) references airplane (airlineID, tail_num);
alter table Flight add constraint fk9 foreign key (routeID) references route (routeID);
alter table Flight add constraint fk10 foreign key (airlineID, tail_num) references airplane (airlineID, tail_num);
alter table Leg add constraint fk11 foreign key (arriveAirportID) references Airport (airportID);
alter table Leg add constraint fk12 foreign key (departAirportID) references Airport (airportID);
alter table Ticket add constraint fk13 foreign key (personID) references Person (personID);
alter table Ticket add constraint fk14 foreign key (airportID) references Airport (airportID);
alter table Ticket add constraint fk15 foreign key (flightID) references Flight (flightID);
alter table Seat add constraint fk16 foreign key (ticketID) references Ticket(ticketID);
alter table Contains add constraint fk17 FOREIGN KEY (routeID) REFERENCES Route (routeID);
alter table Contains add constraint fk18 FOREIGN KEY (legID) REFERENCES Leg (legID);
alter table Supports add constraint fk19 FOREIGN KEY (flightID) REFERENCES Flight (flightID);
alter table Supports add constraint fk20 FOREIGN KEY (airlineID, tail_num) REFERENCES Airplane (airlineID, tail_num);
alter table Airport add constraint fk21 FOREIGN KEY(locID) references Location(locID);
alter table Airplane add constraint fk22 FOREIGN KEY(locID) references Location(locID);

INSERT INTO location (locID) VALUES ('plane_1');
INSERT INTO location (locID) VALUES ('plane_11');
INSERT INTO location (locID) VALUES ('plane_15');
INSERT INTO location (locID) VALUES ('plane_2');
INSERT INTO location (locID) VALUES ('plane_4');
INSERT INTO location (locID) VALUES ('plane_7');
INSERT INTO location (locID) VALUES ('plane_8');
INSERT INTO location (locID) VALUES ('plane_9');
INSERT INTO location (locID) VALUES ('port_1');
INSERT INTO location (locID) VALUES ('port_10');
INSERT INTO location (locID) VALUES ('port_11');
INSERT INTO location (locID) VALUES ('port_13');
INSERT INTO location (locID) VALUES ('port_14');
INSERT INTO location (locID) VALUES ('port_15');
INSERT INTO location (locID) VALUES ('port_17');
INSERT INTO location (locID) VALUES ('port_18');
INSERT INTO location (locID) VALUES ('port_2');
INSERT INTO location (locID) VALUES ('port_3');
INSERT INTO location (locID) VALUES ('port_4');
INSERT INTO location (locID) VALUES ('port_5');
INSERT INTO location (locID) VALUES ('port_7');
INSERT INTO location (locID) VALUES ('port_9');

INSERT INTO airlines (airlineID, revenue) VALUES ('Air_France', 25); 
INSERT INTO airlines (airlineID, revenue) VALUES ('American', 45); 
INSERT INTO airlines (airlineID, revenue) VALUES ('Delta', 46); 
INSERT INTO airlines (airlineID, revenue) VALUES ('JetBlue', 8); 
INSERT INTO airlines (airlineID, revenue) VALUES ('Lufthansa', 31); 
INSERT INTO airlines (airlineID, revenue) VALUES ('Southwest', 22); 
INSERT INTO airlines (airlineID, revenue) VALUES ('Spirit', 4); 
INSERT INTO airlines (airlineID, revenue) VALUES ('United', 40),


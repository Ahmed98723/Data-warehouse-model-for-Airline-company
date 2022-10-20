--create  Fact table code
create table Marketing (

Flight_id varchar2 (100) not null,
Promotion_key varchar2(100)  not null,
Date_key number  not null,
Passenger_key varchar2 (100) not null,
Ticket_key varchar2 (100) not null

);


ALTER TABLE Marketing ADD (
 CONSTRAINT FG_FK 
FOREIGN KEY (Flight_id) 
REFERENCES Flight (Flight_id),
 CONSTRAINT promotion_FK 
FOREIGN KEY (promotion_key) 
REFERENCES Promotion
(promotion_key),
 CONSTRAINT DATE_FK 
FOREIGN KEY (Date_key) 
REFERENCES Date_dim (Date_key),
 CONSTRAINT Ticket_FK 
FOREIGN KEY (Ticket_key) 
REFERENCES Ticket (Ticket_key),
 CONSTRAINT PASSENGER_FK 
FOREIGN KEY (passenger_key) 
REFERENCES Passenger (passenger_key));



create table Reservation (
Flight_id varchar2 (100) not null,
Promotion_key varchar2 (100)  not null,
Date_key number  not null,
Passenger_key varchar2 (100)  not null,
Ticket_key varchar2 (100) not null,
Reservation_key varchar2 (100) not null,
Airplane_key varchar2 (100) not null



);

ALTER TABLE Reservation ADD (
 CONSTRAINT FG2_FK 
FOREIGN KEY (Flight_id) 
REFERENCES Flight (Flight_id),
 CONSTRAINT Airplane_FK 
FOREIGN KEY (Airplane_key) 
REFERENCES Airplane(Airplane_key),
 CONSTRAINT Reservation_FK 
FOREIGN KEY (Reservation_key) 
REFERENCES Reservation_channel(Reservation_key),
CONSTRAINT DATE2_FK 
FOREIGN KEY (Date_key) 
REFERENCES Date_dim (Date_key),
 CONSTRAINT Ticket2_FK 
FOREIGN KEY (Ticket_key) 
REFERENCES Ticket (Ticket_key),
 CONSTRAINT PASSENGER2_FK 
FOREIGN KEY (Passenger_key) 
REFERENCES Passenger (Passenger_key));



create table customer_care(
Problem_key number not null,
Flight_id varchar2 (100)  not null,
Date_key number  not null,
Passenger_key varchar2 (100)  not null,
Ticket_key varchar2 (100) not null,
Airplane_key varchar2 (100) not null
);


ALTER TABLE Customer_care ADD (
 CONSTRAINT FG3_FK 
FOREIGN KEY (Flight_id) 
REFERENCES Flight (Flight_id),
 CONSTRAINT Prob_FK 
FOREIGN KEY (Problem_key) 
REFERENCES Problem(Problem_key),
CONSTRAINT Airplane3_FK 
FOREIGN KEY (Airplane_key) 
REFERENCES Airplane(Airplane_key),
 CONSTRAINT DATE3_FK 
FOREIGN KEY (Date_key) 
REFERENCES Date_dim (Date_key),
 CONSTRAINT Ticket3_FK 
FOREIGN KEY (Ticket_key) 
REFERENCES Ticket (Ticket_key),
 CONSTRAINT PASSENGER3_FK 
FOREIGN KEY (Passenger_key) 
REFERENCES Passenger (Passenger_key));




---- create Dimensions table 

create table Flight (
Flight_id varchar2 (100) primary key,
Flight_number varchar2 (20),
Arrival_city varchar2 (100) not null,
Deprature_city varchar2 (100) not null,
overnight_stay_duration number not null 


);

create table promotion (
promotion_key varchar2 (10) primary key,
promotion_code varchar2 (10) not null,
promotion_name varchar2 (50) not null,
promotion_type varchar2 (50) not null,
promotion_value number not null
);

create table Airplane (
Airplane_key varchar2 (20) primary key,
Airplane_Number varchar2 (20) not null,
Airplane_type varchar2 (20)not null,
Airplane_Capacity number (20) not null

);


create table Ticket(
Ticket_key varchar2 (20) primary key,
Ticket_id varchar2(20) not null,
Ticket_Class varchar2(20) not null,
seat_number varchar2(20) not null,
Fare number (8,2) not null,
upgraded_check char(3) not null

);

create table passenger (

passenger_key varchar2(20) primary key,
passenger_id varchar2(20) not null,
passenger_name varchar2(50) not null,
passenger_phone number not null,
passenger_address varchar2(50) not null,
passenger_Email varchar2(50) not null,
passenger_segment varchar2(50) not null,
gender char(2) not null,
Miles number not null
);

create table Date_dim(

Date_key number primary key,
full_date date not null,
Year number not null,
Quarter varchar2(15) not null,
Month_name varchar2(15) not null,
Day_of_month number not null

);

create table Reservation_channel(
Reservation_key varchar2(20) primary key,
channel_name varchar2(20) not null

);

create table Problem (
Problem_key number primary key,
problem_severity varchar2(20) not null,
interaction_type varchar2(20) not null,
Complaint varchar2(100) not null,
Feedback varchar2(100) not null


);


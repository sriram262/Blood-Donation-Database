

create database Blood_Donation;

use Blood_Donation;

create table Donors (
donor_id int primary key,
don_name varchar(20),
don_dob date,
gender char(20),
blood_type char(20),
phone_no numeric,
email varchar(30),
last_donation_date date,
address varchar(40));


insert into donors values (1,'sriram','2000-01-03','male','B+',9182184341,'sriramkamidi@gmail','2022-06-19','6-113 rjy st'),
(2,'ajay','2001-01-17','male','AB-',6302184355,'ajay355@gmail',null,'8-90 nand st'),
(3,'yashwika','2002-07-13','female','O+',7659069383,'yashwika9@gmail','2022-11-14','7-2 dos st'),
(4,'balu','1999-12-31','male','A-',9705003854,'balupindi@gmail',null,'785 kkd Ave'),
(5,'vijaya','2002-03-03','female','B+',8412469895,null,'2023-01-26','321 main st');



create table Donors_Eligibility (
don_elig_id int,
eligibility_status char(20),
eligibility_reason varchar(30),
donor_id int,
foreign key (donor_id) references donors (donor_id));



insert into donors_eligibility values (101,'Eligible','met all requirements',1),
(102,'Not Eligible','low hemoglobin levels',2),
(103,'Eligible','good health',3),
(104,'Eligible','passed all tests',4),
(105,'Not Eligible','waiting for test results',5);



create table Appointment (
appoint_id int,
appoint_date date,
appoint_status char(20),
donor_id int,
foreign key (donor_id) references donors (donor_id));


insert into appointment values (11,'2023-05-20','sheduled',1),
(12,'2023-04-02','sheduled',2),
(13,'2023-04-13','sheduled',3),
(14,'2023-05-09','pending',4),
(11,'2023-05-14','sheduled',5);



create table Blood_banks (
bb_id int primary key,
bb_name varchar(30),
bb_phoneno numeric,
bb_email varchar(30),
bb_address varchar(40));


insert into blood_banks values (1,'Red cross blood bank',04043454345,'info@redcross.com','789 Oak st'),
(2,'ABC blood center',05554321202,'ABCbloodcenter@gmail.com','321 pine st');



create table Donations (
donation_id int primary key,
donation_date date,
blood_type char(20),
bb_id int,
donor_id int,
foreign key (bb_id) references Blood_banks (bb_id),
foreign key (donor_id) references donors (donor_id));


insert into donations values (11,'2023-05-21','B+',2,1),
(12,'2023-04-02','AB-',1,2),
(13,'2023-04-14','O+',1,3),
(14,'2023-05-09','A-',2,4);



create table donation_recipient (
don_reci_id int,
reci_name varchar(20),
reci_phoneno numeric,
reci_email varchar(30),
reci_location varchar(40),
donation_id int,
foreign key (donation_id) references donations (donation_id));


insert into donation_recipient values (1, 'City Hospital', 5555555555, 'info@cityhospital.org', '6542 Elm St', 11),
(2, 'City Hospital', 5555555555, 'info@cityhospital.org', '6542 Elm St', 12),
(3, 'St. Mary\'s Clinic', 6666666666, 'info@stmarysclinic.org', '5732 Oak St', 13),
(4, 'St. Mary\'s Clinic', 6666666666, 'info@stmarysclinic.org', '5732 Oak St', 14);



create table Patient (
patient_id int primary key,
p_name char(20),
p_bloodtype char(20),
p_disease char(30),
p_phoneno numeric,
p_address varchar(40));


insert into patient values (1,'Rajesh','AB-','cancer',8499013841,'258 vizag st'),
(2,'Manikanta','B+','malaria',9704845863,'420 jinpin st'),
(3,'sai','O-','HIV',7989423031,'862 kl st'),
(4,'krishna','A+','paralysis',9908710542,'578 dos st');




create table Request (
req_id int primary key,
req_date date,
blood_type char(20),
quantity_ml int,
patient_id int,
foreign key (patient_id) references patient (patient_id));



insert into request values (101,'2023-05-25','AB-',500,1),
(102,'2023-06-19','B+',250,2),
(103,'2023-06-25','O-',250,3),
(104,'2023-05-06','A+',1000,4);



create table Staff (
staff_id int primary key,
name char(20),
phone_no numeric,
email varchar(30),
position varchar(30),
bb_id int,
foreign key (bb_id) references blood_banks (bb_id));


 
insert into staff values (11,'John Smith',1234567890,'john.smith@bbank.com','Nurse',1),
(12,'Sarah Lee',2345678901,'sarah.lee@bbank.com','Nurse',2),
(13,'Michael Kim',3456789012,'michael.kim@bbank.com','Technician',1),
(14,'Lisa Chen',4567890123,'lisa.chen@bbank.com','Receptionist',2);



create table Inventory (
inven_id int primary key,
blood_type char(20),
quantity_ml int,
expire_date date,
bb_id int,
foreign key (bb_id) references blood_banks (bb_id));

insert into inventory values (1,'O+',1500,'2023-05-26',1),
(2,'AB-',500,'2023-05-14',1),
(3,'B+',1000,'2023-07-01',2),
(4,'A-',500,'2023-06-20',2);



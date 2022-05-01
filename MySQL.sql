CREATE TABLE Customer(
Customer_ID int NOT NULL AUTO_INCREMENT,
First_name varchar(50) NOT NULL,
Surname varchar(50) NOT NULL,
email  varchar(50) NOT NULL,
PRIMARY KEY (Customer_ID)
);

INSERT INTO Customer (First_name, Surname, email)
VALUES ('Brian', 'Halpin', 'IE1234@gmail.com'),
		('Paul', 'Kelly', 'IE2354@gmail.com'),
        ('David', 'Poter', 'IE3256@gmail.com'),
        ('Aileen', 'Toth', 'IE5623@gmail.com'),
        ('Ada', 'Perking', 'IE7896@gmail.com');
        
INSERT INTO Customer (First_name, Surname, email)
VALUES ('Jack', 'Halpin', 'DE1234@gmail.com'),
		('Peter', 'Kelly', 'EF2354@gmail.com'),
        ('Bolek', 'Poter', 'CE3256@gmail.com'),
        ('Halina', 'Toth', 'BE5623@gmail.com'),
        ('Ida', 'Perking', 'SE7896@gmail.com');
        
Select * from Customer;


CREATE TABLE Address(
Address_ID int NOT NULL AUTO_INCREMENT,
Street_Number varchar(50) NOT NULL,
City varchar(50) NOT NULL,
Country varchar(30) NOT NULL,
fk_customer_id int UNIQUE,
PRIMARY KEY (Address_ID),
FOREIGN KEY (fk_customer_id)
REFERENCES Customer(Customer_ID)
);


INSERT INTO Address(Street_Number, City, Country, fk_customer_id)
VALUES ('12 Belchoska', 'Moscow', 'Russia', 1),
		('3 Boston Str', 'Neshville', 'USA', 2),
        ('13 College Rd', 'Cork', 'Ireland', 3),
        ('27 Duch Strasse', 'Bad Kreuznach', 'Germany', 4),
        ('25 Wroclawska', 'Glogow', 'Poland', 5);
        
INSERT INTO Address (Street_Number, City, Country, fk_customer_id)
VALUES ('15 Belchoska', 'Bretwo', 'Russia', 6),
		('33 Boston Str', 'New York', 'USA', 7),
        ('113 College Rd', 'Dundalk', 'Ireland', 8),
        ('227 Duch Strasse', 'Berlin', 'Germany', 9),
        ('125 Wroclawska', 'Poznan', 'Poland', 10);

SELECT * from Address;

CREATE TABLE Hotel(
Hotel_ID int NOT NULL AUTO_INCREMENT,
Hotel_Name varchar(50) NOT NULL,
PRIMARY KEY (Hotel_ID)
);

INSERT INTO Hotel (Hotel_Name, fk_reviews_id)
VALUES ('Carlton Hotel'),
		('Iris Hotel'),
        ('Holiday'),
        ('Grand Hotel'),
        ('Ariel Hotel');
        
Select * from Hotel;

CREATE TABLE Hotel_Address(
HA_ID int NOT NULL AUTO_INCREMENT,
Street_Number varchar(50) NOT NULL,
City varchar(50) NOT NULL,
Country varchar(30) NOT NULL,
fk_hotel_id int UNIQUE,
PRIMARY KEY (HA_ID),
FOREIGN KEY (fk_hotel_id)
REFERENCES Hotel(Hotel_ID)
);

INSERT INTO Hotel_Address (Street_Number, City, Country, fk_hotel_id)
VALUES ('1 Main Street', 'Lombok Sengigi', 'Indonesia', 1),
		('3 Black Road', 'Santo', 'Italy', 2),
        ('13 Blue Road', 'Antalia', 'Turkey', 3),
        ('27 Green Street', 'Marakesh', 'Morocco', 4),
        ('25 Yellow Road', 'Kuala Lumpur', 'Maleysia', 5);

SELECT * from Hotel_Address;


CREATE TABLE Reviews(
Reviews_ID int NOT NULL AUTO_INCREMENT,
Rating_score int NOT NULL,
Review varchar(50),
PRIMARY KEY (Reviews_ID)
);
ALTER TABLE Reviews
ADD fk_hotel_id int;
ALTER TABLE Reviews
ADD FOREIGN KEY (fk_hotel_id) REFERENCES Hotel(Hotel_ID);

INSERT INTO Reviews (Rating_score, Review, fk_hotel_id)
VALUES ('4', 'splendid', 1),
		('3','comfortable', 1),
        ('2', 'noisy', 1),
        ('5', 'very nice experience', 2),
        ('4', 'enjoyable', 3);
INSERT INTO Reviews (Rating_score, Review, fk_hotel_id)
VALUES ('2', 'terrible', 4),
		('5','very good', 5),
        ('5', 'good food', 5),
        ('5', 'friendly staff', 5),
        ('2', 'dirty water', 2);
select * from Reviews;


CREATE TABLE Photo(
Photo_ID int NOT NULL AUTO_INCREMENT,
Image_status varchar(10) NOT NULL,
Image_name varchar(50) NOT NULL,
fk_room_id int,
PRIMARY KEY (Photo_ID),
FOREIGN KEY (fk_room_id) 
REFERENCES Room(Room_ID)
);


INSERT INTO Photo (Image_status, Image_name, fk_room_id)
VALUES ('active', 'Kitchen', 76),
		('active','Bedroom', 76),
        ('NULL', 'NULL', 77),
        ('active', 'All rooms', 76),
        ('active', 'All rooms and view of Hotel', 78),
        ('active','Bedroom', 78),
        ('NULL', 'NULL', 79),
        ('active', 'All rooms', 80),
        ('active','Bedroom', 81),
        ('NULL', 'NULL', 82),
        ('active', 'All rooms', 83),
        ('active', 'All rooms and view of Hotel', 83),
        ('active','Bedroom', 84),
        ('NULL', 'NULL', 85),
        ('active', 'All rooms', 84),
        ('active','Bedroom', 87),
        ('NULL', 'NULL', 88),
        ('active', 'All rooms', 89),
        ('active', 'All rooms and view of Hotel', 89),
        ('active','Bedroom', 84),
        ('NULL', 'NULL', 86),
        ('active', 'All rooms', 84),
        ('active', 'All rooms and view of Hotel', 81);

SELECT * from Photo;



CREATE TABLE Reservation(
Reserv_ID int NOT NULL AUTO_INCREMENT,
From_Date date NOT NULL,
To_Date date NOT NULL,
PRIMARY KEY (Reserv_ID)
);


INSERT INTO Reservation (From_Date, To_Date)
VALUES ('2020-08-01', '2020-08-07'),
		('2020-09-01', '2020-09-08'),
        ('2020-10-01', '2020-10-12'),
        ('2020-11-01', '2020-11-06'),
        ('2020-12-01', '2020-12-13');
        
INSERT INTO Reservation (From_Date, To_Date)
VALUES ('2019-08-01', '2019-08-07'),
		('2019-09-01', '2019-09-08'),
        ('2019-10-01', '2019-10-12'),
        ('2019-11-01', '2019-11-06'),
        ('2019-12-01', '2019-12-13'),
        ('2018-08-01', '2018-08-07'),
		('2018-09-01', '2018-09-08'),
        ('2018-10-01', '2018-10-12'),
        ('2018-11-01', '2018-11-06'),
        ('2018-12-01', '2018-12-13');
        

select * from Reservation;        

CREATE TABLE Room(
Room_ID int NOT NULL AUTO_INCREMENT,
Room_No int NOT NULL,
No_Beds int NOT NULL,
Status varchar(50),
fk_reserv_id int,
fk_hotel_id int,
PRIMARY KEY (Room_ID),
FOREIGN KEY (fk_hotel_id)
REFERENCES Hotel(Hotel_ID),
FOREIGN KEY (fk_reserv_id)
REFERENCES Reservation(Reserv_ID)
);

INSERT INTO Room (Room_No, No_Beds, Status, fk_reserv_id, fk_hotel_id)
VALUES ('001', '2', 'active free', 1, 2),
		('201', '1', 'active occupied', 2, 3 ),
        ('202', '2', 'active free', 3, 4),
        ('101', '1', 'active occupied', 4, 5),
        ('102', '3', 'in maintenance', 5, 2),
        ('200', '1', 'active occupied', 2, 5 ),
        ('302', '2', 'active free', 3, 5),
        ('401', '1', 'active occupied', 4, 1),
        ('002', '3', 'in maintenance', 5, 1),
         ('106', '1', 'active occupied', 4, 4),
        ('108', '3', 'in maintenance', 5, 1),
        ('210', '1', 'active occupied', 2, 3 ),
        ('322', '2', 'active free', 3, 4),
        ('432', '1', 'active occupied', 4, 2);
        
select * from Room;
        
CREATE TABLE Room_Photo(
RP_ID int NOT NULL AUTO_INCREMENT,
fk_room_id int,
fk_photo_id int,
PRIMARY KEY (RP_ID),
FOREIGN KEY (fk_room_id)
REFERENCES Room(Room_ID),
FOREIGN KEY (fk_photo_id)
REFERENCES Photo(Photo_ID)
);

INSERT INTO Room_Photo(fk_room_id, fk_photo_id)
VALUES (76, 47), (77,48), (78, 49), (79, 50);
INSERT INTO Room_Photo(fk_room_id, fk_photo_id)
VALUES (80, 51), (81,52), (82, 53), (83, 50);
INSERT INTO Room_Photo(fk_room_id, fk_photo_id)
VALUES (80, 51), (81,52), (82, 53), (83, 50);
INSERT INTO Room_Photo(fk_room_id, fk_photo_id)
VALUES (81, 51), (81,52), (82, 53), (83, 50);
       
Select * from Room_Photo;

CREATE TABLE Booking(
Booking_ID int NOT NULL AUTO_INCREMENT,
fk_customer_id int,
fk_reserv_id int,
Period int NOT NULL,
PRIMARY KEY (Booking_ID),
FOREIGN KEY (fk_customer_id)
REFERENCES Customer(Customer_ID),
FOREIGN KEY (fk_reserv_id)
REFERENCES Reservation(Reserv_ID)
);

INSERT INTO Booking (fk_customer_id, fk_reserv_id, Period)
VALUES (1, 1, 7), 
		(2, 2, 8), 
        (3, 3, 12), 
        (4, 4, 6), 
        (5, 5, 13),
        (6, 1, 7), 
		(7, 2, 8), 
        (8, 3, 12), 
        (8, 4, 6), 
        (10, 5, 13);
        
INSERT INTO Booking (fk_customer_id, fk_reserv_id, Period)
VALUES (1, 11, 7), 
		(2, 12, 8), 
        (3, 13, 12), 
        (4, 14, 6), 
        (5, 15, 13),
        (6, 6, 7), 
		(7, 7, 8), 
        (8, 8, 12), 
        (8, 9, 6), 
        (10, 10, 13);


Select * from Booking;

SELECT c.First_name, c.Surname, a.country
FROM customer as c
Inner Join Address as a
on c.Customer_ID = a.fk_customer_id
Where a.Country = 'Russia';

SELECT h.Hotel_Name, HA.Country
FROM Hotel as h
Inner Join Hotel_Address as HA
on h.Hotel_id = fk_hotel_id
Where h.Hotel_Name like '%Hotel'
order by Hotel_Name DESC;

SELECT p.Image_name, r.Room_No, h.Hotel_Name, ha.Country
FROM Photo as p
left join Room as r
on r.Room_ID = p.fk_room_id
left join Hotel as h
on h.Hotel_ID = r.fk_hotel_ID
left join Hotel_Address as ha
on ha.fk_hotel_id = h.Hotel_ID
Where r.Room_No > 80
Order by Room_No;

SELECT r.Review, r.Rating_score, h.Hotel_name
FROM Reviews as r
Join Hotel as h
on h.Hotel_ID = r.fk_hotel_ID
WHERE Rating_score = 4
Order by Review;

CREATE VIEW roomstatus AS
SELECT Photo.Image_status, Photo.Image_name, Room.Status, Room.Room_No, Room.No_Beds
	FROM Photo
	inner JOIN Room_Photo
    On Photo.Photo_ID = Room_Photo.fk_photo_id
    inner JOIN Room
    On Room_Photo.fk_room_id = Room.Room_ID
    Order by Room_No;
    
SELECT * from roomstatus;


CREATE VIEW customer_booking AS
SELECT Distinct Booking.Booking_ID, Booking.Period, Customer.First_name, Customer.Surname, Customer.email,  Reservation.From_Date, Reservation.To_Date
FROM Customer
left join Booking
on Customer.Customer_ID = Booking.fk_customer_id
Left join Reservation
on Reservation.Reserv_ID = Booking.fk_reserv_id
order by Booking_ID DESC;

SELECT * FROM customer_booking;


DELIMITER $$
CREATE PROCEDURE daysreserved()
LANGUAGE SQL
DETERMINISTIC
SQL SECURITY DEFINER
COMMENT 'Days Booked'
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS Days_Booked
    SELECT Reserv_ID,
		DATEDIFF(To_Date, From_Date)
        AS Period
        FROM Reservation
        Order by Reserv_ID ASC;
        SELECT * FROM Days_Booked;
END$$

CALL daysreserved();


DELIMITER \\
CREATE PROCEDURE Hoteladdress()
LANGUAGE SQL
DETERMINISTIC
SQL SECURITY DEFINER
COMMENT 'Hotel and Address'
BEGIN
	CREATE TEMPORARY TABLE IF NOT EXISTS Hoteladdress
    SELECT h.Hotel_Name, HA.Street_Number, HA.City, HA.Country
		FROM Hotel as h
        Inner Join Hotel_Address as HA
        ON h.Hotel_ID = HA.fk_hotel_id;
		SELECT * FROM Hoteladdress;
END\\

CALL Hoteladdress();

DELIMITER $$

CREATE FUNCTION numberOfbookings1 (param1 varchar(50), param2 varchar(50))
RETURNS INT DETERMINISTIC
BEGIN

DECLARE num INT;

	SELECT count(Booking_ID)
    INTO num
	FROM Customer as c
	LEFT JOIN Booking as b
   	on c.Customer_ID = b.fk_customer_id
	WHERE c.First_name = param1 and c.Surname = param2;

RETURN num;
END $$
    
SELECT numberOfBookings1('Brian', 'Halpin');


DELIMITER $$
CREATE TRIGGER new_reservation
after insert
on Reservation for each row
Begin
	insert into Booking set
    Period = DATEDIFF(new.To_Date, new.From_Date),
	fk_reserv_id = (new.Reserv_ID);
	     
End $$

drop trigger new_reservation;

INSERT INTO Reservation (From_Date, To_Date)
VALUES ('2021-03-05', '2021-03-28');

select * from Reservation;
Select * from Booking;



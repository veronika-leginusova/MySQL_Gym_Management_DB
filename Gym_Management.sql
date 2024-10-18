CREATE DATABASE Gym_Management;

USE Gym_Management;

CREATE TABLE Locations (
    Location_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    City VARCHAR(255),
    Street VARCHAR(255),
    Number VARCHAR(255),
    Postal_Code VARCHAR(255),
    Classes VARCHAR(50)
);

ALTER TABLE Locations
AUTO_INCREMENT = 1000;

INSERT INTO Locations
  (City, Street, Number, Postal_Code, Classes)
VALUES
  ("London", "Super Road", 11, "L01AA1", "YES"),
  ("London", "Happy Street", 12, "L02BB2", "YES"),
  ("London", "Heavy Street", 13, "L03CC3", "YES"),
  ("Birmingham", "Curvy Boulevard", 21, "B04DD4", "YES"),
  ("Birmingham", "Jacked Road", 22, "B05EE5", "NO"),
  ("Glasgow", "Highway to Hell", 31, "G06FF6", "NO"),
  ("Glasgow", "Street of Suffering", 32, "G07GG7", "YES"),
  ("Liverpool", "Gains Street Lower", 41, "LP8HH8", "NO"),
  ("Liverpool", "Gains Street Upper", 42, "LP9II9", "YES");

SELECT * FROM Locations;


CREATE TABLE Classes (
    Class_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Class_Name VARCHAR(255),
    Day_of_Week VARCHAR(255),
    Location_ID INT,
    CONSTRAINT fk_location1 FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID) ON DELETE SET NULL,
    Class_Time TIME,
    Class_Category VARCHAR(255)
);

INSERT INTO Classes
  (Class_Name, Day_of_Week, Location_ID, Class_Time, Class_Category)
VALUES
  ("Yin", "Monday", 1000, "08:00:00", "Yoga"),
  ("Vinyasa", "Wednesday", 1003, "18:00:00", "Yoga"),
  ("HIIT Training", "Friday", 1006, "20:00:00", "HIIT"),
  ("Intro to Barbells", "Tuesday", 1008, "08:00:00", "Strength"),
  ("Power Ride", "Thursday", 1001, "06:00:00", "Cycling"),
  ("Battle Ropes", "Saturday",1006,  "07:00:00", "HIIT"),
  ("Lunchbreak Core", "Monday", 1002, "12:00:00", "HIIT"),
  ("Strength and Conditioning", "Sunday", 1006, "20:00:00", "Strength"),
  ("Barbell Pump", "Wednesday", 1003, "07:00:00", "Strength"),
  ("Cardio Ride", "Friday", 1008, "09:00:00", "Cycling");

SELECT * FROM Classes;


CREATE TABLE Plans (
  Plan_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  Plan_Name VARCHAR(255),
  Plan_Price INT,
  Visit_Frequency INT,
  Plan_Type VARCHAR(255)
);

INSERT INTO Plans
  (Plan_Name, Plan_Price, Visit_Frequency, Plan_Type)
VALUES
  ("Basic Month to Month", 60, 31, "Basic"),
  ("Basic One Year", 600, 366, "Basic"),
  ("Basic One Week", 40, 7, "Basic"),
  ("Basic Day Pass", 15, 1, "Basic"),
  ("Basic Free Trial Day Pass", 0, 1, "Basic"),
  ("Premium Month to Month", 90, 31, "Premium"),
  ("Premium One Year", 900, 366, "Premium"),
  ("Premium One Week", 60, 7, "Premium"),
  ("Premium Day Pass", 22, 1, "Premium"),
  ("Premium Free Trial Day Pass", 0, 1, "Premium");

SELECT * FROM Plans;


CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Surname VARCHAR(50),
    Location_ID INT,
	CONSTRAINT fk_location2 FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID) ON DELETE SET NULL,
    Position VARCHAR(50),
    Class_ID INT,
    CONSTRAINT fk_classes1 FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID) ON DELETE SET NULL,
    Email VARCHAR(100) UNIQUE,
    Contact VARCHAR(15)
);

INSERT INTO Staff
  (Name, Surname, Location_ID, Position, Class_ID, Email, Contact)
VALUES
  ('John', 'Lewis', 1000, 'Manager', 1, 'john.lewis@example.com', '555-123-4560'),
  ('Emily', 'White', 1001, 'Instructor', 5, 'emily.white@example.com', '555-987-6540'),
  ('Michael', 'Green', 1000, 'Personal Trainer', NULL, 'michael.green@example.com', '555-543-7891'),
  ('Sophia', 'Black', 1003, 'Personal Trainer', 9, 'sophia.black@example.com', '555-111-2234'),
  ('David', 'Walker', 1004, 'Personal Trainer', NULL, 'david.walker@example.com', '555-222-3345'),
  ('Olivia', 'Carter', 1006, 'Instructor', 6, 'olivia.carter@example.com', '555-333-4456'),
  ('James', 'Lee', 1005, 'Manager', NULL, 'james.lee@example.com', '555-444-5567'),
  ('Liam', 'Clark', 1008, 'Instructor', 10, 'liam.clark@example.com', '555-555-6678'),
  ('Emma', 'King', 1007, 'Personal Trainer', NULL, 'emma.king@example.com', '555-666-7789'),
  ('Isabella', 'Scott', 1006, 'Instructor', 8, 'isabella.scott@example.com', '555-777-8890'),
  ("Malcolm","Horn",1001,"Manager",6,"rutrum.justo.praesent@outlook.ca","979-277-5331"),
  ("Octavia","Campos",1001,"Personal Trainer",8,"vestibulum.lorem.sit@hotmail.net","779-104-8712"),
  ("Alexa","Miles",1003,"Manager",5,"mauris.elit.dictum@protonmail.couk","952-162-7924"),
  ("Quemby","Wright",1005,"Personal Trainer",NULL,"tempus.risus@yahoo.edu","002-865-7463"),
  ("Amir","Hoffman",1006,"Manager",2,"in.magna.phasellus@icloud.edu","593-744-8622"),
  ("Elvis","Benson",1005,"Instructor",NULL,"elit.dictum@outlook.ca","273-836-8447"),
  ("Kirby","Hayden",1004,"Personal Trainer",NULL,"nunc.est.mollis@protonmail.net","965-895-8885"),
  ("Moses","Burnett",1002,"Manager",2,"vitae.risus@icloud.com","387-125-4556"),
  ("Carter","Hartman",1006,"Personal Trainer",8,"dis@icloud.ca","527-823-2122"),
  ("Mikayla","Roy",1008,"Instructor",3,"montes@hotmail.com","089-843-6365"),
  ("Veda","Mullen",1004,"Instructor",NULL,"et.nunc@yahoo.edu","190-418-1116"),
  ("Garrett","Farley",1002,"Instructor",3,"est.mollis.non@icloud.com","666-898-3264"),
  ("Callie","Donaldson",1004,"Instructor",NULL,"placerat@google.com","043-655-6653"),
  ("Leonard","Mcclain",1003,"Personal Trainer",1,"sit.amet.lorem@protonmail.net","092-750-1643"),
  ("Mufutau","Barrera",1008,"Instructor",4,"risus@google.com","341-484-7321"),
  ("Armando","Mendoza",1004,"Instructor",NULL,"iaculis.lacus.pede@hotmail.net","663-677-9953"),
  ("Kelly","Dominguez",1006,"Instructor",3,"eu.odio@outlook.edu","770-318-3727"),
  ("Ursa","Meyers",1001,"Personal Trainer",9,"pede.et.risus@outlook.couk","710-367-4468"),
  ("Fletcher","Blanchard",1006,"Manager",7,"nam.interdum@google.couk","342-655-1546"),
  ("Myles","Burks",1000,"Instructor",4,"elementum@aol.org","675-610-0591");

SELECT * FROM Staff;


CREATE TABLE Clients (
    Client_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Surname VARCHAR(50),
    Plan_ID INT,
    CONSTRAINT fk_plan FOREIGN KEY (Plan_ID) REFERENCES Plans(Plan_ID) ON DELETE SET NULL,
    Location_ID INT,
    CONSTRAINT fk_location3 FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID) ON DELETE SET NULL,
    Class_ID INT,
    CONSTRAINT fk_classes2 FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID) ON DELETE SET NULL,
    Email VARCHAR(100) UNIQUE,
    Contact VARCHAR(100),
    Staff_ID INT,
    CONSTRAINT fk_pt FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID) ON DELETE SET NULL
);

INSERT INTO Clients
  (Name, Surname, Plan_ID, Location_ID, Class_ID, Email, Contact, Staff_ID)
VALUES
  ('John', 'Anderson', 1, 1000, 1, 'john.anderson@example.com', '555-123-4567', 9),
  ('Emily', 'Clark', 2, 1001, 5, 'emily.clark@example.com', '555-987-6543', 7),
  ('Michael', 'Johnson', 1, 1000, 1, 'michael.johnson@example.com', '555-543-7890', 3),
  ('Sophia', 'Martinez', 3, 1003, 2, 'sophia.martinez@example.com', '555-111-2233', 4),
  ('David', 'Smith', 2, 1004, NULL, 'david.smith@example.com', '555-222-3344', 5),
  ('Olivia', 'Turner', 1, 1005, NULL, 'olivia.turner@example.com', '555-333-4455', 12),
  ('James', 'Brown', 3, 1006, 6, 'james.brown@example.com', '555-444-5566', 11),
  ('Liam', 'Davis', 2, 1007, NULL, 'liam.davis@example.com', '555-555-6677', 26),
  ('Emma', 'Wilson', 1, 1008, 10, 'emma.wilson@example.com', '555-666-7788', 3),
  ('Isabella', 'Taylor', 3, 1002, 7, 'isabella.taylor@example.com', '555-777-8899', 8),
  ('Renado', 'Henke', 1, 1000, 1, 'rhenke0@senate.gov', '909-113-5221', 27),
  ('Hubie', 'Goncalo', 2, 1001, 5, 'hgoncaloj@over-blog.com', '137-311-5651', 21),
  ('Herc', 'Cescon', 1, 1000, 1, 'hcesconi@google.de', '892-938-0010', 3),
  ('Reinaldos', 'Roxbrough', 3, 1003, 2, 'rroxbroughh@cdbaby.com', '485-580-9941', 14),
  ('Jonathon', 'Whitter', 2, 1004, NULL, 'jwhitterg@list-manage.com', '382-465-5443', 5),
  ('Shellysheldon', 'Tough', 1, 1005, NULL, 'stoughf@state.gov', '945-861-0394', 16),
  ('Caryl', 'Warrick', 3, 1006, 6, 'cwarricke@desdev.cn', '999-292-9938', 1),
  ('Jeannie', 'Solleme', 2, 1007, NULL, 'jsollemed@hostgator.com', '590-951-8473', 2),
  ('Abdel', 'Dodd', 1, 1008, 10, 'adoddc@cocolog-nifty.com', '802-325-2374', 3),
  ('Madalyn', 'Freschini', 3, 1002, 7, 'mfreschinib@ucoz.com', '795-955-3182', 5),
  ('Joseito', 'Antos', 1, 1000, 1, 'jantos8@wiley.com', '971-256-2130', 25),
  ('Gregoire', 'Hadden', 2, 1001, 5, 'ghadden9@mac.com', '553-541-1597', 12),
  ('Mame', 'OCurrigan', 1, 1000, 1, 'mocurrigana@dailymotion.com', '994-828-6196', 3),
  ('Emmey', 'Willans', 3, 1003, 2, 'ewillans5@friendfeed.com', '436-598-7052', 4),
  ('Rhys', 'Dyte', 2, 1004, NULL, 'rdyte6@php.net', '225-900-5606', 29),
  ('Jenda', 'Simner', 1, 1005, NULL, 'jsimner7@ed.gov', '704-117-3433', NULL),
  ('Nessa', 'Hamblyn', 3, 1006, 6, 'nhamblyn1@newsvine.com', '892-512-8447', 1),
  ('Sibylla', 'Milbourn', 2, 1007, NULL, 'smilbourn2@hhs.gov', '962-909-1293', 15),
  ('Eduardo', 'Sundin', 1, 1008, 10, 'esundin3@si.edu', '313-431-6100', 13),
  ('Fredi', 'Askham', 3, 1002, 7, 'faskham4@slideshare.net', '605-659-1131', 4),
  ("Cooper","Murray",1,1005,NULL,"dui.nec@protonmail.edu","267-533-1061",2),
  ("Cedric","Cantu",9,1006,6,"convallis.convallis.dolor@outlook.net","934-271-6282",21),
  ("Mannix","Mckee",2,1001,1,"libero.proin@google.edu","872-445-8245",30),
  ("Carla","Livingston",8,1006,7,"cum@hotmail.edu","368-953-6417",22),
  ("Hop","Sawyer",6,1004,NULL,"nunc.lectus@outlook.couk","729-762-1457",20),
  ("Octavia","Dean",5,1000,3,"quis@aol.couk","236-770-2013",NULL),
  ("Jackson","Myers",5,1006,3,"in.at.pede@hotmail.ca","272-295-3017",10),
  ("Gray","Black",3,1001,9,"amet.ornare@google.couk","276-507-7372",30),
  ("Xenos","Shaw",4,1001,9,"cubilia.curae@aol.com","561-674-5025",13),
  ("Myles","Walton",2,1004,NULL,"ac@aol.ca","845-508-4236",15),
  ("Brenda","Hammond",5,1005,NULL,"commodo.ipsum@hotmail.org","524-341-8992",25),
  ("Lars","Turner",3,1004,NULL,"in.molestie.tortor@icloud.ca","862-346-8123",26),
  ("Melissa","Wade",9,1006,7,"aliquet.phasellus@aol.edu","444-631-6424",21),
  ("Nathan","Russell",8,1003,8,"convallis.erat@outlook.edu","334-523-0978",1),
  ("Deirdre","Richardson",6,1007,NULL,"est.nunc@outlook.org","866-004-2333",16),
  ("Wyoming","Rivera",10,1007,NULL,"eros.nec@yahoo.ca","570-264-4185",13),
  ("Lee","Melton",7,1003,7,"porttitor@outlook.couk","864-451-8648",NULL),
  ("Clarke","Ware",1,1001,4,"enim.condimentum@yahoo.couk","415-653-7185",12),
  ("John","Donovan",9,1006,7,"orci.lacus@hotmail.couk","289-504-9848",16),
  ("Rigel","Chen",9,1001,5,"neque.nullam.ut@google.com","055-314-3643",26),
  ("Mari","Malone",9,1007,NULL,"ridiculus.mus@outlook.ca","375-861-1421",11),
  ("Orla","Stanley",10,1007,NULL,"mauris.eu@protonmail.ca","561-417-5559",15),
  ("Alden","Gomez",9,1005,NULL,"cras.lorem.lorem@outlook.org","750-789-1141",6),
  ("Zachery","Sparks",5,1005,NULL,"ante.dictum@outlook.couk","332-276-4344",4),
  ("Wade","Duncan",10,1004,NULL,"ac.mi.eleifend@outlook.org","337-716-1436",13),
  ("Griffith","Guy",8,1001,2,"donec.sollicitudin@icloud.couk","821-071-7027",23),
  ("Quintessa","Dennis",5,1007,NULL,"dictum.mi.ac@icloud.couk","587-562-3913",1),
  ("Chandler","Whitley",5,1002,6,"ante.iaculis.nec@google.org","177-929-9787",22),
  ("Sigourney","Byrd",7,1005,NULL,"nisl.elementum@icloud.net","617-200-8267",20),
  ("Ann","Roman",3,1008,7,"adipiscing.fringilla@hotmail.org","611-774-7230",NULL),
  ("Jenna","Fisher",7,1004,NULL,"lorem.ipsum.dolor@google.com","572-632-7715",12),
  ("Margaret","Barker",4,1005,NULL,"lorem.donec@hotmail.org","555-683-8635",8),
  ("Abbot","Ballard",2,1004,NULL,"eleifend.egestas.sed@google.edu","737-647-8568",23),
  ("Sybill","Gray",4,1003,9,"a.ultricies.adipiscing@google.couk","800-551-6664",18),
  ("Ronan","Witt",7,1003,6,"fusce.dolor@hotmail.org","756-036-1687",20),
  ("Claudia","Vincent",9,1007,NULL,"ultrices.posuere@protonmail.ca","816-716-5719",12),
  ("Ivan","Brown",3,1003,4,"amet.lorem@google.ca","063-443-1572",9),
  ("Eaton","Ochoa",6,1001,3,"vivamus.nisi@yahoo.ca","357-661-4773",17),
  ("Ginger","Baird",8,1008,9,"sodales.mauris.blandit@hotmail.couk","681-548-1677",10),
  ("Hilel","Cantrell",9,1004,NULL,"diam.sed@google.com","124-533-4478",16);

SELECT * FROM Clients;
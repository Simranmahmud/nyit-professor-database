#create DB
DROP DATABASE IF EXISTS NYIT_Rating ;
CREATE DATABASE NYIT_Rating; 

#select the DB
USE NYIT_Rating ; 

#create the tables 
CREATE TABLE department 
(
	deptNo					VARCHAR(50)		NOT NULL		PRIMARY KEY, 
	deptName				VARCHAR(50)		NOT NULL
);

CREATE TABLE position
(
	positionID			VARCHAR(50)			NOT NULL		PRIMARY KEY, 
    positionName		VARCHAR(50)			NOT NULL
);

CREATE TABLE campus 
(
	campusID				VARCHAR(50) 		NOT NULL		PRIMARY KEY,				
    campusName			VARCHAR(50)		NOT NULL,
    address					VARCHAR(150) 		NOT NULL,
    city							VARCHAR(50)		NOT NULL, 
    state						VARCHAR(50)		NOT NULL, 
    country					VARCHAR(50)		NOT NULL, 
    zipcode					INT							NOT NULL, 
    campusChairman	VARCHAR(50)		NOT NULL
);

CREATE TABLE courses
(
	courseNo					VARCHAR(50) 		NOT NULL		PRIMARY KEY, 
    deptNo					VARCHAR(50) 		NOT NULL,
	courseName			VARCHAR(50)		NOT NULL, 
	departmentName	VARCHAR(50)		NOT NULL, 
    credits						DOUBLE					NOT NULL, 
    CONSTRAINT courses_pk_department 
		FOREIGN KEY (deptNo)
        REFERENCES department(deptNo)
);
CREATE TABLE professor
(
	professorID 			INT 							NOT NULL		PRIMARY KEY,  
    deptNo					VARCHAR(50) 		NOT NULL,
    fName 					VARCHAR(50) 		NOT NULL, 
    lName 						VARCHAR(50)		NOT NULL, 
    sex 							VARCHAR(1) 			NOT NULL, 
    positionID				VARCHAR(50)		NOT NULL, 
    positionName			VARCHAR(50)		NOT NULL, 
    campusID				VARCHAR(50)		NOT NULL, 
    courseNo					VARCHAR(50)		NOT NULL, 
    CONSTRAINT professor_fk_department
		FOREIGN KEY (deptNo)
		REFERENCES department (deptNo),
	CONSTRAINT professor_fk_position
		FOREIGN KEY (positionID)
		REFERENCES position (positionID), 
	CONSTRAINT professor_fk_campus
		FOREIGN KEY (campusID) 
        REFERENCES campus (campusID), 
	CONSTRAINT professor_fk_courses
		FOREIGN KEY (courseNo)
		REFERENCES courses (courseNo)
);

CREATE TABLE ratings 
(
    professorID 			INT 							NOT NULL 		PRIMARY KEY		REFERENCES professor(professorID), 
	fName 					VARCHAR(50) 		NOT NULL, 
    lName 						VARCHAR(50) 		NOT NULL, 
	positionID				VARCHAR(50)		NOT NULL, 
    rating 						DOUBLE					NOT NULL,
    CONSTRAINT ratings_fk_position
		FOREIGN KEY (positionID)
        REFERENCES position (positionID)
);

INSERT INTO department Values 
('CS0001', 'Computer Science'), 
('EE0001', 'Electrical Engineering'), 
('EET0001', 'Electrical Engineering Tech'), 
('ECS0001' ,'Engineering Tech & Computer Science'); 

INSERT INTO position VALUES
('AAP01', 'Adjunct Assistant Professor'), 
('AAP02', 'Adjunct Associate Professor'), 
('AF01', 'Adjunct Faculty'), 
('AI01', 'Adjunt Instructor'), 
('D01', 'Department Chair'), 
('P01', 'Assistant Professor'),
('P02', 'Associate Professor'),  
('P03', 'Professor'), 
('I01', 'Instructor'),
('L01', 'Laboratory Engineer'),
('SGPS01', 'Senior Graduate Programs Specialist'), 
('S01', 'Senior Technician'), 
('V01', 'Visiting Professor'); 

INSERT INTO campus VALUES 
('MAN10023', 'Manhattan', '1855 Broadway', 'New York', 'New York', 'USA', 10023, 'Yoshikazu Saito'), 
('OWB11568', 'Old Westbury', 'Northern Blvd & Valentines Ln', 'Old Westbury', 'New York', 'USA', 11568, 'Frank Lee'), 
('NAJ210046', 'Nanjing', '9 Wenyuan Road', 'Nanjing', 'Jiangsu', 'China', 210046, 'Yoshikazu Saito'); 

INSERT INTO courses VALUES 
('CSCI 101', 'CS0001', 'Computer Concept', 'Computer Science', 3.0),
('CSCI 105', 'CS0001', 'Introduction to Computational Tools', 'Computer Science', 2.0), 
('CSCI 110', 'CS0001', 'Introduction to Computer Science', 'Computer Science', 3.0), 
('CSCI 120', 'CS0001', 'Programming I', 'Computer Science', 3.0), 
('CSCI 125', 'CS0001', 'Computer Programming I', 'Computer Science', 3.0), 
('CSCI 130', 'CS0001', 'Computer Organization', 'Computer Science', 3.0), 
('CSCI 135', 'CS0001', 'Digital Logic Design Fundamentals', 'Computer Science', 3.0),
('CSCI 155', 'CS0001', 'Computer Organization and Architecture', 'Computer Science', 3.0), 
('CSCI 170', 'CS0001', 'Computer Architecture', 'Computer Science', 3.0), 
('CSCI 185', 'CS0001', 'Computer Programming II', 'Computer Science', 3.0), 
('CSCI 210', 'CS0001', 'Programming II', 'Computer Science', 3.0), 
('CSCI 230', 'CS0001', 'Discrete Structures', 'Computer Science', 3.0), 
('CSCI 235', 'CS0001', 'Elements of Discrete Structures', 'Computer Science', 3.0), 
('CSCI 260', 'CS0001', 'Data Structures', 'Computer Science', 3.0), 
('CSCI 270', 'CS0001', 'Probability and Statistics for Computer', 'Computer Science', 3.0), 
('CSCI 300', 'CS0001', 'Database Management', 'Computer Science', 3.0), 
('CSCI 303', 'CS0001', 'INTPRGLNG', 'Computer Science', 3.0),  
('CSCI 310', 'CS0001', 'C and Unix', 'Computer Science', 3.0), 
('CSCI 312', 'CS0001', 'Theory of Computation', 'Computer Science', 3.0), 
('CSCI 318', 'CS0001', 'Programming Language Concepts', 'Computer Science', 3.0), 
('CSCI 320', 'CS0001', 'Computer Graphics I', 'Computer Science', 3.0), 
('CSCI 325', 'CS0001', 'Compiler Design', 'Computer Science', 3.0), 
('CSCI 330', 'CS0001', 'Operating Systems', 'Computer Science', 3.0), 
('CSCI 335', 'CS0001', 'Design and Analysis of Algorithms', 'Computer Science', 3.0), 
('CSCI 345', 'CS0001', 'Computer Networks', 'Computer Science', 3.0), 
('CSCI 350', 'CS0001', 'Systems Analysis', 'Computer Science', 3.0), 
('CSCI 352', 'CS0001', 'Introduction to Network and Internet Security', 'Computer Science', 3.0), 
('CSCI 354', 'CS0001', 'Principles of Information Security', 'Computer Science', 3.0), 
('CSCI 355', 'CS0001', 'Artificial Intelligence I', 'Computer Science', 3.0), 
('CSCI 357', 'CS0001', 'Cisco Academy Level I', 'Computer Science', 3.0), 
('CSCI 360', 'CS0001', 'Web Site Engineering', 'Computer Science', 3.0), 
('CSCI 362', 'CS0001', 'Information System Security Engineering And Administration', 'Computer Science', 3.0), 
('CSCI 364', 'CS0001', 'Introduction to Computer Vision', 'Computer Science', 3.0), 
('CSCI 370', 'CS0001', 'Introduction to Computer Networks', 'Computer Science', 3.0), 
('CSCI 372', 'CS0001', 'Big Data Management and Analytics', 'Computer Science', 3.0), 
('CSCI 380', 'CS0001', 'Introduction to Software Engineering', 'Computer Science', 3.0), 
('CSCI 385', 'CS0001', 'Network and Internet Security', 'Computer Science', 3.0), 
('CSCI 401', 'CS0001', 'Database Interfaces and Programming', 'Computer Science', 3.0), 
('CSCI 405', 'CS0001', 'Distributed Database Systems', 'Computer Science', 3.0), 
('CSCI 410', 'CS0001', 'Artificial Intelligence II', 'Computer Science', 3.0), 
('CSCI 415', 'CS0001', 'Introduction to Data Mining', 'Computer Science', 3.0), 
('CSCI 420', 'CS0001', 'Computer Graphics II', 'Computer Science', 3.0), 
('CSCI 426', 'CS0001', 'Information Retrieval', 'Computer Science', 3.0), 
('CSCI 430', 'CS0001', 'Computer Animation', 'Computer Science', 3.0), 
('CSCI 436', 'CS0001', 'Big Data Management & Analytics', 'Computer Science', 3.0), 
('CSCI 440', 'CS0001', 'Network Security and Perimeter Protection', 'Computer Science', 3.0), 
('CSCI 445', 'CS0001', 'Operating System Security', 'Computer Science', 3.0), 
('CSCI 450', 'CS0001', 'Seminar Project', 'Computer Science', 3.0), 
('CSCI 455', 'CS0001', 'Senior Project', 'Computer Science', 3.0), 
('CSCI 456', 'CS0001', 'Senior Project I', 'Computer Science', 3.0), 
('CSCI 457', 'CS0001', 'Senior Project II', 'Computer Science', 3.0), 
('CSCI 460', 'CS0001', 'Special Topics I', 'Computer Science', 3.0), 
('CSCI 470', 'CS0001', 'Special Topics II', 'Computer Science', 3.0),
('EENG 125', 'EE0001', 'Fundamentals of Digital Logic', 'Electrical Engineering', 3.0), 
('EENG 201', 'EE0001', 'Introduction to Electrical Engineering', 'Electrical Engineering', 4.0), 
('EENG 211', 'EE0001', 'Electrical Circuits I', 'Electrical Engineering', 3.0), 
('EENG 212', 'EE0001', 'Electrical Circuits I and Engineering Tools', 'Electrical Engineering', 4.0), 
('EENG 221', 'EE0001', 'Computational and Engineering Tools', 'Electrical Engineering', 1.0), 
('EENG 270', 'EE0001', 'Introduction to Electronics Circuits', 'Electrical Engineering', 3.0), 
('EENG 275', 'EE0001', 'Electronics Laboratory I', 'Electrical Engineering', 1.0), 
('EENG 281', 'EE0001', 'Electrical Circuits II', 'Electrical Engineering', 3.0), 
('EENG 301', 'EE0001', 'Energy Conversion', 'Electrical Engineering', 3.0), 
('EENG 310', 'EE0001', 'Electronic Circuit Applications', 'Electrical Engineering', 3.0), 
('EENG 315', 'EE0001', 'Electronics Laboratory II', 'Electrical Engineering', 1.0),
('EENG 320', 'EE0001', 'Control Systems', 'Electrical Engineering', 3.0), 
('EENG 330', 'EE0001', 'Electromagnetic Theory I', 'Electrical Engineering', 3.0), 
('EENG 341', 'EE0001', 'Signals and Systems', 'Electrical Engineering', 3.0), 
('EENG 360', 'EE0001', 'Electronics Laboratory III', 'Electrical Engineering', 1.0), 
('EENG 371', 'EE0001', 'Microprocessors and Embedded Systems	', 'Electrical Engineering', 3.0), 
('EENG 382', 'EE0001', 'Random Signals and Statistics', 'Electrical Engineering', 3.0), 
('EENG 390', 'EE0001', 'Electromagnetic Theory II', 'Electrical Engineering', 3.0), 
('EENG 401', 'EE0001', 'Communication Theory', 'Electrical Engineering', 3.0), 
('EENG 403', 'EE0001', 'Electronics Laboratory IV', 'Electrical Engineering', 1.0), 
('EENG 405', 'EE0001', 'Electron Lab V', 'Electrical Engineering', 1.0), 
('EENG 415', 'EE0001', 'Digital Control Systems', 'Electrical Engineering', 3.0), 
('EENG 420', 'EE0001', 'Digital Filter Design', 'Electrical Engineering', 3.0), 
('EENG 425', 'EE0001', 'Principles of Robotics', 'Electrical Engineering', 3.0),  
('EENG 430', 'EE0001', 'Operational Amplifier Design', 'Electrical Engineering', 3.0),  
('EENG 440', 'EE0001', 'Microcomputer-Based Design', 'Electrical Engineering', 3.0),  
('EENG 450', 'EE0001', 'Optical Engineering', 'Electrical Engineering', 3.0),  
('EENG 470', 'EE0001', 'Antennas and Propagation', 'Electrical Engineering', 3.0),  
('EENG 480', 'EE0001', 'Communication Network Design', 'Electrical Engineering', 3.0),  
('EENG 482', 'EE0001', 'Silicon Integrated Circuit Theory and Fabrication', 'Electrical Engineering', 3.0),  
('EENG 483', 'EE0001', 'Introduction to Vlsi Design', 'Electrical Engineering', 3.0),
('EENG 484', 'EE0001', 'Digital Communications', 'Electrical Engineering', 3.0),
('EENG 486', 'EE0001', 'Information Theory and Coding	', 'Electrical Engineering', 3.0),
('EENG 489', 'EE0001', 'Senior Design Project I', 'Electrical Engineering', 2.0),
('EENG 491', 'EE0001', 'Senior Design Project II', 'Electrical Engineering', 2.0),
('EENG 494', 'EE0001', 'Special Topics I', 'Electrical Engineering', 3.0), 
('ETEC 110', 'EET0001', 'Electrical Technology I', 'Electrical Engineering Tech', 4.0), 
('ETEC 120', 'EET0001', 'Electrical Technology II', 'Electrical Engineering Tech', 4.0), 
('ETEC 131', 'EET0001', 'Electronics Technology I', 'Electrical Engineering Tech', 4.0), 
('ETEC 231', 'EET0001', 'Electronics Technology II', 'Electrical Engineering Tech', 4.0), 
('ETEC 310', 'EET0001', 'Communication Circuits', 'Electrical Engineering Tech', 4.0), 
('ETEC 325', 'EET0001', 'Applied Statistics', 'Electrical Engineering Tech', 3.0), 
('ETEC 410', 'EET0001', 'Control Systems Technology', 'Electrical Engineering Tech', 4.0), 
('ETEC 420', 'EET0001', 'Communication Circuits II', 'Electrical Engineering Tech', 3.0), 
('ETEC 430', 'EET0001', 'Dig Signal Proc', 'Electrical Engineering Tech', 3.0), 
('ETEC 450', 'EET0001', 'Micro Based Sys', 'Electrical Engineering Tech', 3.0), 
('ETEC 470', 'EET0001', 'Fiber-Optic Communication Technology', 'Electrical Engineering Tech', 3.0), 
('ETEC 490', 'EET0001', 'Special Topics', 'Electrical Engineering Tech', 3.0), 
('ETEC 491', 'EET0001', 'Special Topics II', 'Electrical Engineering Tech', 3.0), 
('ETEC 495', 'EET0001', 'Senior Design', 'Electrical Engineering Tech', 3.0), 
('ETCS 101', 'ECS0001', 'Tech Wkshp', 'Engineering Tech & Computer Science', 2.0), 
('ETCS 102', 'ECS0001', 'Computers and Society', 'Engineering Tech & Computer Science', 3.0), 
('ETCS 105', 'ECS0001', 'Career Discovery', 'Engineering Tech & Computer Science', 2.0), 
('ETCS 108', 'ECS0001', 'Computer, Internet and Society', 'Engineering Tech & Computer Science', 3.0), 
('ETCS 365', 'ECS0001', 'Engineering & Computer Science Internship', 'Engineering Tech & Computer Science', 1.0); 

INSERT INTO professor VALUES 
(12345, 'CS0001', 'Houwei', 'Cao', 'F', 'P01', 'Assistant Professor',  'MAN10023', 'CSCI 300'), 
(33224, 'CS0001', 'Susan', 'Gass', 'F', 'V01', 'Visiting Professor',  'MAN10023', 'CSCI 330'), 
(99887, 'CS0001', 'Maherukh', 'Akhtar', 'F', 'SGPS01', 'Senior Graduate Programs Specialist', 'OWB11568', 'CSCI 380'),
(15554, 'CS0001', 'Wenjia', 'Li', 'M', 'P01', 'Assistant Professor', 'MAN10023', 'CSCI 185'),
(78695, 'CS0001', 'Frank', 'Lee', 'M', 'D01', 'Department Chair', 'OWB11568', 'CSCI 436'), 
(88435, 'EE0001', 'Yoshikazu', 'Saito', 'M', 'D01', 'Department Chair',  'MAN10023', 'EENG 403'), 
(23231, 'EE0001', 'Ziqian', 'Dong', 'F', 'P02', 'Associate Professor', 'MAN10023', 'EENG 341'), 
(66954, 'EE0001', 'Jeffrey', 'Ting', 'M', 'AI01', 'Adjunt Instructor', 'OWB11568', 'EENG 371'), 
(89322, 'EE0001', 'Ying', 'Zhang', 'F', 'AF01', 'Adjunct Faculty', 'NAJ210046', 'EENG 360'), 
(77744, 'EE0001', 'Sabiha', 'Wadoo', 'F', 'P01', 'Assistant Professor', 'OWB11568', 'EENG 320'); 

INSERT INTO ratings VALUES 
(12345, 'Houwei', 'Cao', 'P01', 4.8), 
(33224, 'Susan', 'Gass', 'V01', '3.5'), 
(99887, 'Maherukh', 'Akhtar', 'SGPS01', 4.5), 
(15554, 'Wenjia', 'Li', 'P01', 4.7), 
(78695, 'Frank', 'Lee', 'D01', 4.2), 
(88435, 'Yoshikazu', 'Saito', 'D01', 4.6), 
(23231, 'Ziqian', 'Dong', 'P02', 3.5), 
(66954, 'Jeffrey', 'Ting', 'AI01', 2.5), 
(00322, 'Ying', 'Zhang', 'AF01', 1.5),
(77744, 'Sabiha', 'Wadoo', 'P01', 4.7); 
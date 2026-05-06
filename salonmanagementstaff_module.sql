-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2026 at 10:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



CREATE TABLE `attendance` (
  `AttendanceID` int(11) NOT NULL,
  `StaffID` int(11) DEFAULT NULL,
  `WorkDate` date DEFAULT NULL,
  `ClockIn` time DEFAULT NULL,
  `ClockOut` time DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;





INSERT INTO `attendance` (`AttendanceID`, `StaffID`, `WorkDate`, `ClockIn`, `ClockOut`, `Status`) VALUES
(1, 1, '2023-11-01', '07:55:00', '17:05:00', 'Present'),
(2, 2, '2023-11-01', '08:15:00', '17:00:00', 'Late');



CREATE TABLE `leave_requests` (
  `LeaveID` int(11) NOT NULL,
  `StaffID` int(11) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `LeaveType` varchar(30) DEFAULT NULL,
  `ApprovalStatus` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `leave_requests` (`LeaveID`, `StaffID`, `StartDate`, `EndDate`, `LeaveType`, `ApprovalStatus`) VALUES
(1, 1, '2024-06-01', '2024-06-05', 'Vacation', 'Approved'),
(2, 2, '2024-05-10', '2024-05-12', 'Sick Leave', 'Approved'),
(3, 3, '2024-07-15', '2024-07-20', 'Personal Leave', 'Pending'),
(4, 4, '2024-08-01', '2024-08-14', 'Maternity', 'Approved'),
(5, 5, '2024-05-20', '2024-05-21', 'Study Leave', 'Pending');



CREATE TABLE `roles` (
  `RoleID` int(11) NOT NULL,
  `RoleTitle` varchar(50) DEFAULT NULL,
  `BaseSalary` decimal(10,2) DEFAULT NULL,
  `CommissionRate` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `roles` (`RoleID`, `RoleTitle`, `BaseSalary`, `CommissionRate`) VALUES
(1, 'Senior Stylist', 850000.00, 20.00),
(2, 'Junior Stylist', 680000.00, 15.00),
(3, 'Barber', 400000.00, 10.00),
(4, 'Receptionist', 530000.00, 5.00);



CREATE TABLE `shifts` (
  `ShiftID` int(11) NOT NULL,
  `DayOfWeek` varchar(15) DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `EndTime` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `shifts` (`ShiftID`, `DayOfWeek`, `StartTime`, `EndTime`) VALUES
(1, 'Monday', '08:00:00', '14:00:00'),
(2, 'Monday', '14:00:00', '20:00:00'),
(3, 'Saturday', '09:00:00', '17:00:00');


CREATE TABLE `skills` (
  `SkillID` int(11) NOT NULL,
  `SkillName` varchar(50) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `skills` (`SkillID`, `SkillName`, `Description`) VALUES
(1, 'Bridal Styling', 'Complex hair styling for weddings'),
(2, 'Dreadlocking', 'Traditional and modern locking techniques'),
(3, 'Pedicure', 'Feet and nail care'),
(4, 'Skin Consultation', 'Dermatological advice for clients');



CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Specialization` varchar(50) DEFAULT NULL,
  `RoleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `staff` (`StaffID`, `FirstName`, `LastName`, `Email`, `Phone`, `HireDate`, `Specialization`, `RoleID`) VALUES
(1, 'Alice', 'Ainemukama', 'aliceaine@qmail.com', '074567890', '2022-01-15', 'Hair Coloring', 1),
(2, 'Aijuka', 'Smith', 'boba12@gmail.com', '0774567891', '2022-06-01', 'Men Cuts', 3),
(3, 'Gariyo', 'Brown', 'gariyobrown@gmail.com', '0704567892', '2023-02-10', 'Manicure', 2),
(4, 'Diana', 'Ankunda', 'dianaa@gmail.com', '0744567893', '2021-11-20', 'Nail Art', 1),
(5, 'Evan', 'Mwijukye', 'evanmk@gmail.com', '0784567894', '2023-05-05', 'Customer Relations', 4);



CREATE TABLE `staff_schedules` (
  `ScheduleID` int(11) NOT NULL,
  `StaffID` int(11) DEFAULT NULL,
  `ShiftID` int(11) DEFAULT NULL,
  `DateAssigned` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `staff_schedules` (`ScheduleID`, `StaffID`, `ShiftID`, `DateAssigned`) VALUES
(6, 1, 1, '2023-10-23'),
(7, 2, 1, '2023-10-23'),
(8, 3, 2, '2023-10-23'),
(9, 4, 3, '2023-10-28'),
(10, 5, 3, '2023-10-28');



CREATE TABLE `staff_skills` (
  `StaffID` int(11) NOT NULL,
  `SkillID` int(11) NOT NULL,
  `CertificationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `staff_skills` (`StaffID`, `SkillID`, `CertificationDate`) VALUES
(1, 1, '2023-01-10'),
(1, 2, '2023-02-15'),
(2, 3, '2023-03-20');


ALTER TABLE `attendance`
  ADD PRIMARY KEY (`AttendanceID`),
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`LeaveID`),
  ADD KEY `StaffID` (`StaffID`);


ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleID`);


ALTER TABLE `shifts`
  ADD PRIMARY KEY (`ShiftID`);


ALTER TABLE `skills`
  ADD PRIMARY KEY (`SkillID`);


ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `RoleID` (`RoleID`);


ALTER TABLE `staff_schedules`
  ADD PRIMARY KEY (`ScheduleID`),
  ADD KEY `StaffID` (`StaffID`),
  ADD KEY `ShiftID` (`ShiftID`);


ALTER TABLE `staff_skills`
  ADD PRIMARY KEY (`StaffID`,`SkillID`),
  ADD KEY `SkillID` (`SkillID`);

--

ALTER TABLE `attendance`
  MODIFY `AttendanceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `leave_requests`
  MODIFY `LeaveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `roles`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `shifts`
  MODIFY `ShiftID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


ALTER TABLE `skills`
  MODIFY `SkillID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;


ALTER TABLE `staff_schedules`
  MODIFY `ScheduleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);


ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`);


ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`RoleID`);


ALTER TABLE `staff_schedules`
  ADD CONSTRAINT `staff_schedules_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`),
  ADD CONSTRAINT `staff_schedules_ibfk_2` FOREIGN KEY (`ShiftID`) REFERENCES `shifts` (`ShiftID`);


ALTER TABLE `staff_skills`
  ADD CONSTRAINT `staff_skills_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`),
  ADD CONSTRAINT `staff_skills_ibfk_2` FOREIGN KEY (`SkillID`) REFERENCES `skills` (`SkillID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

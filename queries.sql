-- ============================================
-- Hotel Management Database Project
-- Author: Cemre Bozdogan
-- ============================================

-- ============================================
-- Create Guests Table
-- ============================================

CREATE TABLE Guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Insert Guest Data

INSERT INTO Guests (first_name, last_name, email, phone)
VALUES
('Ahmet', 'Yilmaz', 'ahmet@gmail.com', '555111111'),
('Ayse', 'Demir', 'ayse@gmail.com', '555222222'),
('Mehmet', 'Kaya', 'mehmet@gmail.com', '555333333');



-- ============================================
-- Create Room Types Table
-- ============================================

CREATE TABLE RoomTypes (
    room_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50),
    price_per_night DECIMAL(10,2)
);

-- Insert Room Types

INSERT INTO RoomTypes (type_name, price_per_night)
VALUES
('Single',80.00),
('Double',120.00),
('Suite',250.00);



-- ============================================
-- Create Rooms Table
-- ============================================

CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10),
    room_type_id INT,
    status VARCHAR(20)
);

-- Insert Rooms

INSERT INTO Rooms (room_number, room_type_id, status)
VALUES
('101',1,'Available'),
('102',2,'Occupied'),
('201',3,'Available');



-- ============================================
-- Create Reservations Table
-- ============================================

CREATE TABLE Reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    total_price DECIMAL(10,2)
);

-- Insert Reservations

INSERT INTO Reservations
(guest_id, room_id, check_in, check_out, total_price)
VALUES
(1,1,'2025-07-01','2025-07-05',320.00),
(2,2,'2025-07-10','2025-07-12',240.00),
(3,3,'2025-07-15','2025-07-18',750.00);



-- ============================================
-- Query 1: Display All Guests
-- ============================================

SELECT * FROM Guests;



-- ============================================
-- Query 2: Display All Room Types
-- ============================================

SELECT * FROM RoomTypes;



-- ============================================
-- Query 3: Display All Rooms
-- ============================================

SELECT * FROM Rooms;



-- ============================================
-- Query 4: Display All Reservations
-- ============================================

SELECT * FROM Reservations;



-- ============================================
-- Query 5: Reservation Details (JOIN)
-- ============================================

SELECT
    g.first_name,
    g.last_name,
    r.room_number,
    res.check_in,
    res.check_out,
    res.total_price
FROM Reservations res
JOIN Guests g
ON res.guest_id = g.guest_id
JOIN Rooms r
ON res.room_id = r.room_id;



-- ============================================
-- Query 6: Available Rooms
-- ============================================

SELECT *
FROM Rooms
WHERE status = 'Available';



-- ============================================
-- Query 7: Total Reservations
-- ============================================

SELECT COUNT(*) AS Total_Reservations
FROM Reservations;



-- ============================================
-- Query 8: Reservation Dates
-- ============================================

SELECT
reservation_id,
check_in,
check_out
FROM Reservations;



-- ============================================
-- Update Query
-- ============================================

UPDATE Rooms
SET status = 'Occupied'
WHERE room_id = 1;

SELECT *
FROM Rooms
WHERE room_id = 1;

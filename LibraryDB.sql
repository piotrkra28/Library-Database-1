
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Tables

-- Users table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
    JoinDate DATE NOT NULL
);

--  Genres table
CREATE TABLE Genres (
    GenreID INT AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(50) NOT NULL
);

--  SubGenres table
CREATE TABLE SubGenres (
    SubGenreID INT AUTO_INCREMENT PRIMARY KEY,
    SubGenreName VARCHAR(50) NOT NULL,
    GenreID INT NOT NULL,
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

--  Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    PublicationYear INT NOT NULL,
    GenreID INT NOT NULL,
    SubGenreID INT NOT NULL,
    AvailableCopies INT NOT NULL,
    TotalCopies INT NOT NULL,
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID),
    FOREIGN KEY (SubGenreID) REFERENCES SubGenres(SubGenreID)
);

--  Checkouts table
CREATE TABLE Checkouts (
    CheckoutID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    BookID INT NOT NULL,
    CheckoutDate DATE NOT NULL,
    ReturnDate DATE,
    Status ENUM('CheckedOut', 'Returned', 'Overdue') NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

--  Reviews table
CREATE TABLE Reviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    UserID INT NOT NULL,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate DATE NOT NULL,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


-- Dummy Data

-- Users table dummy data 
INSERT INTO Users (Username, Email, Password, JoinDate)
VALUES 
('Alice', 'alice@example.com', 'password1', '2023-01-01'),
('Bob', 'bob@example.com', 'password2', '2023-02-01'),
('Charlie', 'charlie@example.com', 'password3', '2023-03-01'),
('Diana', 'diana@example.com', 'password4', '2023-04-01'),
('Eve', 'eve@example.com', 'password5', '2023-05-01'),
('Frank', 'frank@example.com', 'password6', '2023-06-01'),
('Grace', 'grace@example.com', 'password7', '2023-07-01'),
('Hank', 'hank@example.com', 'password8', '2023-08-01'),
('Ivy', 'ivy@example.com', 'password9', '2023-09-01'),
('Jack', 'jack@example.com', 'password10', '2023-10-01'),
('Karen', 'karen@example.com', 'password11', '2023-11-01'),
('Leo', 'leo@example.com', 'password12', '2023-12-01'),
('Mona', 'mona@example.com', 'password13', '2024-01-01'),
('Nina', 'nina@example.com', 'password14', '2024-02-01'),
('Oscar', 'oscar@example.com', 'password15', '2024-03-01'),
('Paul', 'paul@example.com', 'password16', '2024-04-01'),
('Quinn', 'quinn@example.com', 'password17', '2024-05-01'),
('Rose', 'rose@example.com', 'password18', '2024-06-01'),
('Steve', 'steve@example.com', 'password19', '2024-07-01'),
('Tina', 'tina@example.com', 'password20', '2024-08-01');

--  Genres table dummy data 
INSERT INTO Genres (GenreName)
VALUES 
('Fiction'), ('Non-Fiction'), ('Science Fiction'), ('Fantasy'), 
('Biography'), ('Mystery'), ('Romance'), ('Thriller'), 
('Young Adult'), ('Historical Fiction'), ('Horror'), ('Drama'), 
('Poetry'), ('Adventure'), ('Self-Help'), ('Graphic Novel'),
('Classic'), ('Satire'), ('Autobiography'), ('Travel');

--  SubGenres table dummy data 
INSERT INTO SubGenres (SubGenreName, GenreID)
VALUES 
('Space Opera', 3), ('Cyberpunk', 3), ('Epic Fantasy', 4), ('Dark Fantasy', 4),
('True Crime', 6), ('Cozy Mystery', 6), ('Chick Lit', 7), ('Paranormal Romance', 7),
('Dystopian', 3), ('Time Travel', 3), ('Historical Thriller', 8), ('Medical Thriller', 8),
('Urban Fantasy', 4), ('High Fantasy', 4), ('Political Drama', 12), ('Romantic Drama', 12),
('Experimental Poetry', 13), ('Lyric Poetry', 13), ('Heroic Adventure', 14), ('Travel Memoir', 20);

-- Insert dummy data into Books table
INSERT INTO Books (Title, Author, PublicationYear, GenreID, SubGenreID, AvailableCopies, TotalCopies)
VALUES 
('Dune', 'Frank Herbert', 1965, 3, 1, 5, 10),
('Neuromancer', 'William Gibson', 1984, 3, 2, 3, 8),
('The Hobbit', 'J.R.R. Tolkien', 1937, 4, 13, 4, 7),
('Game of Thrones', 'George R.R. Martin', 1996, 4, 14, 2, 6),
('In Cold Blood', 'Truman Capote', 1966, 6, 5, 1, 5),
('Big Little Lies', 'Liane Moriarty', 2014, 6, 6, 6, 10),
('Me Before You', 'Jojo Moyes', 2012, 7, 7, 8, 12),
('Twilight', 'Stephenie Meyer', 2005, 7, 8, 10, 15),
('1984', 'George Orwell', 1949, 3, 9, 7, 12),
('The Time Machine', 'H.G. Wells', 1895, 3, 10, 5, 8),
('The Da Vinci Code', 'Dan Brown', 2003, 8, 11, 2, 4),
('Coma', 'Robin Cook', 1977, 8, 12, 3, 6),
('American Gods', 'Neil Gaiman', 2001, 4, 13, 4, 9),
('Mistborn', 'Brandon Sanderson', 2006, 4, 14, 3, 7),
('The West Wing', 'Aaron Sorkin', 2000, 12, 15, 2, 3),
('The Notebook', 'Nicholas Sparks', 1996, 12, 16, 5, 8),
('The Waste Land', 'T.S. Eliot', 1922, 13, 17, 10, 15),
('Ariel', 'Sylvia Plath', 1965, 13, 18, 7, 10),
('The Odyssey', 'Homer', -800, 14, 19, 2, 4),
('Eat, Pray, Love', 'Elizabeth Gilbert', 2006, 20, 20, 3, 5);

--  Checkouts table dummy data 
INSERT INTO Checkouts (UserID, BookID, CheckoutDate, ReturnDate, Status)
VALUES 
(1, 1, '2024-11-01', '2024-11-15', 'Returned'),
(2, 2, '2024-11-03', NULL, 'CheckedOut'),
(3, 3, '2024-11-05', '2024-11-19', 'Returned'),
(4, 4, '2024-11-07', NULL, 'CheckedOut'),
(5, 5, '2024-11-09', '2024-11-23', 'Overdue'),
(6, 6, '2024-11-11', NULL, 'CheckedOut'),
(7, 7, '2024-11-13', '2024-11-27', 'Returned'),
(8, 8, '2024-11-15', NULL, 'CheckedOut'),
(9, 9, '2024-11-17', '2024-12-01', 'Returned'),
(10, 10, '2024-11-19', NULL, 'CheckedOut'),
(11, 11, '2024-11-21', '2024-12-05', 'Returned'),
(12, 12, '2024-11-23', NULL, 'CheckedOut'),
(13, 13, '2024-11-25', '2024-12-09', 'Returned'),
(14, 14, '2024-11-27', NULL, 'CheckedOut'),
(15, 15, '2024-11-29', '2024-12-13', 'Returned'),
(16, 16, '2024-12-01', NULL, 'CheckedOut'),
(17, 17, '2024-12-03', '2024-12-17', 'Returned'),
(18, 18, '2024-12-05', NULL, 'CheckedOut'),
(19, 19, '2024-12-07', '2024-12-21', 'Returned'),
(20, 20, '2024-12-09', NULL, 'CheckedOut');

--  Reviews table dummy data 
INSERT INTO Reviews (BookID, UserID, Rating, Comment, ReviewDate)
VALUES 
(1, 1, 5, 'Amazing book!', '2024-11-01'),
(2, 2, 4, 'Great concept.', '2024-11-03'),
(3, 3, 5, 'Loved it.', '2024-11-05'),
(4, 4, 3, 'Good but slow.', '2024-11-07'),
(5, 5, 4, 'Interesting read.', '2024-11-09'),
(6, 6, 5, 'Highly recommend.', '2024-11-11'),
(7, 7, 2, 'Not my taste.', '2024-11-13'),
(8, 8, 5, 'Fantastic story.', '2024-11-15'),
(9, 9, 3, 'Okay read.', '2024-11-17'),
(10, 10, 4, 'Enjoyed it.', '2024-11-19'),
(11, 11, 5, 'Thrilling!', '2024-11-21'),
(12, 12, 3, 'Mediocre.', '2024-11-23'),
(13, 13, 4, 'Good pacing.', '2024-11-25'),
(14, 14, 5, 'Masterpiece!', '2024-11-27'),
(15, 15, 2, 'Boring.', '2024-11-29'),
(16, 16, 5, 'Touching.', '2024-12-01'),
(17, 17, 4, 'Thought-provoking.', '2024-12-03'),
(18, 18, 3, 'Meh.', '2024-12-05'),
(19, 19, 5, 'Epic!', '2024-12-07'),
(20, 20, 4, 'Inspirational.', '2024-12-09');

-- SQL statements

-- Check Book Availability
SELECT Title, Author, AvailableCopies, TotalCopies
FROM Books
WHERE Title = 'Dune';

-- Return a Book
UPDATE Checkouts
SET ReturnDate = CURDATE(), Status = 'Returned'
WHERE CheckoutID = 1 AND Status = 'CheckedOut';

-- Search for Books by Author or Keywords
SELECT Title, Author, PublicationYear
FROM Books
WHERE Author LIKE '%George%' OR Title LIKE '%Thrones%';

-- Generate a List of Overdue Books
SELECT Users.Username, Books.Title, Checkouts.CheckoutDate, DATE_ADD(Checkouts.CheckoutDate, INTERVAL 14 DAY) AS DueDate
FROM Checkouts
INNER JOIN Users ON Checkouts.UserID = Users.UserID
INNER JOIN Books ON Checkouts.BookID = Books.BookID
WHERE Checkouts.Status = 'CheckedOut' AND DATE_ADD(Checkouts.CheckoutDate, INTERVAL 14 DAY) < CURDATE();

-- Update Book Inventory After Return
UPDATE Books
SET AvailableCopies = AvailableCopies + 1
WHERE BookID = 1;


-- LIBRARY VIEWS

-- Book Availability
CREATE VIEW View_BookAvailability AS
SELECT 
    Books.BookID,
    Books.Title,
    Books.Author,
    Books.PublicationYear,
    Genres.GenreName,
    SubGenres.SubGenreName,
    Books.AvailableCopies,
    Books.TotalCopies
FROM Books
INNER JOIN Genres ON Books.GenreID = Genres.GenreID
INNER JOIN SubGenres ON Books.SubGenreID = SubGenres.SubGenreID;

-- User Borrowing History
CREATE VIEW View_UserBorrowingHistory AS
SELECT 
    Checkouts.CheckoutID,
    Users.Username,
    Books.Title,
    Checkouts.CheckoutDate,
    DATE_ADD(Checkouts.CheckoutDate, INTERVAL 14 DAY) AS DueDate,
    Checkouts.ReturnDate,
    Checkouts.Status
FROM Checkouts
INNER JOIN Users ON Checkouts.UserID = Users.UserID
INNER JOIN Books ON Checkouts.BookID = Books.BookID;

-- Book Reviews and Ratings
CREATE VIEW View_BookReviews AS
SELECT 
    Books.BookID,
    Books.Title,
    AVG(Reviews.Rating) AS AverageRating,
    COUNT(Reviews.ReviewID) AS NumberOfReviews
FROM Books
LEFT JOIN Reviews ON Books.BookID = Reviews.BookID
GROUP BY Books.BookID, Books.Title;

-- Active Reservations

CREATE VIEW View_ActiveReservations AS
SELECT 
    Checkouts.CheckoutID,
    Users.Username,
    Books.Title,
    Checkouts.CheckoutDate,
    DATE_ADD(Checkouts.CheckoutDate, INTERVAL 14 DAY) AS DueDate
FROM Checkouts
INNER JOIN Users ON Checkouts.UserID = Users.UserID
INNER JOIN Books ON Checkouts.BookID = Books.BookID
WHERE Checkouts.Status = 'CheckedOut';

-- Popular Books
CREATE VIEW View_PopularBooks AS
SELECT 
    Books.BookID,
    Books.Title,
    AVG(Reviews.Rating) AS AverageRating,
    COUNT(Reviews.ReviewID) AS TotalReviews
FROM Reviews
INNER JOIN Books ON Reviews.BookID = Books.BookID
GROUP BY Books.BookID, Books.Title
HAVING COUNT(Reviews.ReviewID) > 5
ORDER BY AverageRating DESC;


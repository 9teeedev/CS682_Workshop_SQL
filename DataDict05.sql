CREATE TABLE Cinema(
    CinemaID INT PRIMARY KEY,
    CinemaName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(200) NOT NULL,
    Capacity INT(4) NOT NULL,
    OtherInfo NVARCHAR(255)
)

CREATE TABLE CinemaPhone(
    CinemaID INT,
    PhoneNumber NVARCHAR(15),
    PRIMARY KEY (CinemaID, PhoneNumber),
    FOREIGN KEY (CinemaID) REFERENCES Cinema(CinemaID)
)

CREATE TABLE MovieType(
    TypeID INT PRIMARY KEY,
    TypeName NVARCHAR(100) NOT NULL
)

CREATE TABLE Movie(
    MovieID INT PRIMARY KEY,
    MovieTitle NVARCHAR(255) NOT NULL,
    TypeID INT,
    FOREIGN KEY (TypeID) REFERENCES MovieType(TypeID)
)

CREATE TABLE Screening(
    CinemaID INT,
    MovieID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    FOREIGN KEY (CinemaID) REFERENCES Cinema(CinemaID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
)

CREATE TABLE SeatRow(
    CinemaID INT,
    RowNo VARCHAR(10),
    SeatCount INT NOT NULL,
    PRIMARY KEY (CinemaID, RowNo),
    FOREIGN KEY (CinemaID) REFERENCES Cinema(CinemaID)
)

CREATE TABLE ShowTime(
    ShowTimeID INT PRIMARY KEY,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL
)

CREATE TABLE ActualSeat(
    CinemaID INT,
    RowNo VARCHAR(10),
    SeatNo VARCHAR(10),
    ShowDate DATETIME NOT NULL,
    ShowTimeID INT,
    PRIMARY KEY (CinemaID, RowNo, SeatNo, ShowDate),
    FOREIGN KEY (CinemaID, RowNo) REFERENCES SeatRow(CinemaID, RowNo),
    FOREIGN KEY (ShowTimeID) REFERENCES ShowTime(ShowTimeID)
)

CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    Phone VARCHAR(10),
    CreditCardNo VARCHAR(30)
)

CREATE TABLE Reservation(
    ReservationID INT PRIMARY KEY,
    ReservationDate DATETIME NOT NULL,
    DeservDate DATETIME NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)

CREATE TABLE ReservedSeat(
    ReservationID INT,
    SeatNo VARCHAR(10),
    ShowDate DATETIME NOT NULL,
    CinemaID INT,
    RowNo VARCHAR(10),
    ShowTimeID INT,
    PRIMARY KEY (ReservationID, SeatNo, ShowDate),
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
    FOREIGN KEY (CinemaID) REFERENCES Cinema(CinemaID),
    FOREIGN KEY (ShowTimeID) REFERENCES ShowTime(ShowTimeID),
    FOREIGN KEY (RowNo) REFERENCES SeatRow(RowNo)
)
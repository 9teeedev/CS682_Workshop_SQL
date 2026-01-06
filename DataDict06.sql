CREATE TABLE Airport(
    AirportCode CHAR(3) PRIMARY KEY,
    AirportName VARCHAR(100) NOT NULL,
    Province VARCHAR(100) NOT NULL,
)

CREATE TABLE AircarfType(
    TypeCode VARCHAR(10) PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL,
    Manufacturer VARCHAR(50)
)

CREATE TABLE CanLand(
    AirportCode CHAR(3),
    TypeCode VARCHAR(10),
    PRIMARY KEY (AirportCode, TypeCode),
    FOREIGN KEY (AirportCode) REFERENCES Airport(AirportCode),
    FOREIGN KEY (TypeCode) REFERENCES AircarfType(TypeCode)
)

CREATE TABLE Aircraft(
    AircraftCode VARCHAR(10) PRIMARY KEY,
    SeatCapacity INT(11) NOT NULL,
    TypeCode VARCHAR(10),
    FOREIGN KEY (TypeCode) REFERENCES AircarfType(TypeCode)
)

CREATE TABLE Flight(
    FlightCode VARCHAR(10) PRIMARY KEY,
    Airline VARCHAR(50) NOT NULL,
    FlightDay VARCHAR(20)
)

CREATE TABLE FlightSchedule(
    SeqNo INT(11),
    FlightCode VARCHAR(10),
    DepTime DATETIME NOT NULL,
    ArrTime DATETIME NOT NULL,
    OriginAirport CHAR(3),
    DestAirport CHAR(3),
    PRIMARY KEY (SeqNo, FlightCode),
    FOREIGN KEY (FlightCode) REFERENCES Flight(FlightCode),
    FOREIGN KEY (OriginAirport) REFERENCES Airport(AirportCode),
    FOREIGN KEY (DestAirport) REFERENCES Airport(AirportCode)
)

CREATE TABLE FlightOperation(
    FlightDate DATETIME NOT NULL,
    SeqNo INT(11),
    FlightCode VARCHAR(10),
    TotalSeats INT(11),
    AircraftCode VARCHAR(10),
    ActualInTime DATETIME,
    ActualOutTime DATETIME,
    ActualOrigin CHAR(3),
    ActualDest CHAR(3),
    PRIMARY KEY (FlightDate, SeqNo, FlightCode),
    FOREIGN KEY (SeqNo, FlightCode) REFERENCES FlightSchedule(SeqNo, FlightCode),
    FOREIGN KEY (AircraftCode) REFERENCES Aircraft(AircraftCode),
    FOREIGN KEY (ActualOrigin) REFERENCES Airport(AirportCode),
    FOREIGN KEY (ActualDest) REFERENCES Airport(AirportCode)
)

CREATE TABLE Seat(
    SeatNo VARCHAR(5),
    FlightDate DATETIME NOT NULL,
    SeqNo INT(11),
    FlightCode VARCHAR(10),
    CustomerName VARCHAR(100),
    Phone VARCHAR(20),
    PRIMARY KEY (SeatNo, FlightDate, SeqNo, FlightCode),
    FOREIGN KEY (FlightDate, SeqNo, FlightCode) REFERENCES FlightOperation(FlightDate, SeqNo, FlightCode)
)
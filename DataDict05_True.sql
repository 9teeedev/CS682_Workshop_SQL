CREATE TABLE Cinema(
	CinemaNo INT,
	CenemaName NVARCHAR(30),
	Location NVARCHAR(30),
	Num_cust INT,
	Detail NVARCHAR(150),
	CONSTRAINT PK_Cinema PRIMARY KEY (CinemaNo),
)

CREATE TABLE Cinema_Phone(
	CinemaNo INT,
	Phone VARCHAR(10),
	CONSTRAINT PK_CinemaPhone PRIMARY KEY (CinemaNo, Phone),
	FOREIGN KEY (CinemaNo) REFERENCES Cinema(CinemaNo)
)

CREATE TABLE Movie_Type(
	MTID Char(5),
	MTName nVarchar(30),
	CONSTRAINT PK_MovieType PRIMARY KEY (MTID)
)

CREATE TABLE Movies(
	MovieID CHAR(5),
	MovieTitle nVarchar(50),
	MTID Char(5),
	CONSTRAINT PK_Movies PRIMARY KEY (MovieID),
	FOREIGN KEY (MTID) REFERENCES Movie_Type(MTID)
)

CREATE TABLE Customers(
	CusID Char(5),
	CusName nVarchar(30),
	Phone Varchar(12),
	CreditNo Varchar(15),
	CONSTRAINT PK_Customers PRIMARY KEY (CusID)
)

CREATE TABLE Reservation(
	ResNo Char(7),
	ResDate Date,
	RequireDate Date,
	CusID Char(5),
	CONSTRAINT PK_Reservation PRIMARY KEY (ResNo),
	FOREIGN KEY (CusID) REFERENCES Customers(CusID)
)

CREATE TABLE Show_Order(
	ShowID int,
	Time_Start Time,
	Time_Stop Time,
	CONSTRAINT PK_ShowOrder PRIMARY KEY (ShowID)
)

CREATE TABLE Seats(
	CinemaNo INT,
	RowNo Char(1),
	NumSeat INT
	CONSTRAINT PK_Seats PRIMARY KEY (CinemaNo, RowNo),
	FOREIGN KEY (CinemaNo) REFERENCES Cinema(CinemaNo)
)

CREATE TABLE RealSeat(
	CinemaNo int,
	RowNo Char(1),
	SeatNo INT,
	ShowDate Date,
	ShowID INT,
	CONSTRAINT PK_RealSeat PRIMARY KEY (CinemaNo, RowNo, SeatNo, ShowDate),
	FOREIGN KEY (CinemaNo,RowNo) REFERENCES Seats(CinemaNo, RowNo),
	FOREIGN KEY (ShowID) REFERENCES Show_Order(ShowID)
)

CREATE TABLE Reserve_Seat(
	CinemaNo INT,
	RowNo CHAR(1),
	SeatNo INT,
	ShowDate Date,
	ShowID INT,
	ResNo CHAR(7),
	CONSTRAINT PK_ResSeat PRIMARY KEY (CinemaNo, RowNo, SeatNo, ShowDate, ShowID),
	FOREIGN KEY (CinemaNo, RowNo) REFERENCES Seats(CinemaNo, RowNo),
	FOREIGN KEY (ShowID) REFERENCES Show_Order(ShowID),
	FOREIGN KEY (ResNo) REFERENCES Reservation(Resno)
)

CREATE TABLE Shows(
	CinemaNo INT,
	MovieID CHAR(5),
	Date_Start Date,
	Date_End Date,
	CONSTRAINT PK_Shows PRIMARY KEY (CinemaNo, MovieID),
	FOREIGN KEY (CinemaNo) REFERENCES Cinema(CinemaNo),
	FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
)

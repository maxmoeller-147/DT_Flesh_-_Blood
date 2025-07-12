
DROP TABLE IF Cards
DROP TABLE IF Classes
DROP TABLE IF Types
DROP TABLE IF Colours





CREATE TABLE Colours (
    Colour_id INT PRIMARY KEY,
    ColourName VARCHAR(100) NOT NULL
);


CREATE TABLE Types (
    Type_id INT PRIMARY KEY,
    TypeName VARCHAR(100) NOT NULL
);


CREATE TABLE Classes (
    Class_id INT PRIMARY KEY,
    ClassName VARCHAR(100) NOT NULL
);


CREATE TABLE Cards (
    Card_id INT PRIMARY KEY,
    CardName VARCHAR(100) NOT NULL,
    Type_id INT NOT NULL,
    Colour_id INT NOT NULL,
    FOREIGN KEY (Colour_id) REFERENCES Colours(Colour_id) ON DELETE CASCADE,
    FOREIGN KEY (Type_id) REFERENCES Types(Type_id) ON DELETE CASCADE
);

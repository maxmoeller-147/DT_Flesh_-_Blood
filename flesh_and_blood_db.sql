DROP TABLE IF EXISTS CardClasses
DROP TABLE IF EXISTS Cards
DROP TABLE IF EXISTS Classes
DROP TABLE IF EXISTS Types
DROP TABLE IF EXISTS Colours





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
    Type_id INT NOT NULL,
    Colour_id INT NOT NULL,
    CardName VARCHAR(100) NOT NULL,
    FOREIGN KEY (Colour_id) REFERENCES Colours(Colour_id) ON DELETE CASCADE,
    FOREIGN KEY (Type_id) REFERENCES Types(Type_id) ON DELETE CASCADE
);



CREATE TABLE CardClasses (
    Card_id INT NOT NULL,
    Class_id INT NOT NULL,
    PRIMARY KEY (Card_id, Class_id),
    FOREIGN KEY (Card_id) REFERENCES Cards(Card_id), ON DELETE CASCADE
    FOREIGN KEY (Class_id) REFERENCES Classes(Class_id) ON DELETE CASCADE
);



INSERT INTO Colours (Colour_id, ColourName) VALUES
(1, 'Red'),
(2, 'Yellow'),
(3, 'Blue');



INSERT INTO Types (Type_id, TypeName) VALUES
(1, 'Attack Reaction'),
(2, 'Action Card'),
(3, 'Attack Action'),
(4, 'Defense Reaction');



INSERT INTO Classes (Class_id, ClassName) VALUES
(1, 'Warrior'),
(2, 'Guardian'),
(3, 'Generic');

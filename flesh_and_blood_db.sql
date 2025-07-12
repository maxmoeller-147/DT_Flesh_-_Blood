DROP TABLE IF EXISTS CardClasses;
DROP TABLE IF EXISTS Cards;
DROP TABLE IF EXISTS Classes;
DROP TABLE IF EXISTS Types;
DROP TABLE IF EXISTS Colours;





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
    FOREIGN KEY (Card_id) REFERENCES Cards(Card_id) ON DELETE CASCADE,
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



INSERT INTO Cards (Card_id, CardName, Type_id, Colour_id) VALUES
(1, 'In the swing', 1, 1),
(2, 'Raise an Army', 2, 2),
(3, 'Provoke', 1, 3),
(4, 'Spinal Crush', 3, 1),
(5, 'The Golden Son', 2, 2),
(6, 'Macho Grande', 3, 3),
(7, 'Sink Below', 4, 1),
(8, 'Pummel', 1, 2),
(9, 'Trot Along', 2, 3);



INSERT INTO CardClasses (Card_id, Class_id) VALUES
(1, 1), -- In the swing → Warrior
(2, 1), -- Raise an Army → Warrior
(3, 1), -- Provoke → Warrior
(4, 2), -- Spinal Crush → Guardian
(5, 2), -- The Golden Son → Guardian
(6, 2), -- Macho Grande → Guardian
(7, 3), -- Sink Below → Generic
(8, 3), -- Pummel → Generic
(9, 3); -- Trot Along → Generic


SELECT * FROM Types;
SELECT * FROM Colours;
SELECT * FROM Classes;
SELECT * FROM Cards;
SELECT * FROM CardClasses;
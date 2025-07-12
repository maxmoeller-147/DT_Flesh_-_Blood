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

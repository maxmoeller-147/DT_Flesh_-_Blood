
DROP TABLE IF Colours
DROP TABLE IF Types





CREATE TABLE Colours (
    Colour_id INT PRIMARY KEY,
    ColourName VARCHAR(100) NOT NULL
);


CREATE TABLE Types (
    Type_id INT PRIMARY KEY,
    TypeName VARCHAR(100) NOT NULL
);

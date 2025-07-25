DROP TABLE IF EXISTS CardClasses CASCADE;
DROP TABLE IF EXISTS Cards CASCADE;
DROP TABLE IF EXISTS CardDescription CASCADE;
DROP TABLE IF EXISTS Classes CASCADE;
DROP TABLE IF EXISTS Types CASCADE;
DROP TABLE IF EXISTS Colours CASCADE;



-- TABLES:

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



CREATE TABLE CardDescription (
    Card_id INT PRIMARY KEY,
    Cost INT,
    Abilitie TEXT,
    FOREIGN KEY (Card_id) REFERENCES Cards(Card_id) ON DELETE CASCADE
);



CREATE TABLE CardClasses (
    Card_id INT NOT NULL,
    Class_id INT NOT NULL,
    PRIMARY KEY (Card_id, Class_id),
    FOREIGN KEY (Card_id) REFERENCES Cards(Card_id) ON DELETE CASCADE,
    FOREIGN KEY (Class_id) REFERENCES Classes(Class_id) ON DELETE CASCADE
);



-- INSERTIONS:

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



INSERT INTO CardDescription (Card_id, Cost, Abilitie) VALUES
(1, 3, 'Your weapon get +3, play this only if is your second attack.'),
(2, 2, 'Pay X gold and create X allies.'),
(3, 3, 'The opponent must defend with a card.'),
(4, 6, 'If it deals more than 4 dmg opponent discards a card.'),
(5, 5, 'Create 3 Gold.'),
(6, 7, 'Deal 10 damage.'),
(7, 2, 'Defend 4 dmg as a reaction.'),
(8, 0, 'Boosts your attack for 6 dmg.'),
(9, 3, 'Your next attack gains go again.');



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



-- UPDATES, DELETE AND MORE INSERTIONS:

INSERT INTO Cards (Card_id, CardName, Type_id, Colour_id)
VALUES (10, 'Pint of Strong and Stout', 2, 3);

INSERT INTO CardDescription (Card_id, Cost, Abilitie) 
VALUES (10, 2, 'Create an Agility and Vigor Token');

INSERT INTO CardClasses (Card_id, Class_id) VALUES (10, 1);
--Insertion of a new card into the tables that relate.



UPDATE CardDescription SET Cost = 4, Abilitie = 'Create 4 Gold Tokens' WHERE Card_id = 5;
-- Update a current card



DELETE FROM Cards WHERE Card_id = 10;
-- The previously added card will be deleted 





-- QUERIES:

SELECT * FROM CardDescription;
SELECT * FROM Cards;
-- SELECT * FROM Types;
-- SELECT * FROM Colours;
-- SELECT * FROM Classes;
-- SELECT * FROM CardClasses;



SELECT * FROM Cards WHERE CardName = 'Provoke';
-- This query display a card searched by name
SELECT * FROM Cards WHERE CardName = 'Pummel';
-- To display and test the new insertions.



SELECT c.Card_id, c.CardName, t.TypeName, col.ColourName, d.Cost, d.Abilitie FROM Cards c
JOIN Types t ON c.Type_id = t.Type_id
JOIN Colours col ON c.Colour_id = col.Colour_id
JOIN CardDescription d ON c.Card_id = d.Card_id
WHERE c.Card_id = 5;
-- This query display a all the information about an specific card, in this case (Card_id = 5)



SELECT AVG(cd.Cost) AS AverrageCost FROM CardDescription cd;
-- Average Cost of all cards



SELECT AVG(cd.Cost) AS AverageCost_Red FROM CardDescription cd
JOIN Cards c ON cd.Card_id = c.Card_id
JOIN Colours col ON c.Colour_id = col.Colour_id
WHERE col.ColourName = 'Red';
-- Average Cost of Red Cards



SELECT SUM(cd.Cost) AS GuardianTotalCost FROM Cards c
JOIN CardDescription cd ON c.Card_id = cd.Card_id
JOIN CardClasses cc ON c.Card_id = cc.Card_id
JOIN Classes cl ON cc.Class_id = cl.Class_id
WHERE cl.ClassName = 'Guardian';
-- Total Cost of all Guardian Cards



SELECT SUM(cd.Cost) AS TotalCost_Blue_Warrior FROM Cards c
JOIN CardDescription cd ON c.Card_id = cd.Card_id
JOIN CardClasses cc ON c.Card_id = cc.Card_id
JOIN Classes cl ON cc.Class_id = cl.Class_id
JOIN Colours col ON c.Colour_id = col.Colour_id
WHERE cl.ClassName = 'Warrior' AND col.ColourName = 'Blue';
-- Total cost of all bluue Warrior cards



SELECT cl.ClassName, MAX(cd.Cost) AS MaxCostPerClass FROM Cards c
JOIN CardDescription cd ON c.Card_id = cd.Card_id
JOIN CardClasses cc ON c.Card_id = cc.Card_id
JOIN Classes cl ON cc.Class_id = cl.Class_id
GROUP BY cl.ClassName;
-- Order by Max Cost Per Class




SELECT c.CardName, cd.Cost FROM Cards c
JOIN CardDescription cd ON c.Card_id = cd.Card_id
ORDER BY cd.Cost ASC;
-- Order Lowest to Highest 



SELECT c.CardName, col.ColourName, cd.Cost FROM Cards c
JOIN Colours col ON c.Colour_id = col.Colour_id
JOIN CardDescription cd ON c.Card_id = cd.Card_id
ORDER BY col.ColourName ASC, cd.Cost ASC;
-- Order by Color and Cost (Low to high)
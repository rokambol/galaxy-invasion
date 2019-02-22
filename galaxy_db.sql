
-- First table
CREATE TABLE planets(
     id INT AUTO_INCREMENT PRIMARY KEY,
     name  VARCHAR(255) NOT NULL ,
     moons INT,
     dist_from_sun VARCHAR(255) NOT NULL,
     diameter VARCHAR(255) NOT NULL,
     orbit_period VARCHAR(255) NOT NULL,
     min_surface_temp VARCHAR(255) NOT NULL,
     max_surface_temp VARCHAR(255) NOT NULL
     );

-- try intro of data 
INSERT INTO planets(name, moons, dist_from_sun, diameter, orbit_period,
                    min_surface_temp, max_surface_temp)
VALUES('Mercury',0,'70 million km','4,879 km','88 days','-173°C', '473°C');

INSERT INTO planets(name, moons, dist_from_sun, diameter, orbit_period,
                    min_surface_temp, max_surface_temp)
VALUES ('Venus', 0, '108.2 millions km', '12,104 km', '225 days', '200 °C', '462 °C'),
       ('Earth', 1, '149.6 millions km', '12,756 km', '365.24 days', '-88°C', '58°C'),
       ('Mars', 2, '227.9 millions km', '6,792 km', '687 days', '-153 °C', '20 °C'),
       ('Jupiter', 79, '778.5 millions km', '142,984 km', '4,333 days', '-248 °C', '-148 °C'),
       ('Saturn', 62, '1.434 billions km', '120,536 km', '10,756 days', '-198 °C', '-178 °C'),
       ('Uranus', 27, '2,870,658,186 km', '51,118 km', '30,687 days', '-216 °C', '-199 °C'),
       ('Neptune', 14, '4,498,396,441 km', '49,528 km', '60,190 days', '-214 °C', '-180 °C'),
       ('Pluto', 5, '5,874,000,000 km', '2,372 km', '90,579 days', '-256 °C', '-200 °C');


-- create new table images https://space-facts.com/wp-content/uploads/mercury.png
CREATE TABLE images(
picture_url VARCHAR(255) NOT NULL,
picture_name VARCHAR(255) NOT NULL,
picture_id INT,
FOREIGN KEY(picture_id) REFERENCES planets(id)
);
-- bulk insert rest of the data for the table
INSERT INTO images(picture_url,picture_name,picture_id)
VALUES ('https://space-facts.com/wp-content/uploads/mercury.png', 'Mercury', 1),
       ('https://space-facts.com/wp-content/uploads/venus.png', 'Venus', 2),
       ('https://space-facts.com/wp-content/uploads/earth.png', 'Earth', 3),
       ('https://space-facts.com/wp-content/uploads/mars.jpg', 'Mars', 4),
       ('https://space-facts.com/wp-content/uploads/jupiter.png', 'Jupiter', 5),
       ('https://space-facts.com/wp-content/uploads/saturn.png', 'Saturn', 6),
       ('https://space-facts.com/wp-content/uploads/uranus.jpg', 'Uranus', 7),
       ('https://space-facts.com/wp-content/uploads/neptune.png', 'Neptune', 8),
       ('https://space-facts.com/wp-content/uploads/pluto.png', 'Pluto', 9);

-- JOINING BOTH TABLES
SELECT * FROM planets FULL JOIN images ON name = picture_name LIMIT 9;

-- CREATE NEW TABLE citizens
CREATE TABLE citizens (
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    user_id INT DEFAULT 3,
    FOREIGN KEY(user_id) REFERENCES planets(id)
    );
    
INSERT INTO citizens(first_name, last_name, email, user_id)
VALUES ('Dimitar', 'Milev', 'rokambol_88@abv.bg', 3)

INSERT INTO citizens(first_name, last_name, email, user_id)
VALUES ('Sam','Hilton', 'agdmndn@jsmn.mn', 2)

-- counting citizens of each planets

SELECT * FROM
(SELECT IFNULL(COUNT(user_id), 0) AS population FROM citizens WHERE user_id = 1
UNION ALL
SELECT IFNULL(COUNT(user_id), 0) AS population FROM citizens WHERE user_id = 2 
UNION ALL
SELECT IFNULL(COUNT(user_id), 0) AS population FROM citizens WHERE user_id = 3
UNION ALL
SELECT IFNULL(COUNT(user_id), 0) AS population FROM citizens WHERE user_id = 4
UNION ALL
SELECT IFNULL(COUNT(user_id), 0) AS population FROM citizens WHERE user_id = 5
UNION ALL
SELECT IFNULL(COUNT(user_id), 0) AS population FROM citizens WHERE user_id = 6
UNION ALL
SELECT IFNULL(COUNT(user_id), 0) AS population FROM citizens WHERE user_id = 7
UNION ALL
SELECT IFNULL(COUNT(user_id), 0) AS population FROM citizens WHERE user_id = 8
UNION ALL
SELECT IFNULL(COUNT(user_id), 0) AS population FROM citizens WHERE user_id = 9) AS NA 
JOIN
(SELECT *, COUNT(user_id) FROM planets JOIN images JOIN citizens) AS DEL
LIMIT 9



LIMIT 9

 



(SELECT id, moons, dist_from_sun, name, picture_name, picture_url, diameter, orbit_period, max_surface_temp FROM planets JOIN images)AS GREAT
 DESC

 

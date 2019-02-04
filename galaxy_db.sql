
-- First table
CREATE TABLE planets(
     id INT AUTO_INCREMENT PRIMARY KEY,
     name  VARCHAR(255) NOT NULL,
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
     
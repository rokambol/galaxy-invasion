
-- First table
CREATE TABLE planets(
     id INT AUTO_INCREMENT PRIMARY KEY,
     name  VARCHAR(255) NOT NULL ,
     moons INT,
     dist_from_sun VARCHAR(255) NOT NULL,
     diameter INT,
     orbit_period INT,
     min_surface_temp VARCHAR(255) NOT NULL,
     max_surface_temp VARCHAR(255) NOT NULL
     );


INSERT INTO planets(name, moons, dist_from_sun, diameter, orbit_period,
                    min_surface_temp, max_surface_temp)
VALUES ('Mercury',0,'70',4879,88,'-173', '473'),
       ('Venus', 0, '108.2', 12104, 225, '200', '462'),
       ('Earth', 1, '149.6', 12756, 365.24, '-88', '58'),
       ('Mars', 2, '227.9', 6792, 687, '-153', '20'),
       ('Jupiter', 79, '778.5', 142984, 4333, '-248', '-148'),
       ('Saturn', 62, '1434', 120536, 10756, '-198', '-178'),
       ('Uranus', 27, '2870', 51118, 30687, '-216', '-199'),
       ('Neptune', 14, '4498', 49528, 60190, '-214', '-180'),
       ('Pluto', 5, '5874', 2372, 90579, '-256', '-200');


-- create new table images 
CREATE TABLE images(
id INT AUTO_INCREMENT PRIMARY KEY,
picture_url VARCHAR(255) NOT NULL,
planet_schema VARCHAR(255) NOT NULL,
picture_name VARCHAR(255) NOT NULL,
picture_id INT,
FOREIGN KEY(picture_id) REFERENCES planets(id)
);
-- bulk insert rest of the data for the table
INSERT INTO images(picture_url,planet_schema,picture_name,picture_id)
VALUES ('https://space-facts.com/wp-content/uploads/mercury.png','https://theplanets.org/wp-content/uploads/2014/09/mercury-size.jpg', 'Mercury', 1),
       ('https://space-facts.com/wp-content/uploads/venus.png','https://theplanets.org/wp-content/uploads/2014/09/venus-size.jpg', 'Venus', 2),
       ('https://space-facts.com/wp-content/uploads/earth.png','https://theplanets.org/wp-content/uploads/2014/09/earth-size.jpg', 'Earth', 3),
       ('https://space-facts.com/wp-content/uploads/mars.jpg', 'https://theplanets.org/wp-content/uploads/2014/09/mars-size.jpg', 'Mars', 4),
       ('https://space-facts.com/wp-content/uploads/jupiter.png', 'https://theplanets.org/wp-content/uploads/2014/09/jupiter-size.jpg', 'Jupiter', 5),
       ('https://space-facts.com/wp-content/uploads/saturn.png', 'https://theplanets.org/wp-content/uploads/2014/09/saturn-size.jpg', 'Saturn', 6),
       ('https://space-facts.com/wp-content/uploads/uranus.jpg', 'https://theplanets.org/wp-content/uploads/2014/09/uranus-size.jpg', 'Uranus', 7),
       ('https://space-facts.com/wp-content/uploads/neptune.png', 'https://theplanets.org/wp-content/uploads/2014/09/neptune-size.jpg', 'Neptune', 8),
       ('https://space-facts.com/wp-content/uploads/pluto.png', 'https://theplanets.org/wp-content/uploads/2014/09/pluto-size.jpg', 'Pluto', 9);

-- JOINING BOTH TABLES
SELECT * FROM planets FULL JOIN images ON name = picture_name LIMIT 9;

-- CREATE NEW TABLE citizens
CREATE TABLE citizens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    planet_id INT DEFAULT 3,
    FOREIGN KEY(planet_id) REFERENCES planets(id)
    );
    
INSERT INTO citizens(first_name, last_name, email, planet_id)
VALUES ('Dimitar', 'Milev', 'rokambol_88@abv.bg', 3)

INSERT INTO citizens(first_name, last_name, email, planet_id)
VALUES ('Sam','Hilton', 'agdmndn@jsmn.mn', 2)

-- counting citizens of each planets

SELECT * FROM
(SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = 1
UNION ALL
SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = 2 
UNION ALL
SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = 3
UNION ALL
SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = 4
UNION ALL
SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = 5
UNION ALL
SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = 6
UNION ALL
SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = 7
UNION ALL
SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = 8
UNION ALL
SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = 9) AS NA 
JOIN
(SELECT *, COUNT(planet_id) FROM planets JOIN images JOIN citizens) AS DEL
LIMIT 9

-- CREATE NEW TABLE CONTAINING ADDITIONAL INFO FOR EACH PLANET

CREATE TABLE add_info(
    id INT AUTO_INCREMENT PRIMARY KEY,
    introduction VARCHAR(2500),
    planet_schema VARCHAR(2500),
    planet_fact1 VARCHAR(2500),
    planet_fact2 VARCHAR(2500),
    planet_fact3 VARCHAR(2500),
    planet_fact4 VARCHAR(2500),
    planet_fact5 VARCHAR(2500),
    planet_fact6 VARCHAR(2500),
    planet_fact_id INT,
    FOREIGN KEY(planet_fact_id) REFERENCES planets(id)
    )

--INSERT INFO INTO TABLE add_info

INSERT INTO add_info(introduction,planet_schema,planet_fact1,
                    planet_fact2,planet_fact3,planet_fact4,planet_fact5,planet_fact6,planet_fact_id)
VALUES ('Mercury is the closest planet to the Sun and due to its proximity it is not easily seen except during twilight. For every two orbits of the Sun, Mercury completes three rotations about its axis and up until 1965 it was thought that the same side of Mercury constantly faced the Sun. Thirteen times a century Mercury can be observed from the Earth passing across the face of the Sun in an event called a transit, the next will occur on the 9th May 2016.', 
'https://space-facts.com/wp-content/uploads/mercury-size.png',
'One solar day (the time from noon to noon on the planet`s  surface) on Mercury lasts the equivalent of 176 Earth days while the sidereal day (the time for 1 rotation in relation to a fixed point) lasts 59 Earth days. Mercury is nearly tidally locked to the Sun and over time this has slowed the rotation of the planet to almost match its orbit around the Sun. Mercury also has the highest orbital eccentricity of all the planets with its distance from the Sun ranging from 46 to 70 million km.',        
'Mercury is the smallest planet in the Solar System. One of five planets visible with the naked eye a, Mercury is just 4,879 Kilometres across its equator, compared with 12,742 Kilometres for the Earth.',
'Mercury is the second densest planet. Even though the planet is small, Mercury is very dense. Each cubic centimetre has a density of 5.4 grams, with only the Earth having a higher density. This is largely due to Mercury being composed mainly of heavy metals and rock.',        
'Mercury has wrinkles. As the iron core of the planet cooled and contracted, the surface of the planet became wrinkled. Scientist have named these wrinkles, Lobate Scarps. These Scarps can be up to a mile high and hundreds of miles long.',
'Mercury has a molten core. In recent years scientists from NASA have come to believe the solid iron core of Mercury could in fact be molten. Normally the core of smaller planets cools rapidly, but after extensive research, the results were not in line with those expected from a solid core. Scientists now believe the core to contain a lighter element such as sulphur, which would lower the melting temperature of the core material. It is estimated Mercury`s  core makes up 42% of its volume, while the Earth`s  core makes up 17%.',
'Mercury is only the second hottest planet. Despite being further from the Sun, Venus experiences higher temperatures. The surface of Mercury which faces the Sun sees temperatures of up to 427celsius, whilst on the alternate side this can be as low as -173celsius. This is due to the planet having no atmosphere to help regulate the temperature.',        
1),
('Venus is the second planet from the Sun and is the second brightest object in the night sky after the Moon. Named after the Roman goddess of love and beauty, Venus is the second largest terrestrial planet and is sometimes referred to as the Earth`s  sister planet due the their similar size and mass. The surface of the planet is obscured by an opaque layer of clouds made up of sulphuric acid.',
'https://space-facts.com/wp-content/uploads/venus-size.png',
'A day on Venus lasts longer than a year. It takes 243 Earth days to rotate once on its axis (sidereal day). The planet`s  orbit around the Sun takes 225 Earth days, compared to the Earth`s  365. A day on the surface of Venus (solar day) takes 117 Earth days.',
'Venus rotates in the opposite direction to most other planets. This means that Venus is rotating in the opposite direction to the Sun, this is also know as a retrograde rotation. A possible reason might be a collision in the past with an asteroid or other object that caused the planet to alter its rotational path. It also differs from most other planets in our solar system by having no natural satellites.',
'Venus is the second brightest object in the night sky. Only the Moon is brighter. With a magnitude of between -3.8 to -4.6 Venus is so bright it can be seen during daytime on a clear day.',
'Atmospheric pressure on Venus is 92 times greater than the Earth s. While its size and mass are similar to Earth, the small asteroids are crushed when entering its atmosphere, meaning no small craters lie on the surface of the planet. The pressure felt by a human on the surface would be equivalent to that experienced deep beneath the sea on Earth.',
'Venus is often called the Earth`s  sister planet. The Earth and Venus are very similar in size with only a 638 km difference in diameter, Venus having 81.5% of the Earth`s  mass. Both also have a central core, a molten mantle and a crust.',
'Venus is also known as the Morning Star and the Evening Star. Early civilisations thought Venus was two different bodies, called Phosphorus and Hesperus by the Greeks, and Lucifer and Vesper by the Romans. This is because when its orbit around the Sun overtakes Earth`s  orbit, it changes from being visible after sunset to being visible before sunrise. Mayan astronomers made detailed observations of Venus as early as 650 AD.',
2),
('Earth is the third planet from the Sun and is the largest of the terrestrial planets. The Earth is the only planet in our solar system not to be named after a Greek or Roman deity. The Earth was formed approximately 4.54 billion years ago and is the only known planet to support life.',
'https://space-facts.com/wp-content/uploads/earth-size.png',
'The Earth`s  rotation is gradually slowing. This deceleration is happening almost imperceptibly, at approximately 17 milliseconds per hundred years, although the rate at which it occurs is not perfectly uniform. This has the effect of lengthening our days, but it happens so slowly that it could be as much as 140 million years before the length of a day will have increased to 25 hours.',
'The Earth was once believed to be the centre of the universe. Due to the apparent movements of the Sun and planets in relation to their viewpoint, ancient scientists insisted that the Earth remained static, whilst other celestial bodies travelled in circular orbits around it. Eventually, the view that the Sun was at the centre of the universe was postulated by Copernicus, though this is also not the case.',
'Earth has a powerful magnetic field. This phenomenon is caused by the nickel-iron core of the planet, coupled with its rapid rotation. This field protects the Earth from the effects of solar wind.',
'There is only one natural satellite of the planet Earth.As a percentage of the size of the body it orbits, the Moon is the largest satellite of any planet in our solar system. In real terms, however, it is only the fifth largest natural satellite.',
'Earth is the only planet not named after a god. The other seven planets in our solar system are all named after Roman gods or goddesses. Although only Mercury, Venus, Mars, Jupiter and Saturn were named during ancient times, because they were visible to the naked eye, the Roman method of naming planets was retained after the discovery of Uranus and Neptune.',
'The Earth is the densest planet in the Solar System. This varies according to the part of the planet, for example, the metallic core is denser than the crust. The average density of the Earth is approximately 5.52 grams per cubic centimetre.',
3),
('Mars is the fourth planet from the Sun and is the second smallest planet in the solar system. Named after the Roman god of war, Mars is also often described as the “Red Planet” due to its reddish appearance. Mars is a terrestrial planet with a thin atmosphere composed primarily of carbon dioxide.',
'https://space-facts.com/wp-content/uploads/mars-size.png',
'Mars and Earth have approximately the same landmass. Even though Mars has only 15% of the Earth`s  volume and just over 10% of the Earth`s  mass, around two thirds of the Earth`s  surface is covered in water. Martian surface gravity is only 37% of the Earth`s  (meaning you could leap nearly three times higher on Mars).',
'Mars is home to the tallest mountain in the solar system. Olympus Mons, a shield volcano, is 21km high and 600km in diameter. Despite having formed over billions of years, evidence from volcanic lava flows is so recent many scientists believe it could still be active.',
'Only 18 missions to Mars have been successful. As of September 2014 there have been 40 missions to Mars, including orbiters, landers and rovers but not counting flybys. The most recent arrivals include the Mars Curiosity mission in 2012, the MAVEN mission, which arrived on September 22, 2014, followed by the Indian Space Research Organization`s  MOM Mangalyaan orbiter, which arrived on September 24, 2014. The next missions to arrive will be the European Space Agency`s  ExoMars mission, comprising an orbiter, lander, and a rover, followed by NASA`s  InSight robotic lander mission, slated for launch in March 2016 and a planned arrival in September, 2016.',
'Mars has the largest dust storms in the solar system. They can last for months and cover the entire planet. The seasons are extreme because its elliptical (oval-shaped) orbital path around the Sun is more elongated than most other planets in the solar system.',
'On Mars the Sun appears about half the size as it does on Earth. At the closest point to the Sun, the Martian southern hemisphere leans towards the Sun, causing a short, intensely hot summer, while the northern hemisphere endures a brief, cold winter: at its farthest point from the Sun, the Martian northern hemisphere leans towards the Sun, causing a long, mild summer, while the southern hemisphere endures a lengthy, cold winter.',
'Mars takes its name from the Roman god of war. The ancient Greeks called the planet Ares, after their god of war, the Romans then did likewise, associating the planet`s  blood-red colour with Mars, their own god of war. Interestingly, other ancient cultures also focused on colour – to China`s  astronomers it was ‘the fire star , whilst Egyptian priests called on ‘Her Desher , or ‘the red one . The red colour Mars is known for is due to the rock and dust covering its surface being rich in iron.',
4),
('The planet Jupiter is the fifth planet out from the Sun, and is two and a half times more massive than all the other planets in the solar system combined. It is made primarily of gases and is therefore known as a “gas giant”.',
'https://space-facts.com/wp-content/uploads/jupiter-size-1.png', 
'Jupiter is the fourth brightest object in the solar system. Only the Sun, Moon and Venus are brighter. It is one of five planets visible to the naked eye from Earth.',
'The ancient Babylonians were the first to record their sightings of Jupiter. This was around the 7th or 8th century BC. Jupiter is named after the king of the Roman gods. To the Greeks, it represented Zeus, the god of thunder. The Mesopotamians saw Jupiter as the god Marduk and patron of the city of Babylon. Germanic tribes saw this planet as Donar, or Thor.',
'Jupiter has the shortest day of all the planets. It turns on its axis once every 9 hours and 55 minutes. The rapid rotation flattens the planet slightly, giving it an oblate shape.',
'Jupiter orbits the Sun once every 11.8 Earth years. From our point of view on Earth, it appears to move slowly in the sky, taking months to move from one constellation to another.',
'Jupiter has unique cloud features. The upper atmosphere of Jupiter is divided into cloud belts and zones. They are made primarily of ammonia crystals, sulfur, and mixtures of the two compounds.',
'The Great Red Spot is a huge storm on Jupiter. It has raged for at least 350 years. It is so large that three Earths could fit inside it.',
5),
('Saturn is the sixth planet from the Sun and the most distant that can be seen with the naked eye. Saturn is the second largest planet and is best known for its fabulous ring system that was first observed in 1610 by the astronomer Galileo Galilei. Like Jupiter, Saturn is a gas giant and is composed of similar gasses including hydrogen, helium and methane.',
'https://space-facts.com/wp-content/uploads/saturn-size.png',
'Saturn can be seen with the naked eye. It is the fifth brightest object in the solar system and is also easily studied through binoculars or a small telescope.',
'Saturn is the flattest planet. Its polar diameter is 90% of its equatorial diameter, this is due to its low density and fast rotation. Saturn turns on its axis once every 10 hours and 34 minutes giving it the second-shortest day of any of the solar system`s  planets.',
'Saturn orbits the Sun once every 29.4 Earth years. Its slow movement against the backdrop of stars earned it the nickname of “Lubadsagush” from the ancient Assyrians. The name means “oldest of the old”.',
'Saturn`s  upper atmosphere is divided into bands of clouds. The top layers are mostly ammonia ice. Below them, the clouds are largely water ice. Below are layers of cold hydrogen and sulfur ice mixtures.',
'Saturn has oval-shaped storms similar to Jupiter s. The region around its north pole has a hexagonal-shaped pattern of clouds. Scientists think this may be a wave pattern in the upper clouds. The planet also has a vortex over its south pole that resembles a hurricane-like storm.',
'Saturn has the most extensive rings in the solar system. The Saturnian rings are made mostly of chunks of ice and small amounts of carbonaceous dust. The rings stretch out more than 120,700 km from the planet, but are are amazingly thin: only about 20 meters thick.',
6),
('Uranus is the seventh planet from the Sun. While being visible to the naked eye, it was not recognised as a planet due to its dimness and slow orbit. Uranus became the first planet discovered with the use of a telescope. Uranus is tipped over on its side with an axial tilt of 98 degrees. It is often described as “rolling around the Sun on its side.”',
'https://space-facts.com/wp-content/uploads/uranus-size.png',
'Uranus was officially discovered by Sir William Herschel in 1781. It is too dim to have been seen by the ancients. At first Herschel thought it was a comet, but several years later it was confirmed as a planet. Herscal tried to have his discovery named “Georgian Sidus” after King George III. The name Uranus was suggested by astronomer Johann Bode. The name comes from the ancient Greek deity Ouranos.',
'Uranus turns on its axis once every 17 hours, 14 minutes. The planet rotates in a retrograde direction, opposite to the way Earth and most other planets turn.',
'Uranus makes one trip around the Sun every 84 Earth years. During some parts of its orbit one or the other of its poles point directly at the Sun and get about 42 years of direct sunlight. The rest of the time they are in darkness.',
'Uranus is often referred to as an “ice giant” planet. Like the other gas giants, it has a hydrogen upper layer, which has helium mixed in. Below that is an icy “mantle, which surrounds a rock and ice core. The upper atmosphere is made of water, ammonia and the methane ice crystals that give the planet its pale blue colour.',
'Uranus hits the coldest temperatures of any planet. With minimum atmospheric temperature of -224celsius Uranus is nearly coldest planet in the solar system. While Neptune doesn t get as cold as Uranus it is on average colder. The upper atmosphere of Uranus is covered by a methane haze which hides the storms that take place in the cloud decks.',
'Uranus has two sets of very thin dark coloured rings. The ring particles are small, ranging from a dust-sized particles to small boulders. There are eleven inner rings and two outer rings. They probably formed when one or more of Uranus`s  moons were broken up in an impact. The first rings were discovered in 1977 with the two outer rings being discovered in Hubble Space Telescope images between 2003 and 2005.', 
7),
('Neptune is the eighth planet from the Sun making it the most distant in the solar system. This gas giant planet may have formed much closer to the Sun in early solar system history before migrating to its present position.', 
'https://space-facts.com/wp-content/uploads/neptune-size.png',
'Neptune was not known to the ancients. It is not visible to the naked eye and was first observed in 1846. Its position was determined using mathematical predictions. It was named after the Roman god of the sea.',
'Neptune spins on its axis very rapidly. Its equatorial clouds take 18 hours to make one rotation. This is because Neptune is not solid body.',
'Neptune is the smallest of the ice giants. Despite being smaller than Uranus, Neptune has a greater mass. Below its heavy atmosphere, Uranus is made of layers of hydrogen, helium, and methane gases. They enclose a layer of water, ammonia and methane ice. The inner core of the planet is made of rock.',
'The atmosphere of Neptune is made of hydrogen and helium, with some methane. The methane absorbs red light, which makes the planet appear a lovely blue. High, thin clouds drift in the upper atmosphere.',
'Neptune has a very active climate. Large storms whirl through its upper atmosphere, and high-speed winds track around the planet at up 600 meters per second. One of the largest storms ever seen was recorded in 1989. It was called the Great Dark Spot. It lasted about five years.',
'Neptune has 14 moons. The most interesting moon is Triton, a frozen world that is spewing nitrogen ice and dust particles out from below its surface. It was likely captured by the gravitational pull of Neptune. It is probably the coldest world in the solar system.', 
8),
('Discovered in 1930, Pluto is the second closest dwarf planet to the Sun and was at one point classified as the ninth planet. Pluto is the largest dwarf planet but only the second most massive, with Eris being the most massive.',
'https://space-facts.com/wp-content/uploads/pluto-size.png',
'Pluto is named after the Greek god of the underworld. This is a later name for the more well known Hades and was proposed by Venetia Burney an eleven year old schoolgirl from Oxford, England.',
'Pluto was reclassified from a planet to a dwarf planet in 2006. This is when the IAU formalised the definition of a planet as “A planet is a celestial body that (a) is in orbit around the Sun, (b) has sufficient mass for its self-gravity to overcome rigid body forces so that it assumes a hydrostatic equilibrium (nearly round) shape, and (c) has cleared the neighbourhood around its orbit.”',
'Pluto was discovered on February 18th, 1930 by the Lowell Observatory. For the 76 years between Pluto being discovered and the time it was reclassified as a dwarf planet it completed under a third of its orbit around the Sun.',
'Pluto has five known moons. The moons are Charon (discovered in 1978,), Hydra and Nix (both discovered in 2005), Kerberos originally P4 (discovered 2011) and Styx originally P5 (discovered 2012) official designations S/2011 (134340) 1 and  S/2012 (134340) 1.',
'Pluto is the largest dwarf planet. At one point it was thought this could be Eris. Currently the most accurate measurements give Eris an average diameter of 2,326km with a margin of error of 12km, while Pluto`s  diameter is 2,372km with a 2km margin of error.',
'Pluto is one third water. This is in the form of water ice which is more than 3 times as much water as in all the Earth`s  oceans, the remaining two thirds are rock. Pluto`s  surface is covered with ices, and has several mountain ranges, light and dark regions, and a scattering of craters.', 
9)
          
          SELECT * FROM planets INNER JOIN images ON planets.id = images.picture_id;
         
        
        
        
        
        
 

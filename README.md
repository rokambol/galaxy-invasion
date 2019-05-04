# SPACE-INVASION

Application allow user virtually occupy planet in the space and receive information about his chosen planet by e-mail
[space-invasion](https://space-invasion.herokuapp.com/)

## UX
 
User Stories
* As visitor I want to have quick overview over planet on Home page in solar system and quick facts about each planet.
* As visitor I want to see home many people already occupy each planet.
* As visitor I want to be able to have more information for each planet.
* As visitor I want to able to see graphic representation on main info compare different planets. 
* As visitor I want to to able to become citizen of my chosen planet. 
* As visitor I want to receive message/e-mail when I occupy planet.
* As visitor I want to receive message if I already occupy planet.

## Features

1. The home page welcomes the visitor, gives a brief overview of the planets in solar system and provide them with link to page with graph page and become a citizen form. 

2. Next to each planet user can see how many people already chose each planet. 

3. When click on planet name user is redirect to page where could be found more information for chosen planet and interesting fact. 

4. On top of each page on left corner have graphic page link which redirect user to graphic page where two graphic found for distance each planet to Sun and diameter graph compare diameter of all planets.

5. On top of each page on left corner have become a citizen page link where user can virtually occupy chosen planet when submit first and last name and e-mail address in appropriate field where more information for space and welcome e-mail will be receive. 

6. When form submit successful message appear on screen which welcome new user. 

7. If user already chose the planet and try to resubmit details again message appear which say to user which planet he already chose.


### Features Left to Implement
- Due database free plan limitation size more info for user is not collecting,picture of user and profile page will be nice addition.  
- More information for space objects like separate page for Sun or moons on each planet will be nice addition, currently limited by DB space limitation.
- Networking feature between user/citizens of each planet as connect/messaging to other user will be nice feature left to implement.


## Technologies Used

As this project was build for the Data Centric Development Milestone Project, Python was used to create the bulk of the code: all the logic that makes this project work was written in Python.

Other technologies used in this project are:

- [Flask](http://flask.pocoo.org/), a Python Microframework
- Python Library used
    * for routing - flask;
    * for redirecting and rendering templates -redirect, redder_template; 
    * for login form - wtf form;
    * for implement bootstrap template - flask_bootstrap;
    * for using .json files - json;
    * for database manipulation - pymysql.

- [Jinja2](http://jinja.pocoo.org/docs/2.10/), a templating language for rendering data in the html templates, communicating between front-end and back-end.

- HTML, the most basic building block of the Web for writing the basic front-end content.

- CSS, a stylesheet language for styling the page.

- [JQuery](https://jquery.com/) for allowing the Javascript functionality in Bootstrap and my custom script to work.

- [d3.js](https://d3js.org/) for graphic page allowing represent data in easy to understand for user.

- [emailjs](http://www.emailjs.com/) to allow send welcome e-mail to the user without server.

- [Bootstrap](https://getbootstrap.com/), a front-end framework for general responsiveness. For components used such as the navbar with burger icon which makes the app easy to use on mobile.

- [MYSQL](https://www.mysql.com/) related database version one -to-many. Database schema could be found in db-schema folder.



## Testing

No custom automated testing has been done on this project, but the validity of Python has been checked using Flake8, which warns for indentation issues and similar possible mistakes.

- For the user stories, the manual testing process is as follows:

- welcome page/home page will have in top left corner there is Navbar with three links ,home page, graph page and become a citizen when graph page link is clicked user is redirect to the graph page, when become a citizen link click user is redirect to citizenship form where user could submit details. 


 - When scroll down on Home page user can see picture on each planet in solar system with brief planet details and number of user already choose this planet.
    
 - When clicked on each planet name user is redirected to planet details page where user can find more information about each planet and interesting facts.


- In planet details page under planet picture there is button with become my citizen link when is click is redirect user to become a citizen form page.
   
 - In citizenship form page user can find form which have 3 fields first,last name and email plus drop down menu button if form form is try to be submit without email on page appear error message valid email must be provided, from drop down menu button user can chose planet.
 - When user fill all fields with valid email and choose planet and press submit button if user e-mail is not in the database message appear under form with text -"Congratulations!!! you became citizens of you chosen planet!" and if email is real user should receive welcome email, if user email is already in database message appear saying "You already occupy planet, You chosen planet is:" and name of the chosen planet.
 
     
- When form submit successfully and user see "Congratulations!!! you became citizens of you chosen planet!" message under form if use go back to home page or planet details page user should see citizens of chosen planet increase by 1.

- When User chose graphic page on screen should appear two different graphic. First show distance on each planet to the Sun represent in horizontal bar chart graphic second compare diameter of nine planets is circle chart. 

  

## Deployment

As this project runs on Python, it was hosted on Heroku. To be able to run the code on Heroku, a Procfile was added to tell Heroku it's a Python project (web: python app.py), as were the Config vars for IP (0.0.0.0) and PORT (5000).
The local editor for whole project [cloud9](https://c9.io)


## Security 
For Security reason and database corruptions prevention all details for database configuration are move to Config.py file which is remove from Github branches also
SQL inject prevention are in use. 

To run the code locally:

Clone the [Github](https://github.com/rokambol/Minute-a-lot-game) and run it in your own editor.
Install the depencies from the requirements file using the command pip install -r requirements.txt.

Have fun!








## Credits
I would like to thank my fellow students for their encouragement, tips and bug reporting along the way. 

Many thanks to my mentor Guido Cecilio Garcia Bernal  for his help and tips.

### Content
-The description of the original television competiton was copied from [Wikipedia](https://en.wikipedia.org/wiki/Minuta_e_mnogo): 
The photo of background used in this site was obtained from [giphy.com](https://giphy.com/explore/pictures).
Picture of the planet are from [space-facts.com](https://space-facts.com).
comparison schema under planet picture from planet details page are take from [NASA.gov](https://www.nasa.gov)




### Acknowledgements

 I received inspiration for this project from original television series [The Expanse](https://www.imdb.com/title/tt3230854/)

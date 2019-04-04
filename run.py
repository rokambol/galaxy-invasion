import os
import pymysql
from flask import Flask, json, redirect, render_template, request, url_for, session, escape, jsonify
from flask_bootstrap import Bootstrap

app = Flask(__name__)
app.config['SECRET_KEY']='THISISendLess986'
Bootstrap(app)

#mysql://bf73b036159af6:c7cec93a@eu-cdbr-west-02.cleardb.net/heroku_9505a2cdbf20733?reconnect=true
#create username
#username = os.getenv('C9_USER')

#connect to database
connection = pymysql.connect(host='eu-cdbr-west-02.cleardb.net',
							 user='bf73b036159af6',    
							 password='c7cec93a',
							 db='heroku_9505a2cdbf20733')
 
#variables for query extract data from SQL tables
union_table = """ SELECT * FROM planets JOIN images ON name = picture_name LIMIT 9"""

#query show data from citizens table as population row
count1 =""" SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = 1
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
			SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = 9; """


#route for home page
@app.route('/', methods=['GET', 'POST'])
def home():
	cur = connection.cursor(pymysql.cursors.DictCursor)
	cur.execute(union_table)
	res = cur.fetchall()
	
	
	cur = connection.cursor(pymysql.cursors.DictCursor)
	cur.execute(count1)
	pop = cur.fetchall()
	result = zip(res, pop)#zip (join) two query together
	return render_template('home.html', page_title='Welcome', result = result, pop=pop)

#route for citizenship page for occupy planet	
@app.route('/citizenship', methods=['GET', 'POST'])
def citizenship():
	if request.method == "POST":
		first_name = request.form.get("first_name")
		last_name = request.form.get("last_name")
		email = request.form.get("email")
		planet = request.form.get("planet")
			
		sql_insert_str = 'INSERT INTO citizens (first_name, last_name, email, planet_id) VALUES ("{}", "{}", "{}", "{}");'.format(first_name, last_name, email, planet)
		cur = connection.cursor()
		cur.execute(sql_insert_str)
		connection.commit()
	else:
		first_name = ''
		last_name = ''
		email = ''
		planet = '1'

	union_table = """ SELECT * FROM planets JOIN images ON name = picture_name LIMIT 9;"""
			
	cur = connection.cursor(pymysql.cursors.DictCursor)
	cur.execute(union_table)
	result = cur.fetchall()

	return render_template('citizenship.html', page_title='Citizens_form',result=result
							,data=(first_name, last_name, email, planet))
	
#route for project page 
@app.route('/project', methods=['GET', 'POST'])
def project():
	cur = connection.cursor(pymysql.cursors.DictCursor)
	cur.execute('SELECT name, dist_from_sun, diameter, moons FROM planets;')
	beta = cur.fetchall()
	data = json.dumps(beta)

	return render_template('project.html', page_title='Project', delta=data)
	

#route for planet details page
@app.route('/planet-details/<planet_id>', methods=['GET'])
def planet_details(planet_id):
	cur = connection.cursor(pymysql.cursors.DictCursor)
	cur.execute('SELECT * FROM planets INNER JOIN images JOIN add_info ON planets.id = images.picture_id WHERE  planets.id = {} AND planets.id = add_info.id'.format(planet_id))
	planet = cur.fetchone()
	cur.execute('SELECT IFNULL(COUNT(planet_id), 0) AS population FROM citizens WHERE planet_id = {}'.format(planet_id))
	count = cur.fetchall()
	
	return render_template('planet_details.html', page_title='planet details', planet=planet, count=count)
	
	
	
app.run(host=os.environ.get('IP'), port=os.environ.get('PORT'), debug=True)
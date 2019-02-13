import os
import pymysql
from flask import Flask,  redirect, render_template, request, url_for, session, escape, flash
from flask_bootstrap import Bootstrap
from flask_wtf import FlaskForm


app = Flask(__name__)
app.config['SECRET_KEY']='THISISendLess986'
Bootstrap(app)

#create username
username = os.getenv('C9_USER')

#connect to database
connection = pymysql.connect(host='localhost',
							 user=username,
							 password='',
							 db='galaxy')

#try:
    #Run a query
    #with connection.cursor(pymysql.cursors.DictCursor) as cursor:
    	#sql = "SELECT * FROM planets"
    	#cursor.execute(sql)
    	#result =cursor.fetchall()
    	#print(result)
#finally:
	#close connectionSELECT * FROM planets JOIN images JOIN citizensFULL JOIN citizens ON name = picture_name LIMIT 9
#	connection.close()AND 
#
union_table = """ SELECT * FROM planets JOIN images ON name = picture_name LIMIT 9;"""








	
@app.route('/', methods=['GET', 'POST'])
def index():
	cur = connection.cursor(pymysql.cursors.DictCursor)
	cur.execute(union_table)
	result = cur.fetchall()
	cur.close()
	
	cur = connection.cursor(pymysql.cursors.DictCursor)
	cur.execute('SELECT * FROM citizens AS populatons')
	pop = cur.fetchall()
	return render_template('base.html', page_title='Welcome', result = result, pop=pop)





@app.route('/about')
def about():
	return render_template('about.html', page_title='About')
	
	
	
@app.route('/citizenship', methods=['GET', 'POST'])
def citizenship():
	first_name = request.form.get("first_name")
	last_name = request.form.get("last_name")
	email = request.form.get("email")
	planet = inrequest.form.get("planet")
		
	sql_insert_str = 'INSERT INTO citizens(first_name, last_name, email, user_id) VALUES(%s, %s, %s, %s);"""
		
	cur = connection.cursor(pymysql.cursors.DictCursor)
	cur.execute(sql_insert_str, (first_name, last_name, email, planet))
	cur.fetchall()
	print(request.form)
	print(first_name, last_name, email, planet)
	
		
	union_table = """ SELECT * FROM planets JOIN images ON name = picture_name LIMIT 9;"""
		
	cur = connection.cursor(pymysql.cursors.DictCursor)
	cur.execute(union_table)
	result = cur.fetchall()
	
	
		
	return render_template('citizenship.html', page_title='Citizens_form',result=result
							,data=(first_name, last_name, email, planet))
	

app.run(host=os.environ.get('IP'), port=os.environ.get('PORT'), debug=True)
import os
import pymysql

#create username
username = os.getenv('C9_USER')

#connect to database
connection = pymysql.connect(host='localhost',
							 user=username,
							 password='',
							 db='galaxy')

try:
    #Run a query
    with connection.cursor() as cursor:
    	sql = "SELECT * FROM planets"
    	cursor.execute(sql)
    	result =cursor.fetchall()
    	print(result)
finally:
	#close connection
	connection.close()




#if __name__ == "__main__":
	#app.run()
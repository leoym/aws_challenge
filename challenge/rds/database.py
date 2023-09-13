import mysql
import mysql.connector
print ("Start")

mydb = mysql.connector.connect(
  host="vv-1.xxx.us-west-2.rds.amazonaws.com",
  user="vv",
  password="vv"
)

print ("Start")

mycursor = mydb.cursor()

mycursor.execute("CREATE DATABASE lm_database")

print("Done")
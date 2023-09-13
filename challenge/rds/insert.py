import mysql.connector
import sys, os, re, subprocess
print ("Start")

mydb = mysql.connector.connect(
  host="database-1.xxxxx.us-west-2.rds.amazonaws.com",
  user="admin",
  password="xx",
  database="xx"
)

mycursor = mydb.cursor()

sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
val = ("John", "Highway 21")
mycursor.execute(sql, val)

mydb.commit()

print(mycursor.rowcount, "record inserted.")
print("Done")
import mysql.connector
print ("Start")

mydb = mysql.connector.connect(
  host="x-1.x.us-west-2.rds.amazonaws.com",
  user="admin",
  password="xx",
  database="x"
)

mycursor = mydb.cursor()

mycursor.execute("CREATE TABLE customers (name VARCHAR(255), address VARCHAR(255))")

print("Done")
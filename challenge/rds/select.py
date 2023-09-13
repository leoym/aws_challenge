import mysql.connector
print ("Start")

mydb = mysql.connector.connect(
  host="database-1.xx.us-west-2.rds.amazonaws.com",
  user="admin",
  password="xx",
  database="xx"
)

mycursor = mydb.cursor()

mycursor.execute("SELECT * FROM customers")

myresult = mycursor.fetchall()

for x in myresult:
  print(x)

print("Done")
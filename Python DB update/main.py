import pymysql
import csv

file = open("hospital.csv", "r", encoding='utf8')
conn = pymysql.connect(host='mysql-teamproject.ckwr51x4irqq.us-east-2.rds.amazonaws.com', user='user', password='asd0123!', db='jsp_teamproject', charset='utf8')
curs = conn.cursor()

sql = "insert into hospital2 " \
      "( idx, unit, grp, name, addr ) " \
      "VALUES " \
      "( %s, %s, %s, %s, %s ) ";

rd = csv.reader(file)

for index,line in enumerate(rd):

      if index == 0:
         continue
      try:
         row = str(line).split(',')
         str1 = row[0].replace("['", "")
         str2 = row[4].replace("]", "")
         curs.execute(sql, ( str1.replace("'",""), row[1].replace("'",""), row[2].replace("'",""), row[3].replace("'",""), str2.replace("'","") ))
         print(row[0])
         conn.commit()
      except Exception as e:
         print(e)
         continue
file.close()

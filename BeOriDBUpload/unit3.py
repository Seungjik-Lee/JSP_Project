import csv
import pymysql

def read_csv_write_unit3():
    file = open("info/건강보험심사평가원_전문병원 지정 현황(3기).csv", "r", encoding='utf8')
    conn = pymysql.connect(host='192.168.0.81', user='test', password='1234', db='jsp_teamproject', charset='utf8')
    curs = conn.cursor()

    sql = "insert into hospital2 " \
          "( unit, grp, name, addr ) " \
          "VALUES " \
          "( %s, %s, %s, %s ) ";

    rd = csv.reader(file)

    for index, line in enumerate(rd):
        if index == 0:
            continue
        row = str(line).split(',')
        try:
            curs.execute(sql, (row[0].replace("['","").replace("'",""),
                               row[1].replace(" '","").replace("'",""),
                               row[2].replace(" '","").replace("'",""),
                               row[3].replace("']","").replace(" '","")))
            print(row[0])
            conn.commit()
        except Exception as e:
            print(e)
            continue
    file.close()
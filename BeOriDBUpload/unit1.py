import csv
import pymysql

#csv, pymysql library 사용

def read_csv_write_unit1(): #함수정의
    file = open("info/건강보험심사평가원_전문병원 지정 현황(1기).csv", "r", encoding='utf8') #파일 경로 지정 후 읽음
    conn = pymysql.connect(host='192.168.0.81', user='test', password='1234', db='jsp_teamproject', charset='utf8')
    #pymysql.connect()메소드 사용하여 mysql 경로지정 후 해당 파라미터들 설정
    curs = conn.cursor()
    #cursor()메소드 호출로 cursor객체를 가져옴

    sql = "insert into hospital2 " \
          "( unit, grp, name, addr ) " \
          "VALUES " \
          "( %s, %s, %s, %s ) ";
    #DB입력이 되는 sql문 실행

    rd = csv.reader(file)
    #csv파일 읽는 데이터 저장하는 rd

    for index,line in enumerate(rd):
        if index == 0:
            continue
        row = str(line).split(',')
        try:#try-catch문을 이용한 에러처리
            curs.execute(sql, (row[0].replace("['","").replace("'",""),
                               row[1].replace(" '","").replace("'",""),
                               row[2].replace(" '","").replace("'",""),
                               row[3].replace("']","").replace(" '","")) )
            #curs.execute 메서드로 sql문 실행
            #원본 data에 문자열이 섞어 있었기 때문에 replace()를 이용하여 공백처리
            print(row[0])
            #DB가 제대로 업로드 된다면 첫번째 열의 데이터가 출력되도록 함
            conn.commit()
        except Exception as e:
            print(e)#에러가 발생하면 출력되도록 함
            continue
    file.close()
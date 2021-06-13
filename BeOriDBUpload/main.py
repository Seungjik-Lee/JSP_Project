from unit1 import read_csv_write_unit1
from unit2 import read_csv_write_unit2
from unit3 import read_csv_write_unit3
from unit4 import read_csv_write_unit4

#원본 파일이 1기에서 4기까지 나뉘어져 있기 때문에, DB업로드도 나뉘어서 실행

if __name__ == '__main__':  # int main()과 같음

    read_csv_write_unit1()#1기의 파일 업로드
    read_csv_write_unit2()#2기의 파일 업로드
    read_csv_write_unit3()#3기의 파일 업로드
    read_csv_write_unit4()#4기의 파일 업로드
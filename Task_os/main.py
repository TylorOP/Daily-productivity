import os
import csv
import datetime


def filter_csv(all_files):
    csv_file,other_file = [],[]
    for filename in all_files:
        if filename.endswith('.csv'):
            csv_file.append(filename)
        else:
            other_file.append(filename)
    return csv_file,other_file

def city_wise_write_content(full_record,city_files):
    date=datetime.datetime.now().date()
    for city in set(city_files):
        flag=1
        for record in full_record:
            if city==record["city"]:
                with open(rf'/Users/thispc/Desktop/cities/{city}/{city}_{date}.csv',"a") as fp:
                    DictRObj=csv.DictWriter(fp,fieldnames=record.keys())
                    if flag==1:
                        DictRObj.writeheader()
                        flag=0
                    DictRObj.writerow(record)






def read_content(csv_files):
    city_list = []
    full_list = []
    for filename in csv_files:
        with open(r'./input_files/Daily_files/' + filename, 'r') as fp:
            dict_obj = csv.DictReader(fp)
            for row in dict_obj:
                city_list.append(row['city'])
                full_list.append(row)
    return city_list,full_list


def create_city_dir(city_list):
    city_path = r'/Users/thispc/Desktop/cities'
    city_list = set(city_list)
    for city in city_list:
        os.mkdir(city_path + '/' + city)



def file_path():
    pass

def processed_csv_file_dump(csv_file):
    path=r'./input_files'
    os.chdir(path)
    os.mkdir("processed_files")
    destinationfile=r'/Users/thispc/PycharmProjects/Task_os/input_files/processed_files'
    for file in csv_file:
        sourcefile=r'/Users/thispc/PycharmProjects/Task_os/input_files/Daily_files/' + file
        os.system(rf"mv '{sourcefile}' '{destinationfile}'")



def other_file_dump(other_file):
    os.mkdir('./input_files/other_files')
    destination_file = './input_files/other_files'
    for filename in other_file:
        source_file = rf'./input_files/Daily_files/{filename}'
        os.system('mv "{}" "{}"'.format(source_file,destination_file) )


def main():
    file_path = '/input_files/Daily_files'
    all_files = os.listdir(os.getcwd()+file_path)
    csv_files,other_files = filter_csv(all_files)
    other_file_dump(other_files)
    city_list,full_record = read_content(csv_files)
    create_city_dir(city_list)
    city_wise_write_content(full_record, city_list)
    processed_csv_file_dump(csv_files)
main()


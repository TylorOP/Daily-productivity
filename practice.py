import kagglehub

path = kagglehub.dataset_download("ravindrasinghrana/employeedataset")

print("Path to dataset files:", path)

import pandas as pd
emp_data = pd.read_csv('/Users/thispc/PycharmProjects/module_copper_boxite/2/employee_data.csv')
emp_data
recruitment_data = pd.read_csv('/Users/thispc/PycharmProjects/module_copper_boxite/2/recruitment_data.csv')
recruitment_data
final_data = emp_data.merge(recruitment_data,left_on='EmpID',right_on='Applicant ID',how='left')[['EmpID', 'First Name', 'Last Name', 'Date of Birth', 'Phone Number', 'Email', 'Address', 'City']].sort_values('EmpID',ascending=True)

final_data.to_csv('Employee data.csv',index=False)

fp = open('/Users/thispc/Desktop/untitled folder/Employee data.csv','r')
data = fp.read(173)
data = data.split('\n')[-1].split(',')
#print(type(data))
id = data[0]
phone_number = data[4]
email = data[5]
city = data[-1]
print('id: ',id)
print('phone_number: ',phone_number)
print('email: ',email)
print('city: ',city)




fp = open('test.txt', 'r')
data  = fp.read()  # each line in a list
data = data.split(' ')
for i in data:
    i.replace('\n', '')
    subdata = i.split( )
    for j in subdata:
        if j.endswith('@example.net'):
            print(j)



fp = open('test.txt', 'r')
data = fp.readlines()

for line in data:
    words = line.split()
    for email in words:
        email = email.replace('\n','')
        if email.endswith('@example.net'):
            print(email)


fp = open('test.txt', 'r')
data = fp.readlines()

for line in data:
    words = line.split()
    for email in words:
        email = email.replace('\n','')
        if email.endswith('@example.net'):
            print(email)




fp = open('test.txt','r')
data = fp.read()
data = data[len('sdga  dsg shubham shivpure'):].strip()
print(data)

fp = open('destination.txt','w')
fp.write(data)
#as requirement is remove first line and add it in other file #next we will append it
# this is just removed first line and write in new file we will see append



data = ('''shubha\n
rahul\n
ram\n
''')

fp = open('any.txt','w')
fp.writelines(data)



data = ('''shubha\n
rahul\n
ram\n
''')

fp = open('any.txt','w')
fp.writelines(data)
print(fp.readable()) #False #due to it is in w mode




import fcntl

with open('any.txt', 'r') as fp:
    fcntl.flock(fp.fileno(), fcntl.LOCK_EX)
    data = fp.read()
    linedata = data.splitlines()
    print(data.split('\n'))
    print(linedata)
    word_count = len(data.split())
    count = len(fp.readlines())
print(word_count)
space_count = sum(1 for space in data if space.isspace()) #new thing learned
print("space count : ", space_count)
char_count = len(data) - space_count
print("char count without space : ", char_count)


#readline is an generator
with open('any.txt', 'r') as fp:
    fcntl.flock(fp.fileno(), fcntl.LOCK_EX)
    data = fp.readline()
    data2 = fp.readline()
    print(data)
    print(data2)
    for i in fp.readlines():
        print(i)


import fcntl

with open('any.txt', 'r') as fp:
    fcntl.flock(fp.fileno(), fcntl.LOCK_EX)
    line = fp.readline()
    while line:
        print(line.strip())
        line = fp.readline()

# to fetch valid phone number
import re
import fcntl
data = []
with open('any.txt','r') as fp:
    fcntl.flock(fp.fileno(), fcntl.LOCK_EX)
    for line in fp:
        for word in line.split():
            #print(word)
            phone_number = re.compile(r'^(?:\+91\s?|0?91\s?)?[7-9]\d{9}$')
            obj = re.findall(phone_number,word)
            obj2 = re.finditer(phone_number,word)
            if obj:
                data.append(obj)
            for i in obj2:
                print(i.group(),end =' ')


print(data)
#+++++++++++
import re
import fcntl

data = []
with open('any.txt', 'r') as fp:
    fcntl.flock(fp.fileno(), fcntl.LOCK_EX)
    for line in fp:
        for word in line.split():
            # print(word)
            phone_number = re.compile(r'^(?:\+91\s?|0?91\s?)?[7-9]\d{9}$')
            obj = re.findall(phone_number, word)
            obj2 = re.finditer(phone_number, word)
            if obj:
                data.append(obj)
            for i in obj2:
                print(i.group(), end=' ')
print(data)

with open('cleaned_any.txt', 'w+') as fp:
    clean_data = str(list((num for i in data for num in i)))
    fp.write(clean_data)



import fcntl

def copy(file):
    with open(file, 'rb') as fp:
        fcntl.flock(fp, fcntl.LOCK_EX)  # Lock the file
        data = fp.read()  # Read the data
        fcntl.flock(fp, fcntl.LOCK_UN)  #release
        return data

def paste(data):
    with open('des.txt','wb') as fp:
        fcntl.flock(fp, fcntl.LOCK_EX)
        fp.write(data)
        fcntl.flock(fp, fcntl.LOCK_UN)

def main():
    filename = 'any.txt'
    data = copy(filename)
    print('data copied successfully')
    paste(data)
    print('data pasted successfully')

if __name__ == '__main__':
    main()


data = '\nnew writ with append mode e + ok data '
with open('any.txt', 'a+') as fp:
    pointer = fp.tell()
    fp.write(data)
    fp.seek(pointer)
    new_data = fp.read()
    print('new data :', new_data)
    fp.seek(0)
    print('old data:', fp.read(pointer))


from pypdf import PdfReader

reader = PdfReader(r'Assessment-Shell.pdf')
#print(len(reader.pages))
page = reader.pages[0]
print(page.extract_text())

import pdfplumber

pdf_path = "Assessment-Shell.pdf"

with pdfplumber.open(pdf_path) as pdf:
    for page in pdf.pages:
        text = page.extract_text()
        print(text)


#not mine
input_file, output_file = 'cleaned_any.txt', 'output.txt'

with open(input_file, 'r')as infile, open(output_file, 'w')as outfile:
    for line in infile:
        ascii_words = []
        for word in line.strip().split():
            ascii_word = ''.join(str(ord(char)) for char in word)
            ascii_words.append(ascii_word)

        outfile.write(' '.join(ascii_words)+'\n')

#list is slow
import csv
with open('cleaned_any_2.csv','r') as fp:
    r = csv.reader(fp)
    for i in r:
        if i[0] in ["'101'"]:
            i[1] = 'shubham'

#use dict reader to treat with dict value

import csv
with open('cleaned_any_2.csv','r') as fp:
    r = csv.DictReader(fp)
    for i in r:
        if int(i['salary']) > 10441:
            print(i)



import csv
with open('test.csv','w') as pf:
    w = csv.writer(pf)
    # w.writerow(['Name','Age','Salary'])
    # w.writerow(['shubham','98','547643'])
    w.writerows([['name','age','sal'],['shubham',32,58985],['ram',23,843633]])



# this is the way of treating data in dictreader as it easy to do but when dumping in data we need the data in list of list (writerows)
import csv
Copper_data, Silver_data, Gold_data = [], [], []
with open('test.csv', 'r') as fp:
    reader = csv.DictReader(fp)
    for row in reader:
        if row['prdname'] == 'Gold':
            Gold_data.append(row)
        elif row['prdname'] == 'Copper':
            Copper_data.append(row)
        elif row['prdname'] == 'Silver':
            Silver_data.append(row)
print(Copper_data)
with open('Copper.csv', 'w') as fp:
    writer = csv.writer(fp)

    writer.writerows(Copper_data)
    # sample data whic is wrong dumped
    # id, prdname, price, quantity
    # id, prdname, price, quantity
    # id, prdname, price, quantity

#so this is the correct way i got it
import csv
Copper_data, Silver_data, Gold_data = [],[],[]
with open('test.csv','r') as fp:
    reader = csv.DictReader(fp)
    for row in reader:
        if row['prdname'] == 'Copper':
            Copper_data.append([row['id'],row['prdname'],row['price'],row['quantity']])
        elif row['prdname'] == 'Gold':
            Gold_data.append([row['id'],row['prdname'],row['price'],row['quantity']])
        elif row['prdname'] == 'Silver':
            Silver_data.append([row['id'],row['prdname'],row['price'],row['quantity']])

with open('Copper.csv','w') as fp,open('Gold.csv','w') as fp2,open('Silver.csv','w') as fp3:
    writer_fp,writer_fp2,writer_fp3 = csv.writer(fp),csv.writer(fp2),csv.writer(fp3)
    writer_fp.writerows(Copper_data), writer_fp2.writerows(Gold_data), writer_fp3.writerows(Silver_data)



data = {

    'id': 101,
    'salary': 20000,
    'bonus': True
}

import json
with open('jdata.json', 'w') as fp:
    json.dump(data, fp)
#
# print(jdata)
# print(type(jdata))

with open('jdata.json', 'r') as fp:
    data = json.load(fp)
    print(data)



p = ['test@gmail.com','sample@gmail.com','python@rediffmail.com','shubham@yahoo.com','omkar@yahoo.in']


print({ domain:[email.split('@')[0] for email in p if email.split('@')[-1].split('.')[0].endswith(domain)] for domain in {email.split('@')[-1].split('.')[0] for email in p}})



#
# {
#     'gmail' : ['test','sample']
#     'redifmail' : ['python']
#     'yahoo' : ['ml']
#
# }

def requiredment(p):
    email = {}
    for mail in p:
        user, domain = mail.split('@')
        domain = domain.split('.')[0]
        if domain in email:
            email[domain].append(user)
        else:
            email[domain] = [user]
    return email

result = requiredment(p)

print(result)



email_dict = {domain.split('.')[0]: [email.split('@')[0] for email in p if email.split('@')[1].startswith(domain)] for domain in {email.split('@')[1].split('.')[0] for email in p}}

print(email_dict)
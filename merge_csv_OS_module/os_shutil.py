import os
import shutil


path = r'/Users/thispc/Desktop/untitled folder/osmodule'
csv_file,xlsx_file,py_file,other_file = [],[],[],[]
parent_path = os.path.dirname(path)
os.chdir(path)
def file_collect():
    folder_count = 0
    for file in os.listdir(path):
        if os.path.isfile(file):
            if file.endswith(".csv"):
                csv_file.append(file)
            elif file.endswith(".xlsx")or file.endswith(".xlsm"):
                xlsx_file.append(file)
            elif file.endswith(".py"):
                py_file.append(file)
            else:
                other_file.append(file)
        elif os.path.isdir(file):
            folder_count+=1
    return folder_count     #just check how many folder if present
file_collect()

os.chdir(parent_path)
os.mkdir('csv_files')
os.chdir(os.path.join(parent_path,'csv_files'))

print(parent_path+'/csv_files')
def csv_file_process():
    for file in csv_file:
        shutil.copy(os.path.join(path,file),parent_path+'/csv_files')  #issue was the folder
csv_file_process()                                                     # was having space so in path used just r


os.chdir(parent_path)
os.mkdir('xlsx_files')
os.chdir(os.path.join(parent_path,'xlsx_files'))


def xlsx_file_process():
    for file in xlsx_file:
        shutil.copy(os.path.join(path,file),parent_path+'/xlsx_files')
xlsx_file_process()


os.chdir(parent_path)
os.mkdir('py_files')
os.chdir(os.path.join(parent_path,'py_files'))

def py_file_process():
    for file in py_file:
        shutil.copy(os.path.join(path,file),parent_path+'/py_files')
py_file_process()

os.chdir(parent_path)
os.mkdir('other_files')
os.chdir(os.path.join(parent_path,'other_files'))

def other_file_process():
    for file in other_file:
        shutil.copy(os.path.join(path,file),parent_path+'/other_files')
other_file_process()

os.chdir(path)

for file in os.listdir(path):
    if os.path.isfile(file):
        os.remove(file)
    else:
        os.rmdir(file)


shutil.rmtree(path) #delete folder evven files contain
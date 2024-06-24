import os


def list_csv_file():
    path=csv_path()
    lst_file=[]
    for file in path:
        if file.endswith(".csv"):
            lst_file.append(file)
    return lst_file

def delete_csv_file(lst_file):
    for i in lst_file:
        print("delteing file {}".format(i))
        os.remove(i)


def csv_path():
    path = os.listdir(os.getcwd())
    return path

def main():
    print("entering into list")
    lst_file=list_csv_file()    #this is diff variable
    delete_csv_file(lst_file)
    print("file deleted successfully")


if __name__ == '__main__':
    main()

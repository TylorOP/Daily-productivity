import os

def customer_csv():
    list_prodct = []
    other_file=[]
    path = current_path()

    for file in os.listdir(path):
        if file.endswith('.csv'):
            list_prodct.append(file)
        else:
            other_file.append(file)
    return list_prodct


def current_path():
    path = path = os.path.dirname(os.path.abspath(__file__))
    return path

#you can write os.path.dirname(__file__)

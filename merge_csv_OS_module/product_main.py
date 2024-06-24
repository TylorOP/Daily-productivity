import os
def product_csv():
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
    path = os.path.dirname(os.path.abspath(__file__))# path = os.getcwd()
    return path

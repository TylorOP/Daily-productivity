import os

copper_csv_file = []
other_file_in_copper = []
def copper_file():
    path = os.path.dirname(os.path.abspath(__file__))
    for file in os.listdir(path):
        if file.endswith('.csv'):
            copper_csv_file.append(file)
        else:
            other_file_in_copper.append(file)

    return copper_csv_file, other_file_in_copper,path


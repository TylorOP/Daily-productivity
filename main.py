from copper.copper_merge_file import copper_file
import os
import shutil
copper_csv,copper_other,copper_path = copper_file()

des_path = '/Users/thispc/Desktop/untitled folder/osmodule/untitled folder'

os.chdir(copper_path)

for file in copper_csv:
    shutil.copy(file, des_path)
    if os.path.exists(file):
        os.remove(file)
    else:
       print('file not present')
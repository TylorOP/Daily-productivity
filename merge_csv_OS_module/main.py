from product.product_main import product_csv
from customer.customer_main import customer_csv

# print("product csv",product_csv())
# print("customer csv",customer_csv())
pd_csv=product_csv()

cus_csv=customer_csv()

# pd_csv.extend(cus_csv)
# print(pd_csv)
demo_csv = ['test.csv','sample.csv','bot.csv','happy.csv','2.csv']

all_csv =[]

for element in [pd_csv,cus_csv,demo_csv]:
    for i in element:
        all_csv.append(i)

print(all_csv)
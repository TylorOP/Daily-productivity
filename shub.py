# email = 'test@gmail.com'
#
# if email.endswith('@gmail.com'):
#     print('{} is valid'.format(email))
# else:
#     print('invalid')

# ++++++++++++++++++++++++++++++
#
# filename = input("Enter filename: ")
#
# if filename.endswith('.pdf'):
#     print('pdf file')
# elif filename.endswith('.png'):
#     print('png file')
# elif filename.endswith('.csv'):
#     print('csv file')
# else:
#     print('no such file')

# +++++++++++++++++++++++++++++++++++

 # here the inside else is important if file is tst.csv then it will do nothing (else is not written then)
# filename = input("Enter a file name: ")
#
# if filename.endswith(".csv"):
#     if filename.startswith("copper"):
#         print("process copper csv")
#     elif filename.startswith("boxite"):
#         print("process boxite csv")
#     elif filename.startswith("gold"):
#         print("process gold csv")
#     else:
#         print("csv file unknown ")
# elif filename.endswith(".xlsx"):
#     if filename.startswith("copper"):
#         print("process copper xlsx")
#     elif filename.startswith("boxite"):
#         print("process boxite xlsx")
#     elif filename.startswith("gold"):
#         print("process gold xlsx")
#     else:
#         print("xlsx file unknown ")
# else:
#     print("invalid file extension")
#

# +++++++++++++++++++++++

# +++++++++++++++++++++++++++++++++++
#
# list1 = [2,3,'sdg',5644,35,564,3,'python','hadoop',3.53,]
#
# floating = []
# stringing = []
#
# for i in list1:
#


# email = ['shubham@gmail.com','shubham@yaoo.com','shubham@rediff.com','shubham@raisoni.in']
#
#
# emails = []
# yahoo = []
# redif = []
# raisoni =[]
# for i in email:
#     if i.endswith('@gmail.com'):
#         emails.append(i)
#     elif i.endswith('@yaoo.com'):
#         yahoo.append(i)
#     elif i.endswith('@rediff.com'):
#         redif.append(i)
#     else:
#         raisoni.append(i)
#
# print(emails,yahoo,redif,raisoni)


# +++++++++++++++++++++++++++++++++++
# this is a wrong way actually some mismatch like '123' is a string and it will add in integer
#
# list1 = [2,3,'sdg',5644,35,564,3,'python','123','hadoop',3.53,]
#
# integer = []
# floating = []
# stringing = []
#
# for i in list1:
#     if str(i).isdigit():
#         integer.append(i)
#         #print(integer)
#     elif str(i).isalpha():
#         stringing.append(i)
#     else:
#         floating.append(i)
#
# print('integer: ',integer)
# print('floating: ',floating)
# print('stringing: ',stringing)
#

# +++++++++++++++++++++++++++++++++++++++
#
# list1 = [2, -5, 3.14159, '123', '3.53', 'abc123', 'hello', '3.53e10', 0, -3.5, ' ', '123abc', ' ',
#          'π', 0.0, True, 3.56, {23: 42}, (32, 24),{235},' ',' ',' ']
#
#
# floating = []
# stringing = []
# integer = []
# others = []
# space = []
#
# for i in list1:
#
#     if isinstance(i, float):
#         floating.append(i)
#     elif isinstance(i, str):
#         if i.isspace():
#             space.append(i)
#         else:
#             stringing.append(i)
#     elif isinstance(i, int):
#         integer.append(i)
#     else:
#         others.append(i)
#
# print('floating: ',floating)
# print('stringing: ',stringing)
# print('integer: ',integer)
# print('others: ',others)
# print('space: ',space)

# +++++++++++++++++++++++++++++++++++++++++++++++++
#
# input = 'pythonb  helllo'
#
# for i in range(len(input)-1,-1,-1):
#     print(input[i], end='')
#
# print('')
# for i in range(-1,-len(input)-1,-1):
#     print(input[i], end='')


# +++++++++++++++++++++++++++++++++++++
#
# num = int(input("Enter a number: "))
# fact = 1
# for i in range(1,num+1):
#     fact = fact*i
#     print(fact)
# print("factorial of {} is {}".format(num,fact))
#
# +++++++++++++++++++++++++++++++++++++++++++++++

#
# lst = [32,53,53,123,35]
# for i in lst:
#     print(i,end=' ')
#
# i = 0
# while i <= len(lst)-1:
#     print(lst[i])
#     i +=1


# ++++++++++++++++++++++++++++++=
#
# lst = [325,4563,3545,658,456,769,45,3682,57,8,45,3,7,9,4]
#
# temp ={}
# for key in lst:
#     if key in temp:
#         temp[key]+= 1
#     else:
#         temp[key] = 1
# print(temp)


# +++++++++++++++++++++++++++++++++++++++

# lst = [325,4563,3545,658,456,769,45,3682,57,8,45,3,7,9,4]
# print(len(lst))
#
# for i in range(len(lst)-1):
#     for j in range(len(lst)-i-1):
#         if lst[j] < lst[j+1]:
#             lst[j],lst[j+1] = lst[j+1],lst[j]
#
# print(lst)
#
# lst1 = [2,4,2,434,6]
#
#
# +++++++++++++++++++++++++++++++++

# temp = 'python'
# result = ''
# for i in range(len(temp)-1,-1,-1):
#     result += temp[i]
#
# if result == 'python':
#     print("palindrom")
# else:
#     print("not palindrom")
#
# print(result)





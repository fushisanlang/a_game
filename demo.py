from operate_data import select_operaction

result = select_operaction('*',"test")
a=result[0][0]
print(list(a))
print(type(a))
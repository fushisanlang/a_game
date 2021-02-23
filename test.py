from operate_data import select_operaction

a = select_operaction("conf_value", "conf", "conf_key='index'")[
    0][0].decode('UTF-8')
print(a)

index_str = select_operaction("conf_value", "conf", "conf_key='index'")[
    0][0].decode('UTF-8')

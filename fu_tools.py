import time

#获取当前时间并提取五行值，用于新建人物
def get_wuxing():
    t = time.time()//1
    t_list = list(str(t))
    wuxing_dict={'j':-1,'m':0,'s':0,'h':0,'t':0}
    for T in t_list:
        
        if T == '0' or T == '1':
            wuxing_dict['m']=wuxing_dict['m']+1
        elif T == '2' or T == '3':
            wuxing_dict['h']=wuxing_dict['h']+1
        elif T == '4' or T == '5':
            wuxing_dict['t']=wuxing_dict['t']+1
        elif T == '6' or T == '7':
            wuxing_dict['j']=wuxing_dict['j']+1
        elif T == '8' or T == '9':
            wuxing_dict['s']=wuxing_dict['s']+1

    
    return wuxing_dict

#def trans_to_list_from_str(strings_like_list):
    list1 = list(strings_like_list)
    i = 0
    del_list = []
    print(list1)
    for a in list1:
        if a == ',' or a == '[' or a == ']' or a == ' ':
            del_list.append(i)
        i = i + 1

    del_list.reverse()

    for j in del_list:
        del list1[j]
    return list1

def trans_to_list_from_str(db_list):
    buffer_list = db_list[0][0].decode('UTF-8')
    list1 = list(buffer_list)
    i = 0
    del_list = []
    for a in list1:
        if a == ',' or a == '[' or a == ']' or a == ' ':
            del_list.append(i)
        i = i + 1

    del_list.reverse()

    for j in del_list:
        del list1[j]    
    print(list1)
    return list1
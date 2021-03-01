def trans_to_list_from_str(strings_like_list):
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
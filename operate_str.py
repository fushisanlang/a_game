def decode_tuple_list_list(byte_list):
    new_list = []
    new_tuple = []
    for byte_str in byte_list:
        new_tuple = [byte_str[0],byte_str[1].decode('UTF-8')]
        new_list.append(new_tuple)
    return new_list
        
def decode_tuple_list_dict(byte_list):
    new_dict = {}
    for byte_str in byte_list:
        new_dict[byte_str[0]] = byte_str[1].decode('UTF-8')
    return new_dict
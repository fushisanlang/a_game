#!/usr/bin/python3
# -*- coding: utf-8 -*-
# @Time    : 2020/5/17 下午10:21
# @Author  : fushisanlang
# @File    : models.py
# @Software: PyCharm
from flask_login import UserMixin
import time
import hashlib
from operate_data import select_operaction, insert_operaction

class User(UserMixin):
    pass

users = [
    {'id':'fu', 'username': 'fu13', 'password': '1'},
    {'id':'qiecho', 'username': 'qiecho', 'password': '2'}
]

def query_role_exist(role_name):
    user_select = "name = \"" + role_name + "\""
    user_str = select_operaction("count(1)", "role", user_select)
    if user_str[0][0] != 0 :
        return False
    else:
        return True

def register_user(G_username,G_userpass):
    I_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    I_pass_sha1 = hashlib.sha1(G_userpass.encode("utf-8")).hexdigest()
    I_keys = "user,pass,createtime"
    I_values = "\"" + G_username + "\",\"" + I_pass_sha1 + "\",\"" + I_time + "\""
    insert_operaction("user", I_keys, I_values)
    return 


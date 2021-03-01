from operate_data import select_operaction
#
#a = select_operaction("conf_value", "conf", "conf_key='index'")[
#    0][0].decode('UTF-8')
#print(a)
#
#index_str = select_operaction("conf_value", "conf", "conf_key='index'")[
#    0][0].decode('UTF-8')
#conding:utf-8
#from sqlalchemy import Column, String, create_engine
#from sqlalchemy.orm import sessionmaker
#from sqlalchemy.ext.declarative import declarative_base
##创建连接
#engine=create_engine("mysql+mysqlconnector://a_game:a_game@172.19.32.26/a_game",encoding='utf-8',echo=True)
##生成orm基类
#base=declarative_base()
#class User(Base):
#    # 表的名字:
#    __tablename__ = 'user111'
#
#    # 表的结构:
#    id = Column(String(20), primary_key=True)
#    name = Column(String(20))
#DBSession = sessionmaker(bind=engine)

#from operate_data import select_operaction
#
#schools=select_operaction("id,name","school")
#from operate_str import decode_tuple_list_dict
#print(decode_tuple_list_dict(schools))

import time
localtime = time.localtime(time.time())
y = localtime.tm_year
m = localtime.tm_mon
d = localtime.tm_mday
h = localtime.tm_hour

wuxing_list=[]

tiangan_y=['甲','乙','丙','丁','戊','己','庚','辛','壬','癸']
if (y-3)%10-1 < 0 :
    a = (y-3)%10-1+10
else:
    a=(y-3)%10-1
wuxing_list.append(tiangan_y[a])
print(wuxing_list)

dizhi_y=['子','丑','寅','卯','辰','巳','午','未','申','酉','戌','亥']
if (y-3)%12-1 < 0 :
    b = (y-3)%12-1+12
else:
    b=(y-3)%12-1
wuxing_list.append(dizhi_y[b])
print(wuxing_list)

if a in [0,5]:
    yue=[]
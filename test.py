#from operate_data import select_operaction
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

#import time
#localtime = time.localtime(time.time())
#y = localtime.tm_year
#m = localtime.tm_mon-2 #农历
#d = localtime.tm_mday
#h = localtime.tm_hour
#
#wuxing_list=[]
#
#tiangan_y=['甲','乙','丙','丁','戊','己','庚','辛','壬','癸']
#if (y-3)%10-1 < 0 :
#    a = (y-3)%10-1+10
#else:
#    a=(y-3)%10-1
#wuxing_list.append(tiangan_y[a])
#print(wuxing_list)
#
#dizhi_y=['子','丑','寅','卯','辰','巳','午','未','申','酉','戌','亥']
#if (y-3)%12-1 < 0 :
#    b = (y-3)%12-1+12
#else:
#    b=(y-3)%12-1
#wuxing_list.append(dizhi_y[b])
#print(wuxing_list)
#
#if a in [0,5]:
#    yue_1=['丙','丁','戊','己','庚','辛','壬','癸','甲','乙','丙','丁']
#    yue_2=['寅','卯','辰','巳','午','未','申','酉','戌','亥','子','丑']
#elif a in [1,6]:
#    yue_1=['戊','己','庚','辛','壬','癸','甲','乙','丙','丁','戊','己']
#    yue_2=['寅','卯','辰','巳','午','未','申','酉','戌','亥','子','丑']
#elif a in [2,7]:
#    yue_1=['庚','辛','壬','癸','甲','乙','丙','丁','戊','己','庚','辛']
#    yue_2=['寅','卯','辰','巳','午','未','申','酉','戌','亥','子','丑']
#elif a in [3,8]:
#    yue_1=['壬','癸','甲','乙','丙','丁','戊','己','庚','辛','壬','癸']
#    yue_2=['寅','卯','辰','巳','午','未','申','酉','戌','亥','子','丑']
#else:
#    yue_1=['甲','乙','丙','丁','戊','己','庚','辛','壬','癸','甲','乙']
#    yue_2=['寅','卯','辰','巳','午','未','申','酉','戌','亥','子','丑']
#if m-1 <0:
#    c=m-1+12
#else:
#    c=m-1
#print(yue_1[c])
#print(yue_2[c])
#
#
#C=y//100  #年份头两位
#Y=y%100 #年份后两位
#M=m
#D=d
#G=4C+[C/4]+5Y+[Y/4]+[3*(M+1)/5]+D-3
#Z=4C+G+10+i


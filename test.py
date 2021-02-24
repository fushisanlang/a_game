#from operate_data import select_operaction
#
#a = select_operaction("conf_value", "conf", "conf_key='index'")[
#    0][0].decode('UTF-8')
#print(a)
#
#index_str = select_operaction("conf_value", "conf", "conf_key='index'")[
#    0][0].decode('UTF-8')
#conding:utf-8
from sqlalchemy import Column, String, create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
#创建连接
engine=create_engine("mysql+mysqlconnector://a_game:a_game@172.19.32.26/a_game",encoding='utf-8',echo=True)
#生成orm基类
base=declarative_base()
class User(Base):
    # 表的名字:
    __tablename__ = 'user111'

    # 表的结构:
    id = Column(String(20), primary_key=True)
    name = Column(String(20))
DBSession = sessionmaker(bind=engine)
# note

### python 操作redis
(菜鸟笔记)[https://www.runoob.com/w3cnote/python-redis-intro.html]
```python
import redis

r = redis.Redis(host='192.168.92.129', port=6379, db=1,password='1', decode_responses=True)
r.set('foo', 'bar')
print(type(r.get('foo')))



import json
import redis


class RedisTT(object):
    def __init__(self):
        self.host = '192.168.92.130'
        self.port = '6379'
        self.password = '1'
        self.db = '1'
        self.r = redis.StrictRedis(host=self.host, port=self.port, password=self.password, db=self.db , decode_responses=True)

    def insertRedis(self, keyName, jsonStr):  # 存入到redis中
        self.r.lpush(keyName, jsonStr)
        print(jsonStr)


def save1():
    someexpert = {}
    someexpert['id'] = 10000
    someexpert['realname'] = 'expert-a'
    someexpert['organization'] = 'BUAA'
    if RedisTT().r.exists('someexpert'):
        RedisTT().r.delete('someexpert')  # 删除key为someexpert的键值对
    RedisTT().insertRedis(keyName='someexpert', jsonStr=json.dumps(someexpert))




if __name__ == "__main__":
    save1()


    print(list(RedisTT().r.lrange('someexpert', 0, RedisTT().r.llen('someexpert'))[0]))

```
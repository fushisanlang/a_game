# note

### python 操作redis
(菜鸟笔记)[https://www.runoob.com/w3cnote/python-redis-intro.html]
```python
import redis

r = redis.Redis(host='192.168.92.129', port=6379, db=1,password='1', decode_responses=True)
r.set('foo', 'bar')
print(type(r.get('foo')))
```
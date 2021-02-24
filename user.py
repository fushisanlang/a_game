class Creatures(object):
    def __init__(name, level, experience, school, money, self):
        self.name = name
        self.level = level
        self.experience = experience
        self.school = school
        self.money = money
        self.bag = []


basg=['a','b']
print(type(basg))
zhangyin=Creatures('zhangyin','99','99','shaolin','1',basg)
print(zhangyin.name)
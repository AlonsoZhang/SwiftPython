# Author:Alex Li

stringVar = 'Hello, world'

def mymul(num1, num2):
    return num1 * num2

class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    
    def intro(self):
        return 'Name: ' + self.name + ', Age: ' + str(self.age)

def callback(msg):
    return 'callback: ' + msg

def caller(info, func):
    return func(info)

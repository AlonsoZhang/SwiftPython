import PythonAPI
import PerfectPython
import Cocoa

Py_Initialize()

let pymod = try PyObj(path: "/Users/alonso/Desktop/SwiftPython/Sources/SwiftPython", import: "guess")
if let str = pymod.load("stringVar")?.value as? String {
    print(str)
    // 会打印变量的字符串值 "Hello, world!"
}

try pymod.save("stringVar", newValue: "Hola, 🇨🇳🇨🇦！")
if let str = pymod.load("stringVar")?.value as? String {
    print(str)
}

if let res = try pymod.call("mymul", args: [2,3])?.value as? Int {
    print(res)
}

if let personClass = pymod.load("Person"),
    let person = personClass.construct(["rocky", 24]) {
    // person is now the object instance
    if let name = person.load("name")?.value as? String,
        let age = person.load("age")?.value as? Int,
        let intro = try person.call("intro", args: [])?.value as? String {
        print(name, age, intro)
    }
}

if let fun = pymod.load("callback"),
    let result = try pymod.call("caller", args: ["Hello", fun]),
    let v = result.value as? String {
    print(v)
    // 结果是 "callback: Hello"
}

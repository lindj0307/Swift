//
//  main.swift
//  TheProgramingOfSwift
//  Demo of the programing of swift
//  Created by 林东杰 on 15/7/22.
//  Copyright (c) 2015年 Anta. All rights reserved.
//

import Foundation

//tuples 元组
let http404Error = (404,"Not Found")
let http200Status = (code: 200,description: "OK")
let (statusCode,statusMessage) = http404Error
let (justTheStatusCode,_) = http404Error
println("The Status code is \(statusCode)")
println("The Status message is \(statusMessage)")
println("The Status code is \(justTheStatusCode)")
println(http404Error.0)
println(http404Error.1)
println(http200Status)
print("\n")

//Optionals 可选 用来处理可能缺失的情况
let possibleNumber = "123"
//这返回的是(Optional)Int,而不是一个Int
let convertedNumber = possibleNumber.toInt()
//这返回的是Int,而不是一个(Optional)Int   forced unwrapping  当加入!的Option为nil时程序会出错.
let convertedNumberSure = possibleNumber.toInt()!
println(convertedNumber)
println(convertedNumberSure)
print("\n")
var serverResponseCode: Int? = 404
//可以给一个Optional赋值为nil
serverResponseCode = nil
//默认为nil
var surveyAnswer: String?
println(serverResponseCode)
println(surveyAnswer)

//断言 assertion
let age = 5
assert(age>=0, "A person's age cannot be less than zero.")
print("\n")

//基本运算
println(9%4)
println(8%2.5)
print("\n")

//闭区间
for index in 1...5 {
    println("\(index) * 5 = \(index * 5)")
}
print("\n")

//半闭区间
let names = ["Anna","Alex","Brian","Joey","Jack","John Snow"]
let count = names.count
//使用半闭去见有错误 for i in 0..count {
for i in 0...count-1 {
    println("第\(i+1)个人叫\(names[i])")
}
print("\n")

//逻辑运算  逻辑非:!a   逻辑与  a&&b   逻辑或 a||b

//字符串和字符
//..1.转义特殊字符 \0(空字符)、\\(反斜杠)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号).
//..2.单字节Unicode标量,写成 \xnn,其中nn为两位十六进制数.
//..3.双字节Unicode标量,写成 \xnnnn,其中nnnn为四位位十六进制数.
//..4.四字节Unicode标量,写成 \xnnnnnnnn,其中nnnnnnnn为八位十六进制数.
var emptyString = ""
if emptyString.isEmpty {
    println("Nothing to see here!")
}
//使用字符(Characters)
for character in "You know nothing John Snow!" {
    println(character)
}
print("\n")

//集合类型
//..数组:数组使用有序列表存储相同类型的多个数据,相同的值可以出现在一个数组的不同位置.
//..语法:遵循Array<SomeType>这样的形式,其中sometype是这个数组中唯一允许存在的数据类型. 当然也可以使用 SomeType[]这样的简单语法.
//....构造
//之前是这样写 var shoppingList: String[] = ["Egg","Milk"] 现在这样写会报错
var shoppingList: [String] = ["Egg","Milk"]
//var shoppingList = ["Egg","Milk"]
println(shoppingList)
//在数组后面添加新的数据项
shoppingList.append("Flour")
shoppingList[0] = "Six eggs"
//shoppingList += "Baking Powder"  这语法好像变了
shoppingList += ["Wilding John Snow","Fruit"]
//在第一项添加 Wilding Joey
shoppingList.insert("Wilding Joey", atIndex: 0)
println(shoppingList[0])
println(shoppingList[3...5])
println(shoppingList)
shoppingList.removeAtIndex(0)
let removedItem = shoppingList.removeAtIndex(0)
println(removedItem)
println(shoppingList)
print("\n")
//....遍历数组
for item in shoppingList {
    println(item)
}
print("\n")
//使用全局enumerate函数来比那里数组
for (index,value) in enumerate(shoppingList) {
    println("Item \(index+1): \(value)")
}
//创建并且构造一个数组
var someInt = [Int]()  //定义可变的空数组,这是目前的语法
someInt.append(1)
println(someInt)
//创建一个特定大小的数组
var threeDoubles = [Double](count: 3,repeatedValue: 0.0)
println(threeDoubles)
var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
println(anotherThreeDoubles)
print("\n")

//..字典:字典是一种存储相同类型多重数据的存储器.
//..语法:使用Dictionary<KeyType,ValueType>定义,其中KeyType是字典中键的数据类型,ValueType是字典中对应于这些键所存储值的数据类型.
//....构造
var airports: Dictionary<String,String> = ["TYO": "Tokyo","DUB": "Dublin"]
//var airports = ["TYO": "Tokyo","DUB": "Dublin"]
//添加一个键值
airports["LHR"] = "London"
//修改一个键值
airports["LHR"] = "London Heathrow"
if let oldValue = airports.updateValue("Dublin Internation", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).\n")
}
airports["JON"] = "Know nothing John Snow"
airports["APL"] = "Apple Internation"
print(airports)
print("\n")
airports["APL"] = nil
print(airports)
print("\n")
if let removedValue = airports.removeValueForKey("TYO") {
    print("The removed airport's name is \(removedValue).\n")
} else {
    print("The airports dictionary does not contain a value for TYO.\n")
}
print(airports)
print("\n")
//....遍历字典
for (airportCode,airportName) in airports {
    print("\(airportCode):\(airportName)\n")
}
for airportCode in airports.keys {
    print("airportCode:\(airportCode)\n")
}
for airportName in airports.values {
    print("airportName:\(airportName)\n")
}
let airportCodes = Array(airports.keys)
let airportNames = Array(airports.values)
print(airportCodes)
print("\n")
print(airportNames)
print("\n")
//....创建一个空字典
var nameOfInterges = Dictionary<Int,String>()
nameOfInterges[16] = "sixteen"
print(nameOfInterges)
print("\n")

//控制流 for for-in while do-while while-do switch if else -break -continue -fallthrough -return
let someCharacter: Character = "e"
switch someCharacter {
    case "a","e","i","o","u":
    print("\(someCharacter) is a vowel!\n")
    case "b","c","d","f","g","h":
    print("\(someCharacter) is a consonant!\n")
    default: break
}
//..范围匹配
let anotherCount = 3000000000000
let countedThings = "stars in the Milky Way"
var naturalCount: String
switch anotherCount {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "hundreds of"
case 1000...99999:
    naturalCount = "thousands of"
default:
    naturalCount = "no"
}
print("There are \(naturalCount) \(countedThings). \n")
//..fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2,3,5,7,11,13,17,19:
    description += " a prime number, and alse"
    fallthrough
default:
    description += " an integer."
}
print(description+"\n")

//函数
//..定义和调用函数
func sayHello(personName: String) -> String {
    return "Hello, " + personName + "!\n"
}
print(sayHello("Joey"))
print(sayHello("John Snow"))
//..多返回值函数
func count(str: String) -> (vowels: Int, consonants: Int, others: Int) {
    var vowels = 0,consonants = 0, others = 0
    for character in str {
        switch String(character).lowercaseString {
            case "a","e","i","o","u":
            ++vowels
            case "b","c","d","f","g","h","j","k","l","m","n","q","r","s","t","v","w","x","y","z":
            ++consonants
            default:
            ++others
        }
    }
    return (vowels,consonants,others)
}

let total = count("You know nothing John Snow!")
print("\(total.vowels) vowels and \(total.consonants) consonants and \(total.others) others!\n")
//..函数的参数名    
//....内部参数名称,与外部参数名称,在别人第一次阅读你代码不知道你函数参数目的的时候,就要考虑使用外部参数名了
func join(s1: String, s2: String, joiner: String) -> String {
    return s1 + joiner + s2 + "\n"
}
print(join("hello","Joey",","))

//带外部参数并且提供默认值
func anotherJoin(string s1: String, toString s2: String, withJoiner joiner: String = " ") -> String {
     return s1 + joiner + s2 + "\n"
}
print(anotherJoin(string: "Hello", toString: "John", withJoiner: ","))
print(anotherJoin(string: "Hello", toString: "John"))

func containCharacter(#string: String, #characterToFind: Character) -> Bool {
    for character in string {
        if character == characterToFind {
            return true
        }
    }
    return false
}
let containV = containCharacter(string: "sfsdfdsf", characterToFind: "v")
print(containV)
print("\n")

//可变参数














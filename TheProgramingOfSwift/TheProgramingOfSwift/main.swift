//
//  main.swift
//  TheProgramingOfSwift
//
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
//....构造语句
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




















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
print("The Status code is \(statusCode)")
print("The Status message is \(statusMessage)")
print("The Status code is \(justTheStatusCode)")
print(http404Error.0)
print(http404Error.1)
print(http200Status)
print("\n") 

//Optionals 可选 用来处理可能缺失的情况
let possibleNumber = "123"
//这返回的是(Optional)Int,而不是一个Int
//let convertedNumber = possibleNumber.toInt()
//这返回的是Int,而不是一个(Optional)Int   forced unwrapping  当加入!的Option为nil时程序会出错.
//let convertedNumberSure = possibleNumber.toInt()!
//print(convertedNumber)
//print(convertedNumberSure)
print("\n")
var serverResponseCode: Int? = 404
//可以给一个Optional赋值为nil
serverResponseCode = nil
//默认为nil
var surveyAnswer: String?
print(serverResponseCode)
print(surveyAnswer)

//断言 assertion
let age = 5
assert(age>=0, "A person's age cannot be less than zero.")
print("\n")

//基本运算
print(9%4)
print(8%2.5)
print("\n")

//闭区间
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}
print("\n")

//半闭区间
let names = ["Anna","Alex","Brian","Joey","Jack","John Snow"]
let count = names.count
//使用半闭区间有错误 for i in 0..count {
for i in 0...count-1 {
    print("第\(i+1)个人叫\(names[i])")
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
    print("Nothing to see here!")
}
//使用字符(Characters)
//for character in "You know nothing John Snow!" {
//    println(character)
//}
print("\n")

//集合类型
//..数组:数组使用有序列表存储相同类型的多个数据,相同的值可以出现在一个数组的不同位置.
//..语法:遵循Array<SomeType>这样的形式,其中sometype是这个数组中唯一允许存在的数据类型. 当然也可以使用 SomeType[]这样的简单语法.
//....构造
//之前是这样写 var shoppingList: String[] = ["Egg","Milk"] 现在这样写会报错
var shoppingList: [String] = ["Egg","Milk"]
//var shoppingList = ["Egg","Milk"]
print(shoppingList)
//在数组后面添加新的数据项
shoppingList.append("Flour")
shoppingList[0] = "Six eggs"
//shoppingList += "Baking Powder"  这语法好像变了
shoppingList += ["Wilding John Snow","Fruit"]
//在第一项添加 Wilding Joey
shoppingList.insert("Wilding Joey", atIndex: 0)
print(shoppingList[0])
print(shoppingList[3...5])
print(shoppingList)
shoppingList.removeAtIndex(0)
let removedItem = shoppingList.removeAtIndex(0)
print(removedItem)
print(shoppingList)
print("\n")
//....遍历数组
for item in shoppingList {
    print(item)
}
print("\n")
//使用全局enumerate函数来比那里数组
//for (index,value) in enumerate(shoppingList) {
//    print("Item \(index+1): \(value)")
//}
//创建并且构造一个数组
var someInt = [Int]()  //定义可变的空数组,这是目前的语法
someInt.append(1)
print(someInt)
//创建一个特定大小的数组
var threeDoubles = [Double](count: 3,repeatedValue: 0.0)
print(threeDoubles)
var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
print(anotherThreeDoubles)
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
//    for character in str {
//        switch String(character).lowercaseString {
//            case "a","e","i","o","u":
//            ++vowels
//            case "b","c","d","f","g","h","j","k","l","m","n","q","r","s","t","v","w","x","y","z":
//            ++consonants
//            default:
//            ++others
//        }
//    }
    return (vowels,consonants,others)
}

let total = count("You know nothing John Snow!")
print("\(total.vowels) vowels and \(total.consonants) consonants and \(total.others) others!\n")
//..函数的参数名    
//....内部参数名称,与外部参数名称,在别人第一次阅读你代码不知道你函数参数目的的时候,就要考虑使用外部参数名了
func join(s1: String, s2: String, joiner: String) -> String {
    return s1 + joiner + s2 + "\n"
}
print(join("Hello",s2: "Joey",joiner: ","))

//..带外部参数并且提供默认值
func anotherJoin(string s1: String, toString s2: String, withJoiner joiner: String = " ") -> String {
     return s1 + joiner + s2 + "\n"
}
print(anotherJoin(string: "Hello", toString: "John", withJoiner: ","))
print(anotherJoin(string: "Hello", toString: "John"))

func containCharacter(string: String, characterToFind: Character) -> Bool {
//    for character in string {
//        if character == characterToFind {
//            return true
//        }
//    }
    return false
}
let containV = containCharacter("sfsdfdsf", characterToFind: "v")
print(containV)
print("\n")

//..可变参数: 一个可变参数接受零个或多个指定类型的值.(...)
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean(1,2,3,4,5,6,7).description)
print("\n")

//..In-Out参数  inout 类似C#ref,out关键字
func swapTwoInts (inout a: Int, inout b: Int) {
    let temp = a
    a = b
    b = temp
}

var firstInt = 3
var secondInt = 17
swapTwoInts(&firstInt, b: &secondInt)
print("firstInt is now \(firstInt), and SecondInt is now \(secondInt)\n")
print("\n")

//..函数类型 (Int,Int) -> Int
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2,3))\n")
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2,3))\n")

//..作为参数的函数类型
func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int){
    print("Result: \(mathFunction(a,b))\n")
}
printMathResult(addTwoInts, a: 3, b: 5)

//..函数返回函数类型  嵌套函数 可读性差 实际应用中应该比较少用  跳过

//闭包 不是很能理解,这东西用来干什么的
//..闭包是功能性自包含模板,可以在代码中被传递和使用.

//捕获 Capture 同闭包  无法理解

//枚举
//.. 枚举定义了一个通用类型的一组相关的值,你可以在代码中以一个安全的方式来使用它们
enum CompassPoint {
    case North
    case South
    case East
    case West
}
var directionToHead = CompassPoint.West

directionToHead = .East
switch directionToHead {
case .North:
    print("Lots of planets have a north \n")
case .South:
    print("Watch out for penguins \n")
case .East:
    print("Where the sun rises \n")
case .West:
    print("Where the skies are blue \n")
}

//类和结构体
//..共同点
//....1.定义属性用于存储值
//....2.定义方法用于提供功能
//....3.定义下标用于通过下标语法访问值
//....4.定义初始化器用于生成初始化值
//....5.通过扩展以增加默认实现的功能
//....6.符合协议以对某类提供标准功能
//..与结构相比,类还有如下附加功能:
//....1.继承允许一个类继承另外一个类的特征
//....2.类型转换允许在运行时检查和解析一个类的实例对象
//....3.取消初始化器允许一个类实例释放任何其所被分配的资源
//....4.引用计数允许以一个类多次引用
//..语法
class SomeClass {
    
}
struct SomeStructure {
    
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
let someResolution = Resolution()
let someVideoMode = VideoMode()

print(someResolution.width)
print("\n")
print(someVideoMode.resolution.width)

//属性
//..计算属性
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        //便捷setter 如果没有声明newCenter 就会用默认名称newValue     还有一个oldValue
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x),\(square.origin.y))\n")
//..属性监视器
//....willSet在设置新的值之前调用
//....didSet在新的值被设置后立即调用
class StepCounter {
    var totalSteps: Int = 0 {
        willSet (newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps) \n")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps \n")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
stepCounter.totalSteps = 0

//..类型属性  无法理解,书上可能翻译的有错,需要看下官方的文档 跳过
struct AnotherStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 0
    }
}
enum AnotherEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 0
    }
}
struct TheOtherClass {
    static var computedTypeProperty: Int {
        return 0
    }
}
print(TheOtherClass.computedTypeProperty)
print("\n")

//方法        方法还没全看明白
//..方法是某些特定类型相关联的函数.类,结构体,枚举都可以定义实例方法
//....实例方法(Instance Methods):实例方法是属于某个特定类,结构体或者美剧类型的实例方法.
class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
        print(count)
        print("\n")
    }
}
let counter = Counter()
counter.incrementBy(5, numberOfTimes: 3)
print(counter.count)

struct SomePoint {
    var x = 0.0,y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = SomePoint(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
print("The point is now at (\(somePoint.x),\(somePoint.y))\n")

//附属脚本 ??不知道干什么用的 跳过

//继承
//..一个类可以继承(ihherit)另一个类的方法(methods),属性(property)和其它特性. 继承类叫子类(subclass),被继承类叫超类/父类(superclass)
class Vehicle {
    var numberOfWheels: Int
    var maxPassengers: Int
    func description() -> String {
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passenters "
    }
    
    //构造函数
    init() {
        numberOfWheels = 0
        maxPassengers = 1
    }
}
//..子类生成(subclassing)
class Bicycle: Vehicle {
     override init () {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description())")
print("\n")

class Tandem: Bicycle {
    override init() {
        super.init()
        maxPassengers = 2
    }
}
let dandem = Tandem()
print("Tandem: \(dandem.description())")
print("\n")

//..重写方法
class Car: Vehicle {
    var speed: Double = 0.0
    override init() {
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    
    override func description() -> String {
        return super.description() + "; traveling at \(speed) "
    }
}
let car = Car()
print("Car: \(car.description())")
print("\n")

//..重写属性
class SpeedLimitedCar: Car {
    override var speed: Double {
        get {
            return super.speed
        }
        set {
            super.speed = min(newValue,40.0)
        }
    }
}

let speedLimitedCar = SpeedLimitedCar()
speedLimitedCar.speed = 60.0
print("SpeedLimitedCar: \(speedLimitedCar.description())")
print("\n")

//..重写属性观察器(Property Observer)
class AutomaticCar: Car {
    var gear = 1
    override var speed: Double {
        didSet {
            gear = Int(speed / 10.0) + 1
        }
    }
    
    override func description() -> String {
        return super.description() + "in gear \(gear)"
    }
}
let automaticCar = AutomaticCar()
automaticCar.speed = 45.0
print("AutomaticCar: \(automaticCar.description())")
print("\n")

//..防止重写 @final

//构造过程
struct Celsius {
    var temperatureInCelsius: Double = 0.0
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(boilingPointOfWater.temperatureInCelsius)
print("\n")
print(freezingPointOfWater.temperatureInCelsius)
print("\n")
print("\n")
//..默认构造器
//....Swift将为所有 属性已提供默认值并且自身没有任何构造函数的结构体或基类提供一个默认构造器.默认构造器简单的创建一个所有属性值都设置为默认值的实例.

//内外部参数名,可选属性类型   跳过

//指定构造器 便利构造器  ??????   构造器链     跳过

//反初始化(deinit())
struct Bank {
    static var coinsInBank = 10000
    static func vendCoins(var numberOfCoinsToVend: Int) -> Int {
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}
class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
}
var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins \n")
print("There are now \(Bank.coinsInBank) coins left in the bank \n")
playerOne!.winCoins(2000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins \n")
print("There are now \(Bank.coinsInBank) coins left in the bank \n")
playerOne = nil
print("PlayerOne has left the game \n")
print("There are now \(Bank.coinsInBank) coins left in the bank \n")
print("\n")

//自动引用计数器 自判断链接 跳过

//类型转换  is as
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
var movieCount = 0
var songCount = 0
for item in library {
    if item is Movie {
        ++movieCount
    } else if item is Song {
        ++songCount
    }
}
print("Media library contains \(movieCount) movies and \(songCount) songs \n")
//..向下转型 as
for item in library {
    if let movie = item as? Movie {
        print("Movie: '\(movie.name)', dir.\(movie.director)\n")
    } else if let song = item as? Song {
        print("Song: '\(song.name)', by.\(song.artist)\n")
    }
}
print("\n")

//Any和AnyObject的
//..Swift为不确定类型提供了两种特殊类型别名:
//..AnyObject可以代表任何class类型的实例
//..Any可以表示除了方法类型(function types)之外的任何类型
let someObjects: [AnyObject] = [
    Movie(name:"2001:A Space odyssey",director: "Stanley Kubrick"),
    Movie(name:"Moon",director: "Duncan Jones"),
    Movie(name:"Alien",director: "Ridley Scott")
]
for object in someObjects {
    let movie = object as! Movie
    print("Movie:'\(movie.name)',dir.\(movie.director)\n")
}

//类型嵌套  扩展 跳过

//协议(接口) protocol  委托 看斯坦福iOS8学习笔记
//..定义
protocol SomeProtocol {
    var musBeSettable: Int { get set }
    var doesNotNeedToBeSettalbe: Int { get }
}
//..用类实现协议时,使用class关键字来表示该属性为类的成员;用结构或枚举实现协议时,则使用static关键字   --这个语法现在好像变了
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

//泛型
//..泛型函数
func swapTwoValues<T>(inout a: T,inout b:T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var tempA = 3
var tempB = 107
swapTwoValues(&tempA,b: &tempB)
var tempStrA = "hello"
var tempStrB = "world"
swapTwoValues(&tempStrA,b: &tempStrB)
print("now tempA:\(tempA),tempB:\(tempB),tempStrA:\(tempStrA),tempStrB:\(tempStrB) \n")

struct Stack<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
let fromTheTop = stackOfStrings.pop()
print(fromTheTop)
print("\n")

//..类型约束语法
func someFunction<T: SomeClass,U: SomeProtocol>(someT: T, someU: U) {
    
}
//关联类型  跳过

//高级运算符 位运算符,移位运算
//..按位取反运算符(~)
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits
print(invertedBits)
print("\n")
//..按位与运算符(&)
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits
print(middleFourBits)
print("\n")

//..按位或运算符(|)
let someBits: UInt8 = 0b11111100
let moreBits: UInt8 = 0b00111111
let combineBits = someBits | moreBits
print(combineBits)
print("\n")

//..按位异或运算符(^)
let firstBits: UInt8 = 0b11111100
let otherBits: UInt8 = 0b00111111
let outputBits = firstBits ^ otherBits
print(outputBits)
print("\n")

//..按位左移/右移运算符(<</>>)
let shiftBits: UInt8 = 4    //00000100
shiftBits << 1              //00001000
shiftBits << 2              //00010000
shiftBits << 5              //10000000
shiftBits << 6              //00000000
shiftBits >> 2              //00000001

//..溢出

//....占坑,准备写几个关于按位运算的函数

//语言附注

































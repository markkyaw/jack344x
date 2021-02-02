import Foundation

//let constant = 100
//var variable = 20
//
//print(type(of: constant))
//print(type(of: variable))
//
//var var1: Int
//// declaring optional (could be nil in future)
//var var2: Int?
//var var3: Int!
//// default int value is 0
//var var4 = Int()

// Collection types: array, set, dictionary
var intArray = [Int](arrayLiteral: 1, 2, 3, 4)
intArray.append(1)
intArray.append(2)
print(intArray)
//
var intSet = Set<Int>(arrayLiteral: 1, 2, 3, 4)
intSet.insert(10)
intSet.insert(10)
print(intSet)
//
//var intStringDict = [Int: String](dictionaryLiteral: (1, "One"), (2, "Two"))
var intStringDict = [Int: String]()
intStringDict[1] = "One"
intStringDict[100] = "One zero zero"
intStringDict[110] = "One one zero"
print(intStringDict[2])

var couldBeNil = intStringDict[2]
if couldBeNil != nil {
//    do something
}

// if can assign unwrappedOptional to optional value
// code block won't run if couldBeNil is nil
if let unwrappedOptional = couldBeNil {
    
}

// know it's not nil
//couldBeNil!

// Providing default value
// If couldBeNil is nil, print the things in string
print(couldBeNil ?? "nil val")
let tryThis = couldBeNil ?? "ASL:JKSD"
print(tryThis)


//for Lazar in intArray {
//
//}

//while () {
//    break
//    continue
//}

//var i = 0
//for element in intArray {
//    i += 1
//}

//var i = 0
//switch i {
//case 1, 2, 3, 4, 5:
//    print("one to five")
//    break
//default:
//    print("none")
//}

//if i < 1 {
//
//}

// struct vs class
// structs are immutable
// structs are passed by value, classes are passed by reference
struct Struc {
    var i = 0
//    adding mutating builds a new struct and replace the old one
    mutating func changeMyself() {
        i += 1
    }
}

class Classe {
    var i = 0
    func changeMyself() {
        i += 1
    }
}

var sA = Struc()
var sB = sA
sB.i = 1
print(sA.i)

var cA = Classe()
var cB = cA
cB.i = 1
print(cA.i)

// thisManyTimes is argument (external calls)
// number is paremter (internal calls)
//func fU(thisManyTimes number: Int = 10) -> Bool {
//    return true
//}

// inout is reference (& in C++)
//func fU(thisManyTimes number: inout Int) -> Bool {
//    number = 20
//    return true
//}
//var bbb = 10
//fU(thisManyTimes: &bbb)
//print(bbb)

//func fU(thisManyTimes number: inout Int) -> (Bool, Int) {
//    number = 20
//    return (true, number)
//}
//
//var bbb = 10
//let retVal = fU(thisManyTimes: &bbb)
//// access the parts by retVal.0 retVal.1 .. etc
//print(retVal)

//protocol -> interface
// it's a guaranteed that whatever class/struct impelements the protocol, the function is available
// mainly used for UI text fields
// it's a pure virtual function (C++) or interface (Java)
// protocol : class (delegation pattern) -> only a class can conform to this protocol
protocol someProtocol: class {
//    var someVar: Int {get set}
    func meth()
}

class someClass: someProtocol {
    
    func meth() {}
    
    private let aaa = 1
}

// friend in C++
// use extension for organization purpose
extension someClass {
    func crystal() {
        aaa
    }
}

var someC = someClass()
someC.meth()
someC.crystal()


// Closures are mainly used for asynchronous code. It's like promise in JS

enum MyError: Error {
    case yeeYeeError(String)
}

func throwError() throws {
    throw MyError.yeeYeeError("throw erra")
}

// won't work since it's throwing at runtime
//try! throwError()
// supress the error
//try? throwError()
//do {
//    try throwError()
//} catch  {
//    print(error)
//}

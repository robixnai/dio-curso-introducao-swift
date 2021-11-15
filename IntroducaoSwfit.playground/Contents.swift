import UIKit
import Security

// Begin Sample Values
var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let explicitFloat: Float = 4

let label = "This width is "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

let quatation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit"
"""

var shoppingList = ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]
occupations["Jayne"] = "Public Relations"

let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]
// End Simple Values

// Begin Control Flow
let individualScore = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScore {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optinalString: String? = "Hello"
print(optinalString == nil)

var optinalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optinalName {
    greeting = "Hello, \(name)"
}

let nickname: String? = nil
let fullName: String = "John Apllessed"
let informalGreeting = "Hi \(nickname ?? fullName)"

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a long.")
case "cucumbe", "watercress":
    print("That wold make a good tea sandwich.")
case let x where x.hasSuffix("pepeer"):
    print("Is is a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 11, 13],
    "Fibtonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]
var largest = 0
var key = ""
for (_key, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            key = _key
        }
    }
}
print(largest)
print(key)

var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

var newTotal = 0
for i in 0...4 {
    newTotal += i
}
print(newTotal)
// End Control Flow

// Begin Funções e Closures
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet(person: "Bob", day: "Tuesday")

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet("John", on: "Wednesday")

func calculateStatics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statitics = calculateStatics(scores: [5, 3, 100, 3, 9])
print(statitics.sum)
print(statitics.2)

func returnFiftem() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFiftem()

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

numbers.map({ (number: Int) -> Int in
    let resut = 3 * number
    return resut
})

let mapperNumbers = numbers.map({ number in 3 * number })
print(mapperNumbers)

let sortedNumber = numbers.sorted { $0 > $1 }
print(sortedNumber)
// End Funções e Closures

// Begin Objetos e Classes
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

// Superclass
class NamedShape {
    var numberOfSides: Int = 0
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var namedShape = NamedShape(name: "shape")
namedShape.numberOfSides = 7
var namedShapeDescription = namedShape.simpleDescription()

// Subclass
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let square = Square(sideLength: 5.2, name: "my test square")
square.area()
square.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
// End Objetos e Classes

// Begin Enums e Structures
enum Rank: Int {
    case ace = 1
    case two, three, four, five, fix, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let heart = Suit.hearts
let heartDescription = heart.simpleDescription()

enum ServerReponse {
    case result(String, String)
    case failure(String)
}
let success = ServerReponse.result("6:00 am", "8:00 pm")
let error = ServerReponse.failure("Out of cheese")
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Error... \(message)")
}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

// Diferença entre Class Struct
class GoogleSheet {
    var author: String
    init(author: String) {
        self.author = author
    }
}
let file = GoogleSheet(author: "Pedro")
let fileChanged = file
fileChanged.author = "João"
print(file.author)

struct Excel {
    var author: String
}
let fileExcel = Excel(author: "Pedro")
var fileExcelChanged = fileExcel
fileExcelChanged.author = "João"
print(fileExcel.author)
// End Enums e Structures

// Begin Protocolos e Extensões
protocol ExampleProtocol {
    var simpleDescritpion: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescritpion: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescritpion += " Now 100% adjusted"
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescritpion

struct SimpleStructure: ExampleProtocol {
    var simpleDescritpion: String = "A simple strucre"
    mutating func adjust() {
        simpleDescritpion += " (adjusted)"
    }
    
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescritpion

extension Int: ExampleProtocol {
    var simpleDescritpion: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescritpion)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescritpion)
// End Protcolos e Extensões

// Begin Error Handling
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printResponse)
} catch {
    print(error)
}

do {
    let printResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
} catch {
    print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergentheler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

var fridgeIsOpen = false
var fridgeContent = ["milk, eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)
// End Error Handling

// Begin Generics
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element {
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    
    return false
}
anyCommonElements([1, 2, 3], [3])
// End Generics

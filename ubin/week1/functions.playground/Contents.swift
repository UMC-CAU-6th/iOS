import UIKit

// 함수
// 1. 함수 정의와 호출
// func 키워드를 앞에 붙여 함수를 정의
// 반환 화살표 -> (하이픈 뒤에 오른쪽 방향 꺽쇄를 붙임) 뒤에 반환 타입의 이름을 붙여 함수의 반환 타입
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
// -> person 이라 불리는 String 값인 하나의 파라미터, 그 사람의 인사말을 포함한 String 반환 타입
print(greet(person: "Anna"))
print(greet(person: "Brain"))

//위 예시를 더 짧게 -> 메세지 생성과 반환 구문을 한줄로 결합
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person: "Anna"))

// 2. 반환 파라미터와 반환값
// 1) 파라미터가 없는 함수 : 함수는 입력 파라미터 정의를 요구하지 않는다
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

// 2) 여러개 파라미터가 있는 함수 : 함수는 함수의 소괄호 내에 콤마로 구분하여 여러개의 입력 파라미터를 가질 수 있다.
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

// 3) 반환값 없는 함수 : 함수는 반환 타입 정의를 요구하지 않는다.
func greet2(person: String) {
    print("Hello, \(person)!")
}
greet2(person: "Dave")
// 함수의 반환값은 호출될 때 무시될 수 있다
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string) //-> 반환값 무시
}

// 4) 여러개의 반환값이 있는 함수 : 여러개의 값을 반환하기 위해 함수의 반환 타입으로 튜플 타입을 사용
func minMax(array: [Int]) -> (min:Int, max:Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return(currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

// 5) 옵셔널 튜플 반환 타입
// 함수에서 반환되는 튜플 타입이 전체 튜플에 대해 "값이 없을" 가능성이 있는 경우 옵셔널 튜플 반환 타입을 사용하여 전체 튜플이 nil 일 수 있다는 사실을 반영
// (Int, Int)? or (String, Int, Bool)?와 같이 튜플의 닫는 소괄호 다음에 물음표를 붙여 옵셔널 튜플 반환 타입을 작성
// 위 예시에서는 배열이 전달될 때 위험성 O -> 빈 배열을 포함하면 array[0]에서 에러 발생
// 이를 안전하게 처리하기 위해, 배열이 비어있을 때 nil 반환
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
//옵셔널 바인딩을 통해 이 버전의 minMax(array:) 함수가 실제 튜플 값을 반환하는지 nil 을 반환하는지 확인 가능
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// 6) 임시적 반환을 가진 함수 : 함수의 전체 본문이 한줄로 표현이 된다면 함수는 맹목적으로 표현식을 반환
// 단일 return 으로 작성된 함수는 return 을 생략할 수 있다.
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))
func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))


// 3. 함수 인수 라벨과 파라미터 이름
// 인수 라벨은 함수가 호출될 때 사용되고 각 인수는 함수 호출 시 인수 라벨 다음에 작성
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(firstParameterName: 1, secondParameterName: 2)

// 1) 인수 라벨 지정
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value for that parameter.
}
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))

// 2) 인수 라벨 생략 -> 언더바(_)
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(1, secondParameterName: 2)
// 파라미터가 인수 라벨을 가지고 있다면 함수를 호출할 때 인수는 반드시 라벨을 지정해야함

// 3) 파라미터 기본값 : 파라미터의 타입 뒤에 파라미터 값을 할당하여 함수의 파라미터에 기본값 (default value) 을 정의
// 기본값이 정의되어 있다면 함수를 호출할 때 파라미터를 생략 가능
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12

// 5) 가변 파라미터 : 0개 이상의 특정 타입의 값을 허용
// 함수가 호출될 때 여러개의 입력값이 전달될 수 있는 특정 파라미터는 가변 파라미터를 사용
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers

// 6) In-Out 파라미터
// 함수 파라미터는 기본적으로 상수! 해당 함수의 본문 내에서 함수 파라미터 값을 변경하려고 하면 에러!
// 변경하고 싶다면 in-out 파라미터로 대신 정의
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


// 4. 함수 타입 : 모든 함수는 파라미터 타입과 반환 타입으로 구성된 특정 함수 타입 (function type) 이 있다
func addTwoInts(_ a:Int, _ b:Int) -> Int {
    return a+b
}
func multiplyTwoInts(_ a:Int, _ b:Int) -> Int {
    return a*b
}
// -> 이 두 함수의 타입은 (Int, Int) -> Int
func printHelloWorld() {
    print("hello, world")
}
// -> 이 함수의 타입은 () -> Void

// 1) 함수 타입 사용
var mathFunction: (Int, Int) -> Int = addTwoInts
//-> "'2개의 Int 값과 Int 를 반환하는 함수' 의 타입을 가지는 mathFunction 이라는 변수를 정의
print("Result: \(mathFunction(2, 3))") // Prints "Result: 5"
mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
let anotherMathFunction = addTwoInts
// -> 상수 또는 변수에 함수를 할당할 때 함수 타입을 추론하기 위해 Swift에 맡길 수 있다.

// 2) 파라미터 타입으로 함수 타입
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 3, 5)

// 3) 반환 타입으로 함수 타입
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
// 두 함수 모두 (Int) -> Int 타입
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepFoward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// 3...
// 2...
// 1...
// zero!


// 5. 중첩 함수
func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward2(input: Int) -> Int { return input + 1 }
    func stepBackward2(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward2 : stepForward2
}
var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunction2(backward: currentValue2 > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue2 != 0 {
    print("\(currentValue2)... ")
    currentValue2 = moveNearerToZero2(currentValue2)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!

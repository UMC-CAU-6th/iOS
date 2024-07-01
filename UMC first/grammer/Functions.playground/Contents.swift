import UIKit

/*함수 파라미터와 호출*/
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
print(greet(person: "Brain"))



/*함수 파라미터와 반환값*/
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
// 입력없는 함수

func minMax(array: [Int]) -> (min: Int, max: Int) {
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
// 여러개의 반환값이 있는 함수 > 입력을 INT로 받고, 반환을 min, max로 하는 함수




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
//옵셔널 튜플 반환타입 > int입력받고, 2개의 int값을 포함하는 튜플 반환. 빈배열을 안전하게 처리하기 위해서는 옵셔널 튜플 반환 타입을 사용한다

/*함수 인수라벨과 파라미터 이름*/

func someFunction(firstParameterName: Int, secondParameterName: Int)
{
//asdasd
}
someFunction(firstParameterName: 1, secondParameterName: 2)



/*함수 타입*/
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts


/*중첩 함수*/
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


// 다시 공부하자

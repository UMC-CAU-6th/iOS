import UIKit
//명명된 함수 생성없이 실행되는 코드 그룹
/*클로저 표현식*/
/*정렬 메서드(The Sorted Method)*/
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
/*클로저 표현구(Closure Expression Syntax)*/
/* 형태
 { (<#parameters#>) -> <#return type#> in
    <#statements#>
 }
 */
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})
/*컨텍스트로 타입 추론*/
//타입 유추 가능
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
/*단일 표현 클로저의 암시적 반환*/
//return 키워드 생략
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
/*짧은 인수 이름*/
//in 키워드 생략 가능
reversedNames = names.sorted(by: { $0 > $1 } )
/*연산자 메서드*/
reversedNames = names.sorted(by: >)

/*후행 클로저(Trailing Closures)*/
//함수의 마지막 인수로 함수에 클로저 표현식을 전달해야하고 클로저 표현식이 긴 경우
func someFunctionThatTakesAClosure(closure: () -> Void) {
    
}
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}
reversedNames = names.sorted() { $0 > $1 }
//수와 메서드의 유일한 인수일 경우 소괄호 생략 가능
reversedNames = names.sorted { $0 > $1 }
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
/*
 사진 갤러리에서 사진을 불러오는 함수
func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}
 오류 처리기
 loadPicture(from: someServer) { picture in
 someView.currentPicture = picture
} onFailure: {
 print("Couldn't download the next picture.")
}
*/

/*캡처값*/
//상수와 변수를 정의한 원래 범위가 더이상 존재하지 않더라도 본문 내에서 해당 상수와 변수의 값을 참조하고 수정할 수 있음
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
//incrementByTen을 다시 호출하면 incrementBySeven 으로 캡처된 변수는 영향을 주지 않음
incrementByTen()

/*클로저는 참조 타입*/
//상수가 참조하는 클로저는 캡처한 runningTotal 변수를 계속 증가시킬 수 있음
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
incrementByTen()

/*탈출 클로저(Escaping Closures)*/
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x) //200
completionHandlers.first?()
print(instance.x) //100
class SomeOtherClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
/*
 struct SomeStruct {
     var x = 10
     mutating func doSomething() {
         someFunctionWithNonescapingClosure { x = 200 }  // Ok
         someFunctionWithEscapingClosure { x = 100 }     // Error
     }
 }
 */

/*자동 클로저(Autoclosures)*/
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
print("Now serving \(customerProvider())!")
//클로저가 실제로 호출되기 전까지 삭제되지 않음
print(customersInLine.count)
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
//파라미터 타입 @autoclosure
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
//@autoclosure 와 @escaping 속성 사용
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}

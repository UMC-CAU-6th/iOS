import UIKit

//클로저는 명명된 함수 생성없이 실행되는 코드 그룹이다.

// 전역 함수는 이름을 가지고 어떠한 값도 캡처하지 않는 클로저
// 중첩함수는 이름을 가지고 둘러싼 함수로 부터 값을 캡처할 수 있는 클로저
// 클로저 표현식은 주변 컨텍스트에서 값을 캡처할 수 있는 경량구문으로 작성된 이름이 없는 클로저


/*클로저는 일급 객체로서, 코드 블록을 가지고 있으며, 코드 내부에서 전달하고 사용할 수 있는 독립적인 기능을 갖춘 함수와 유사한 것입니다. 클로저는 주변 컨텍스트(lexical context)에서 값을 캡처(capture)하여 저장하고, 필요에 따라 그 값을 참조할 수 있습니다.
 
 캡처(Capture)는 클로저가 주변 컨텍스트(lexical context)에서 변수나 상수를 저장하고, 이를 나중에 참조할 수 있도록 하는 동작을 말합니다. 클로저가 주변 범위에서 변수나 상수를 캡처할 때, 해당 변수나 상수의 값은 클로저 내부에 저장되어 나중에 호출될 때 사용됩니다.
*/



/*정렬메서드*/
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool{
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)



reversedNames = names.sorted(by: { s1, s2 in return s1 > s2})

reversedNames = names.sorted(by: >)
// 배열에 내림차순으로 정리됨

/*후행 클로저*/
func someFunctionThattakesAclosure(closure: () -> Void) {
    
}

someFunctionThattakesAclosure(closure: {
    
})

reversedNames = names.sorted() { $0 > $1 }




/*
func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}

loadPicture(from: someServer) { picture in
    someView.currentPicture = picture
} onFailure: {
    print("Couldn't download the next picture.")
}
 */
  //사진 불러오기
  
  
  
  
/*캡처값*/
  func makeIncrementer(forIncrement amount: Int) -> () -> Int {
      var runningTotal = 0
      func incrementer() -> Int {
          runningTotal += amount
          return runningTotal
      }
      return incrementer
  }


let incrementByTen = makeIncrementer(forIncrement: 10)

/*클로저는 참조타입*/
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

incrementByTen()

//위의 예제는 호출은 모두 같음

/*탈출 클로저*/
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

// @escaping을 표시안하면 컴파일 시 에러가 발생


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
print(instance.x)

completionHandlers.first?()
print(instance.x)

//공부하자


/*자동 클로저*/

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)


print("Now serving \(customerProvider())!")

print(customersInLine.count)

//클로저는 다시공부하자.

import UIKit

// 클로저(Closures) : 명명된 함수 생성없이 실행되는 코드 그룹
// 코드에서 주변에 전달과 사용할 수 있는 자체 포함된 기능 블럭
// + 앞서 소개한 전역과 중첩 함수는 클로저의 특별한 케이스

// 1. 클로저 표현식
// 1) 정렬 메서드 : sorted(by:)
/* sorted(by:) 메서드는 배열 내용과 동일한 타입의 두 인수를 사용하는 클로저를 허용하고 값이 정렬된 후 첫번째 값이 두번째 값의 앞 또는 뒤에 표시되어야 하는지 여부를 나타내는 Bool 값을 반환합니다. 정렬 클로저는 첫번째 값이 두번째 값 앞에 나타나야 하는 경우 true 를 반환하고 그렇지 않으면 false 를 반환해야 합니다. */
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// -> 이 예제는 String 값의 배열을 정렬하고 정렬 클로저는 (String, String) -> Bool 타입의 함수를 필요로 함
// 정렬 클로저를 제공하는 한가지 방법은 올바른 타입의 일반 함수를 작성하고 sorted(by:) 메서드에 인수로 전달하는 것

// 2) 클로저 표현구
/* { (<#parameters#>) -> <#return type#> in
    <#statements#>
   } */
//위 backward함수의 클로저 표현 버전 -> 인라인 클로저
reversedNames = names.sorted(by: {(s1:String, s2:String) -> Bool in return s1>s2})
// -> 클로저의 본문의 시작은 'in' 키워드로 시작

// 3) 컨텍스트로 타입 추론
// 정렬 클로저는 메서드에 인수로 전달되기 때문에 Swift는 파라미터 타입과 반환되는 값의 타입을 유추 가능
// sorted(by:) 메서드는 문자열 배열에서 호출되므로 인수는 (String, String) -> Bool 타입의 함수이어야 함
// 이는 (String, String) 과 Bool 타입을 클로저 표현식 정의에 일부러 작성할 필요가 없음을 의미
// 모든 타입은 유추할 수 있기 때문에 반환 화살표 (->)와 파라미터의 이름을 둘러싼 소괄호를 생략할 수 있다.
reversedNames = names.sorted(by: {s1, s2 in return s1>s2})

// 4) 단일 표현 클로저의 암시적 반환
// return 키워드를 생략하여 단일 표현식으로 암시적으로 값을 반환
reversedNames = names.sorted(by: {s1,s2 in s1>s2})

// 5) 짧은 인수 이름 :
// Swift는 인라인 클로저에 $0, $1, $2 등 클로저의 인수값으로 참조하는데 사용할 수 있는 자동적으로 짧은 인수 이름을 제공
// 짧은 인수 이름을 사용한다면 선언에 클로저의 인수 리스트를 생략 가능 -> 유추됨
// 클로저 표현식이 본문으로 전체가 구성되기 때문에 in 키워드를 생략 가능
reversedNames = names.sorted(by: {$0 > $1})

// 6) 연산자 메서드
// 위의 클로저 표현식을 더 짧게 작성가능 -> 연산자(>)
reversedNames = names.sorted(by: >)


// 2. 후행 클로저
// 함수의 마지막 인수로 함수에 클로저 표현식을 전달해야하고 클로저 표현식이 긴 경우 후행 클로저로 작성하는 것이 유용
// 후행 클로저는 함수의 인수이지만 함수 호출의 소괄호 다음에 작성
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

// 후행 클로저로 sorted(by:) 메서드의 소괄호 바깥에 작성 가능
reversedNames = names.sorted() { $0 > $1 }
// 후행 클로저 표현식이 함수와 메서드의 유일한 인수일 경우 함수를 호출할 때 함수 이름 뒤에 소괄호 () 를 작성하지 않아도
reversedNames = names.sorted { $0 > $1 }
// 후행 클로저는 클로저가 길어서 한줄로 인라인으로 작성이 불가능할 때 유용
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
//numbers 배열을 사용하여 후행 클로저로 map(_:) 메서드로 클로저 표현식을 전달하여 String 값의 배열을 생성
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]

// 함수가 여러개의 클로저를 가지고 있다면 첫번재 후행 클로저의 인수 라벨을 생략하고 남은 후행 클로저의 라벨은 표기
func loadPicture(from server: Server, completion: (Picture)->Void, onFailure: ()->Void) {
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

// 3. 캡처값

// 4 클로저는 참조 타입

// 5. 탈출 클로저

// 6. 자동 클로저

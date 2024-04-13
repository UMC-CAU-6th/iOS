import UIKit

// 1. 상수와 변수 선언
// 상수는 'let', 변수는 'var'
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

// 예제
var environment = "development"
let maximumNumberOfLoginAttepts: Int
// maximumNumberOfLoginAttepts has no value yet

if environment == "development" {
    maximumNumberOfLoginAttepts = 100
} else {
    maximumNumberOfLoginAttepts = 10
}
// Now maximumNumberofLoginAttempts has a value, and can be read

// 여러개의 상수 또는 여러개의 변수를 선언할 때, 콤마로 구분하여 한줄로 선언이 가능하다
var x = 0.0, y = 0.0, z = 0.0


// 2. 타입 명시(Type Annotations)
/* 상수 또는 변수를 선언할 때, 저장할 수 있는 값의 종류를 명확하게 하기 위해 타입 명시 제공
   상수 또는 변수 이름 뒤에 콜론과 공백 한칸 뒤에 사용할 타입 이름을 적어 사용 */
var welcomeMessage: String

welcomeMessage = "Hello" //문자열 값 지정 가능
var red, green, blue: Double //한줄로 선언 가능

/* Note
   실제로 타입 명시가 필요한 경우는 드뭅니다.
   상수 또는 변수를 선언할 때 초기값을 지정하면 Swift는 타입 세이프티와 타입 추론에서 나와있는대로
   해당 상수 또는 변수에 사용될 타입을 거의 항상 유추할 수 있습니다.*/

// 3. 상수와 변수의 이름
// 상수와 변수 이름은 유니코드 문자를 포함하여 대부분의 문자를 포함할 수 있다
let n = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
// 공백, 수학적 기호, 화살표, 내부에서 사용하는 유니코드 스칼라 값, 선과 박스를 그리는 문자를 포함할 수 없다
// 숫자로 시작하는 이름은 선언할 수 없다
// 특정 타입으로 상수 또는 변수를 선언하면, 동일한 이름으로 다시 선언하거나 다른 타입의 값을 저장하도록 변경하여 선언할 수 없다.

//동일한 타입의 다른 값으로 이미 선언된 변수에 값을 변경할 수는 있다!
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// 상수는 값 지정 이후 변경할 수 없다!
let languageName = "Swift"
//languageName = "Swift++" // Compile-time error!: languageName cannot be changed

// 4. 상수와 변수 출력
/* print(_:separator:terminator:) 함수 : 하나 또는 그 이상의 값을 적절하게 출력하는 전역 함수
   -> 콘솔 창에 결과 출력
   -> separator 와 terminator 파라미터는 기본 값을 가지고 있으므로 함수를 호출할 때 생략 가능
   -> 기본적으로 이 함수는 줄바꿈을 출력하고 종료
      - 줄바꿈 없이 값을 출력하려면 print(someValue, terminator: "")와 같이 terminator 에 빈 문자열을 넘겨주기!
 */
print(friendlyWelcome) // Prints "Bonjour!"

/* Swift는 긴 문자열에 상수 또는 변수의 이름을 포함하여 Swift가 상수 또는 변수의 현재 값으로 대체하기 위해 문자열 삽입을 사용! 이름을 소괄호로 감싸고 여는 소괄호 전에 역슬래시를 추가! */
print("The current value of friendlyWelcome is \(friendlyWelcome)",terminator: "")
print("줄바꿈 테스트")

// 5. 주석
/* 주석은 잘 쓸 수 있어용 /*주석 중첩도 가능!ㅎㅎ*/ */

// 6. 세미콜론
// Swift는 코드의 각 구문 후에 세미콜론(;)이 필수 조건이 아님! 그러나 여러 구문을 한줄로 작성할 경우 세미콜론 작성은 필수!
let cat = "🐱"; print(cat)

// 7. 정수
/* 정수는 부호가 있는 정수(양수 or 0 or 음수)와 부호가 없는 정수(양수 or 0)가 있다!
   Swift는 8, 16, 32, 그리고 64 비트 형태의 부호가 있는 정수와 부호가 없는 정수를 지원
   ex) UInt8 : 8-bit 부호가 없는 정수, Int32 : 32-bit 부호가 있는 정수
   Swift의 모든 타입과 마찬가지로 정수 타입은 대문자로 시작
 */

// 8. 정수 범위
/* 각 정수 타입의 min과 max 프로퍼티 -> 정수 타입의 최소값가 최대값 */
let minValue = UInt8.min // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max // maxValue is equal to 255, and is of type UInt8
/* Int, UInt 설명
*/

// 9. 부동 소수점 숫자 : 분수 성분을 가진 숫자
/* 정수 타입의 값 범위보다 더 넓은 범위의 표현이 가능
   Double : 64-bit 부동 소수점 숫자를 표기
   Float : 32-bit 부동 소수점 숫자를 표기
*/

// 10. 타입 세이프티와 타입 추론
/* Swift는 타입 세이프이기 때문에 코드를 컴파일 할 때 타입 검사를 수행하고 일치하지 않는 타입을 오류로 표시!
   이를 통해 개발 단계에서 가능한 빨리 오류를 포착하고 수정할 수 있다! */
/* 필요한 값의 특정 타입을 지정하지 않으면 Swift는 적절한 타입으로 타입 추론 (Type Inference) 을 사용 */
let meaningOfLife = 42 // meaningOfLife는 Int라고 추론
let pi = 3.14159 // pi는 Double이라고 추론
// Swift는 부동 소수점 숫자의 타입을 추론할 때 항상 Float보다 Double 선택
let anotherPi = 3 + 0.14159 // 정수와 부동소수 리터럴을 결합하면 Double 타입으로 유추

// 11. 숫자 리터럴
/* 정수 리터럴
 접두사 없는 10진수
 0b 접두사로 2진수
 0o 접두사로 8진수
 0x 접두사로 16진수 */
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11
// -> 모든 정수 리터럴은 10진수 17의 값을 가진다!

/* 부동 소수점 리터럴 */

// 12. 숫자 타입 변환
// 1) 정수 변환
// 2) 정수와 부동 소수점 변환

// 13. 타입 별칭
// 이미 존재하는 타입을 다른 이름으로 정의 -> 'typealias' 키워드 사용
// 상황에 맞는 이름으로 기존 타입을 참조하려는 경우에 유용
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min // maxAmplitudeFound 변수의 초기값은 0
// -> AudioSample은 UInt16의 별칭으로 정의된다!

// 14. 부울(Booleans)
// 2개의 부울 상수 값인 true와 false를 제공
let orangesAreOrange = true
let turnipsAreDelicious = false
// if 구문과 같은 조건문으로 동작할 때 특히 유용!
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible")
}
// Swift의 타입 세이프티는 부울이 아닌 값이 Bool로 대체되는 것을 방지
let i = 1
if i { } // -> 컴파일 에러
let i = 1
if i == 1 { } //-> 정상 동작

// 15. 튜플(Tuples)
// 튜플은 여러값을 단일 복합 값으로 그룹화한다! 튜플 안에 값은 어떠한 타입도 가능하며, 서로 같은 타입일 필요 X
let http404Error = (404, "Not Found")
/* (404, "Not Found") 는 HTTP 상태 코드 (HTTP status code) 를 나타내는 튜플
   HTTP 상태 코드는 웹 페이지를 요청할 때마다 웹 서버가 반환하는 특정 값
   404 Not Found 상태 코드는 요청한 웹 페이지가 존재하지 않을 때 반환
   튜플의 타입은 (Int, String) -> Int와 String을 함꼐 그룹화하여 제공 */

// 모든 타입의 튜플을 만들 수 있으며, 원하는 만큼 다른 타입을 포함할 수 있다! -> (Int, Int, Int) or (String, Bool)

// 튜플의 내용을 별도의 상수 또는 변수로 분해 (decompose) 하여 평소와 같이 접근할 수 있다!
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

// 튜플의 값 중 일부만 필요한 경우, 튜플을 분해할 때 밑줄(_)로 튜플의 일부를 무시할 수 있다!
let(justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

//0에서 시작하는 인덱스를 사용하여 튜플의 개별 요소 값에 접근할 수 있다!
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// 튜플을 정의할 때 튜플의 요소에 이름을 정할 수 있다!
let http200Status = (statusCode: 200, description: "OK")

// 튜플 요소에 이름이 있다면 요소의 값에 요소 이름으로 접근이 가능하다!
print("The status code is \(http200Status.statusCode)") // Prints "The status code is 200"
print("The status message is \(http200Status.description)") // Prints "The status message is OK"

// 16. 옵셔널(Optionals)
// 값이 없는 경우에 옵셔널을 사용
// 2가지 가능성이 있다 : 지정된 타입의 값 / 옵셔널을 풀어서 값에 접근하거나 값이 없을 수도 있음
/* 누락될 수 있는 값의 예로 Swift의 Int 타입은 String 값을 Int 값으로 변환하는 초기화가 존재
   그러나 일부 문자열만 정수로 변환 가능
   문자열 "123" 은 숫자값 123 으로 변환될 수 있지만 문자열 "hello, world" 는 변환할 숫자값이 없다. */
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) // convertedNumber의 타입형 = "optional Int"

// 옵셔널 타입의 작성 -> 옵셔널을 포함하는 타입의 이름 다음에 물음표(?) 작성
// 예) 옵셔널 Int의 타입은 Int? -> 항상 어떠한 Int 값 또는 값이 없음을 포함

// 1) nil : 옵셔널 변수에 특수한 값 nil로 지정ㅇ하여 값이 없는 상태 나타내기
var serverResponseCode: Int? = 404 // serverResponseCode contains an actual Int value of 404
serverResponseCode = nil // serverResponseCode now contains no value
// 기본값이 없이 옵셔널 변수를 정의하면, 이 변수는 자동적으로 nil로 설정
var surveyAnswer: String? // surveyAnswer is automatically set to nil
// if 구문은 옵셔널과 nil을 비교하여 옵셔널에 값이 포함되어 있는지 확인할 수 있다! -> ==와 !=로 비교 수행
if convertedNumber != nil { // 옵셔널에 값이 있다면, nil과 "같지 않음"으로 간주
    print("convertedNumber contains some integer value.")
}
// 옵셔널이 아닌 상수 또는 변수에는 nil을 사용할 수 없다!
// 코드에서 상수 또는 변수가 특정 조건에서 값이 없이 동작하려면 적절한 타입의 옵셔널 값을 선언해야 한다!
// 옵셔널 값에 접근할 때 코드에서 nil과 nil이 아닌 것에 대해 모두 처리해야 한다.
// 값이 없을 때 수행할 수 있는 작업이 있다.
/* (1) 값이 Nil일 때 해당값에 대한 동작을 건너뜁니다.
   (2) nil을 반환하거나 옵셔널 체이닝에서 설명한 '?.' 연산자를 사용해서 nil 값을 전파합니다.
   (3) '??' 연산자를 사용해서 대체값을 제공합니다.
   (4) '!' 연산자를 사용해서 프로그램을 멈춥니다.*/

// 2) 옵셔널 바인딩
// 옵셔널 바인딩 : 옵셔널이 값을 포함하고 있는지 확인하고 값이 있는 경우 해당 값을 임시 상수 또는 변수로 사용할 수 있게 한다.
/* if let <#constantName#> = <#someOptional#> {
        <#statements#>
 }
}*/
// 강제 언래핑보다  옵셔널 바인딩을 사용하여 옵셔널 (Optionals) 섹선에 있는 예제의 possibleNumber 를 다시 작성
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"
/* 위 코드의 의미
   Int(possibleNumber)에 의해 반환된 옵셔널Int 에 값이 포함 -> actualNumber 상수에 옵셔널에 포함된 값을 설정
   변환에 성공 -> actualNumber 상수는 if 구문 첫번째 중괄호 내에서 사용 가능
   옵셔널에서 포함된 값으로 초기화되었고 적절한 옵셔널이 아닌 타입입니다.
   이런 경우에 possibleNumber 의 타입은 Int? 이므로 actualNumber 의 타입은 Int*/

//값에 접근한 후에 기존 옵셔널 상수 또는 변수를 참조할 필요가 없다면, 같은 이름으로 새로운 상수 또는 변수 사용 가능
let myNumber = Int(possibleNumber) //여기에서 myNumber은 optional integer
if let myNumber = myNumber {
    //여기에서 myNumber은 non-optional integer
    print("My number is \(myNumber)")
}
/* 이 코드는 이전 예제에서의 코드와 마찬가지로 myNumber 가 값이 있는지 없는지를 먼저 확인합니다. myNumber 가 값이 있다면 해당 값이 새로운 myNumber 라는 상수에 설정됩니다. if 구문 안에서 myNumber 는 새로운 옵셔널이 아닌 상수를 참조합니다. if 구문의 앞에 또는 뒤에 myNumber 를 작성하면 원래 옵셔널 정수 상수를 참조합니다. */

// 옵셔널 값을 언래핑 하는데 더 짧게 사용 가능 : 언래핑할 상수 또는 변수의 이름만 작성 -> 암시적으로 같은 이름의 옵셔널 값 사용
if let myNumber {
    print("My number is \(myNumber)")
}

/* 옵셔널 바인딩은 상수와 변수 둘다 사용이 가능합니다. if 구문에 첫번째 중괄호에서 myNumber 의 값을 변경하고 싶다면 if var myNumber 로 대신 쓸 수 있으며 옵셔널에 포함된 값은 상수가 아닌 변수로 사용할 수 있습니다. if 구문내에서 myNumber 를 바꾸면 이것은 지역 변수에만 적용되며, 기존 언래핑된 옵셔널 상수 또는 변수에 적용되지 않습니다. */

// 필요한 경우 if 구문에 쉼표로 구분하여 옵셔널 바인딩 및 부울 조건을 여러개 포함할 수 있다.
// 옵셔널 바인딩 값 중 하나가 nil 이거나 부울 조건이 false 로 판단되면 전체 if 구문의 조건은 false 로 간주됩니다.
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
} // Prints "4 < 42 < 100"
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
} // Prints "4 < 42 < 100"

// 3) 대체값 제공
// 누락된 값을 처리하는 다른 방법은 nil-결합 연산자 (??) 사용하여 기본값을 제공하는 방법
// 옵셔널에서 ?? 의 왼편이 nil 이 아니면, 값은 언래핑되고 사용. 그렇지 않으면 ??의 오르편 값이 사용
let name: String? = nil
let greeting = "Hello, " + (name ?? "friend") + "!"
print(greeting) //prints "Hello, friend!"
// -> 이름이 지정되면 지정된 이름에 인사, 아니면 일반적인 인사(friend) 사용

// 4) 강제 언래핑
// 프로그래머의 에러 또는 원치않는 상태와 같은 실패를 nil 로 표현하려면 옵셔널의 이름 뒤에 느낌표 (!) 를 추가
// nil 이 아닌 값에 강제 언래핑을 하면, 언래핑된 값을 결과로 얻습니다. nil 값을 강제 언래핑하면 런타임 에러가 발생
// '!'은 fatalError(_:file:line:) 의 짧은 작성법
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

let number = convertedNumber!

guard let number = convertedNumber else {
    fatalError("The number was invalid")
}

// 5) 암시적으로 언래핑된 옵셔널

// 17. 에러 처리

// 18. 역설과 전제조건
// 1) 역설을 통한 디버깅
// 2) 강제 전제조건


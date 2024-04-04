import UIKit

/*상수와 변수*/
//let maximumNumberOfLoginAttempts = 10 상수 선언
var currentLoginAttempt = 0 //변수 선언

var environment = "development"
let maximumNumberOfLoginAttempts: Int
if environment == "development" {
    maximumNumberOfLoginAttempts = 100
} else {
    maximumNumberOfLoginAttempts = 10
}
//상수 maximumNumberOfLoginAttempts는 environment의 값에 의존함

var x = 0.0, y = 0.0, z = 0.0 //여러 개의 변수 한 줄 선언 가능

/*타입 명시*/
var welcomeMessage: String
welcomeMessage = "Hello"
var red, green, blue : Double //여러 개의 변수 타입 명시 가능

/*상수와 변수의 이름*/
let n = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
//공백, 수학 기호, 화살표, 내부에서 사용하는 유니코드 스칼라 값, 선과 박스를 그리는 문자 포함 X
//숫자로 시작하면 X, 동일한 이름 사용하거나 다른 타입으로 변경 X, 상수/변수 바꾸기 X
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
let languageName = "Swift"
//languageName = "Swift++" 상수 값은 바꿀 수 없다

/*상수와 변수 출력*/
print(friendlyWelcome)
//print(someValue, terminator: "")  줄바꿈 없이 값 출력
print("The current value of friendlyWelcome is \(friendlyWelcome)") //괄호 사용 전 역슬래시

/*주석*/
//한 줄 주석

/*여러
 줄
 주석/*중첩 가능*/*/

/*세미콜론*/
let cat = "🐱"; print(cat) //세미콜론이 필수는 아니나 여러 구문을 한 줄로 작성할 경우 세미콜론을 써야 함

/*정수*/
let minValue = UInt8.min //정수 타입의 최소값과 최대값
let maxValue = UInt8.max
//Swift에서는 Int와 UInt를 제공
//Double(소숫점 아래 최소 15자리, Float 6자리)

/*타입 세이프티와 타입 추론*/
//타입 검사, 타입 추론을 통해 오류를 피하도록 도와준다
let meaningOfLife = 42 //Int로 추론
//let pi = 3.14159  Double로 추론(Float보단 Double 선호)
let anotherPi = 3 + 0.14159 //Double로 추론

/*숫자 리터럴*/
let decimalInteger = 17 //10진수
let binaryInteger = 0b10001 //2진수
let octalInteger = 0o21 //8진수
let hexadecimalInteger = 0x11 //16진수
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1 //e1은 10의 1승을 곱해짐
let hexadecimalDouble = 0xC.3p0 //p0은 2의 0승이 곱해짐
let paddedDouble = 000123.456 //밑줄을 포함해도 되고, 0을 앞에 채워도 되나 값에 영향을 주진 X
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

/*숫자 타입 변환*/
/*정수 변환*/
//let cannotBeNegative: UInt8 = -1  UInt8의 범위는 0부터 255까지
//let tooBig: Int8 = Int8.max + 1   Int8의 범위는 -128~127까지
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one) //타입이 달라 직접적으로 더할 수 없으므로 one의 타입을 바꿈
//SomeType(ofInitialValue)
/*정수와 부동 소수점 변환*/
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(pi) //소숫점 아래 자리는 버림

/*타입 별칭*/
typealias AudioSample = UInt16 //이미 존재하는 타입을 다른 이름으로 변환
var maxAmplitudeFound = AudioSample.min

/*부울(Booleans)*/
let orangesAreOrange = true
let turnipsAreDelicious = false
//부울값은 조건문을 동작시킬 때 유용하다
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

/*튜플(Tuples)*/
let http404Error = (404, "Not Found") //여러 값을 단일 복합 값으로 그룹화, 서로 같은 타입일 필요 X
//튜플 접근 방법
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
//_로 튜플 일부분 무시
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
//인덱스 사용
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")
let http200Status = (statusCode: 200, description: "OK")
//튜플 요소에 이름이 있다면 요소 이름으로 접근 가능
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

/*옵셔널(Optionals)*/
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
//convertedNumber의 타입은 optional Int(Int?)이다. Int값 또는 값이 없음을 의미

/*nil*/
var serverResponseCode: Int? = 404
serverResponseCode = nil //값이 없음
var surveyAnswer: String? //자동적으로 nil이 됨
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
//옵셔널이 아닌 상수/변수에는 nil 사용할 수 X

/*옵셔널 바인딩*/
/*
 옵셔널 바인딩 사용법
 if let <#constantName#> = <#someOptional#> {
    <#statements#>
 }
 */
let myNumber = Int(possibleNumber)
if let myNumber = myNumber {
    print("My number is \(myNumber)")
}
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
//if 구문 내에서 변수 바꾸면 지역 변수에만 적용됨

/*대체값 제공*/
//nil-결합 연산자 ?? 값이 nil이면 오른쪽, 아니면 왼쪽 값 사용
let name: String? = nil
let greeting = "Hello, " + (name ?? "friend") + "!"
print(greeting)

/*강제 언래핑*/
let number = convertedNumber!
guard let number = convertedNumber else {
    fatalError("The number was invalid")
}

/*암시적으로 언래핑된 옵셔널*/
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString
let optionalString = assumedString
if assumedString != nil {
    print(assumedString!)
}
if let definiteString = assumedString {
    print(definiteString)
}

/*에러 처리*/
func canThrowAnError() throws {
    
}
do {
    try canThrowAnError()
    //에러를 발생할 수 있는 함수
} catch {
    //에러 발생 시 실행되는 구문
}
//다양한 에러조건에 응답할 수 있음
/*
func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}
*/

/*역설을 통한 디버깅*/
let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
//age>=0이 True일 경우 코드 이어서 실행, False일 경우 종료&메세지 반환
assert(age >= 0) //메세지 생략 가능
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

/*강제 전제 조건*/
//precondition(index > 0, "Index must be greater than zero.")

import UIKit

/*상수와 변수 선언*/
var environment = "development"
let maximumNumberofLoginAttempts : Int

if environment == "development"
{
    maximumNumberofLoginAttempts = 100
}
else
{
    maximumNumberofLoginAttempts = 10
}

var x = 0.0, y = 0.0, z = 0.0

/*타입 명시*/
var welcomeMessage : String
welcomeMessage = "Hello"

var red, green, blue: Double


/*상수와 변수의 이름*/
let n = 3.14159
let 😆 = "smile"

var freindlywelcome = "Hello!"
freindlywelcome = "Bonhour!"

let languageName = "Swift"
//languageName = "Swift++" 안됨

/*상수와 변수출력*/
print(freindlywelcome)

print("The current value of friendlyWelcome is \(freindlywelcome)")
//"The current value of friendlyWelcome is Bonjour!

/*세미콜론*/

let cat = "😺"; print(cat)
// 여러 구문을 한 줄로 작성할 경우에 세미콜론.

/*정수*/
let minValue = UInt8.min // 0
let maxvalue = UInt8.max // 255

// 정수로 작업할 때는 Int를 사용하자.(-2147483648~2147483648)
// UInt는 부호없는 정수 타입이 필요한 경우에만 사용하자.
// 위의 Int, UInt는 플랫폼이 32bit면 32bit 64면 64bit
// Double은 64-bit 부동 소수점 숫자를 표기, Float는 32-bit 부동 소수점 숫자를 표기
// Double을 더 선호한다.

/*타입 세이프티와 타입 추론*/
let meaningOfLife = 42
let pi = 3.14159
let anotherPi = 3 + 0.14159
// swift는 자료형을 안써도 추론을 해준다.


/*숫자 리터럴*/
let decimalInteger = 17
let binaryInteger = 0b1001 // 17을 이진수로 표현 + 8진수, 16진수도 마찬가지
/*숫자 타입변환*/
let cannotBenegative: UInt8 = 1 // -1 은 안된다
let Toobing: Int8 = Int8.max // +1을 해버리면 오류가 발생한다

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twothousandone = twoThousand + UInt16(one)
//UInt16으로 변환해줘야 함

let three = 3
let pointonefouronefivenine = 0.14159
let Pi = Double(three) + pointonefouronefivenine
// double으로 변환해줘야함
let integerPi = Int(pi) // 3이된다


/*타입 별칭*/
typealias Audiosample = UInt16

var maxAMplitudeFound = Audiosample.min // max~는 0이다


/*부울*/
let orangesAreorange = true
let turnipsAredelicous = false

if turnipsAredelicous
{
    print("Mmm, tasty turnips")
}
else
{
    print("Eww, turnips are horrible.") //print this
}

let i = 1
if i == 1
{
    
}
// if i { } 는 안됨 : 부울이 아닌 값이 Bool로 대체되는 것을 방지한다.
// i == 1 비교 결과는 Bool타입이므로 두 번째 예제는 타입검사를 정상적으로 수행할 수 있다.


/*튜플*/
let http404Error = (404, "Not Found")

let (statuscode, statusMessage) = http404Error
print("the status code is \(statuscode)")
//prints the status code is 404
print("the status message is \(statusMessage)")
//prints the status message is not found

let (justthestatuscode, _) = http404Error
print("the status code is \(justthestatuscode)")
//the status code is 404

print("the status code is \(http404Error.0)")
// prints "the status code is 404
print("the status message is \(http404Error.1)")
//the status code is Not found

let http200status = (statuscode: 200, description: "OK")
print("The status code is \(http200status.statuscode)")
//the status code is 200
print("the status message is \(http200status.description)")
// the status message is ok

/*옵셔널*/
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// Int가 아닌 optional Int를 반환

var serverresponsecode: Int? = 404
serverresponsecode = nil

var surveyanswer: String?
// 기본값 없이 옵셔널 변수로 정의하면 자동적으로 nil로 된다.

if convertedNumber != nil
{
    print("convertednumber contains some integer value")
}
//prints " convertednumber contains some integer value "

if let actualnumber = Int(possibleNumber)
{
    print("the string number is \(possibleNumber)")
}
else
{
    print("the string number is \(possibleNumber)")
}
// the string number is 123이 나온다.
// 설명하자면, Int(possiblenumber)에 값이 있으면 actualnumber라는 상수에 옵셔널에 포함된 값을 생성한다.


let myNumber = Int(possibleNumber)
if let myNumber = myNumber
{
    print("My number is \(myNumber)")
}


if let firstnumber = Int("4"), let secondnumber = Int("42"), firstnumber < secondnumber && secondnumber < 100
{
    print("\(firstnumber)<\(secondnumber)<100")
}
// prints "4<42<100"
if let firstNumber = Int("4")
{
    if let secondNumber = Int("42")
    {
        if firstNumber < secondNumber && secondNumber < 100
        {
            print("\(firstNumber)<\(secondNumber)<100")
        }
    }
}


/*대체값 제공*/
let name: String? = nil
let greeting = "Hello, " + (name ?? "friend") + "!"
print(greeting)
// Hello, friend!

let possiblenumber = "123"
let convertednumber = Int(possiblenumber)

let number = convertednumber!

guard let number = convertednumber
else
{
    fatalError("The number was invalid")
}


let possibleString: String? = "AN optional string"
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string"
let implicitString: String = assumedString





/*에러 처리*/
func canThrowanerror() throws
{
    //이 함수는 에러를 포착함
}

do
{
    try canThrowanerror()
    // no error was thrown
}
catch
{
    //an error was thrown
}
/*
func makeAsandwitch() throws
{
    
}
do
{
    try makeASandwich()
        eatASandwich()
    } catch SandwichError.outOfCleanDishes {
        washDishes()
    } catch SandwichError.missingIngredients(let ingredients) {
        buyGroceries(ingredients)
    }
}
*/

/*역설과 전제조건*/


//역설을 통한 디버깅
let age = -3
assert(age >= 0, "A person's age can't be less than zero")

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

//강제 전제조건
//precondition(index > 0, "Index must be greater than zero.")

//이게 왜 오류야?

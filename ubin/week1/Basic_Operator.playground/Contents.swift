import UIKit


// 1. 기본 연산자
// 2. 술어
// 단항 연산자, 이항 연산자, 삼항 연산자

// 3. 대입 연산자
let b = 10
var a = 5
a = b
// 튜플 대입
let (x,y) = (1,2)
// Swift의 대입 연산자는 값을 반환하지 않음
if x = y {
    // This is not valid, because x=y does not return a value
}

// 4. 산술 연산자
1 + 2
5 - 3
2 * 3
10.0 / 2.5
// 덧셈 연산자는 String 연결도 지원
"hello, " + "world"

// 5. 나머지 연산자
// a % b : a안에 들어갈 b의 배수가 몇인지를 계산하고 남은 값(나머지)을 반환
9 % 4 // equals 1
-9 % 4 // equals -1
// -> a에 음수 이용 가능, b에 음수는 무시

// 6. 단항 뺄셈 연산자
let three = 3
let minusThree = -three
let plusThree = -minusThree

// 7. 단항 덧셈 연산자
let minusSix = -6
let alsoMinusSix = +minusSix

// 8. 복합 대입 연산자
var a = 1
a += 2

// 9. 비교 연산자
1 == 1 //true
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1 //false
//if 구문에서도 사용
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// 튜플 비교(같은 타입, 같은 갯수의 값을 가지고 있을 때)
(1, "zebra") < (2, "apple") // true - 1 is less than 2  compared
(3, "apple") < (3, "bird")  // true - 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")    // true - 4 is equal to 4, and "dog" is equal to "dog"
("blue", -1) < ("purple", 1)        // true
("blue", false) < ("purple", true)  // Error! < can't compare Boolean values

// 10. 삼항 조건 연산자
//question ? answer1 : answer2
// 아래의 코드를 줄여서 표현한 것
/* if question {
       answer1
   } else {
       answer2
   }*/
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// 위 코드는 아래 코드와 같음
let contenHeight = 40
let hasHeader = true
let rowHeight: Int
if hasHeader {
    rowHeight = contenHeight + 50
} else {
    rowHeight = contenHeight + 20
}

// 11. Nil-결합 연산자
// nil-결합 연산자(a ?? b)는 옵셔널 a에 값이 있으면 a를 풀거나, a가 nil이면 기본값 b를 반환
// 표현식 a는 항상 옵셔널 타입
a != nil ? a! : b
//위 코드는 a 가 nil 이 아닐경우 a 안에 래핑된 값을 접근하기 위해 강제 언래핑(a!) 하며 a 가 nil 일 경우 b 를 반환
//아래 예제는 기본 컬러 이름과 옵셔널 사용자가 정의한 컬러 이름 중 선택하기 위해 nil-결합 연산자를 사용
let defaultColorName = "red"
var userDefinedColorName: String? //defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
//userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
userDefinedColorName = "green"
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is not nil, so colorNameToUse is set to "green"

// 12. 범위 연산자
// 1) 닫힌 범위 연산자
// 닫힌 범위 연산자(a...b)는 값 a와 b가 포함된 a부터 b까지의 범위 실행을 정의, a값은 b보다 클 수 X
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 2) 반열림 범위 연산자
// 반-열림 범위 연산자 (half-open range operator) (a..<b)는 b 가 포함되지 않은 a 부터 b 까지의 범위 실행을 정의
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i+1) is called \(names[i])")
}
// 3) 단-방향 범위 연산자
// 연산자가 오직 한쪽의 값만 가지고 있음 -> 한방향으로 계속되는 범위에 대한 대체 형식
for name in names[2...]{print(name)}
for name in names[...2]{print(name)}
for name in names[..<2]{print(name)}
let range = ...5
range.contains(7) //false
range.contains(-1) //true

// 13. 논리 연산자
// 논리적 NOT(!a), 논리적 AND(a && b), 논리적 OR(a || b)
// 1) NOT : true를 false로, false를 true로!
let allowedEntry = false
let !allowedEntry { print("ACCESS DENIED") } // 출력됨
// 2) AND : 두 값중 하나라도 false이면 false
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED") // prints "ACCESS DENIED"
}
// 3) OR : 두 값증 하나라도 true면 true
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!") // print "Welcome!"
} else {
    print("ACCESS DENIED")
}

// 논리적 연산자 결합
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!") // prints "Welcome!"
} else {
    print("ACCESS DENIED")
}
// 명시적 소괄호
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!") // Prints "Welcome!"
} else {
    print("ACCESS DENIED")
}

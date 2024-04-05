import UIKit
//연산자는 단항, 이항, 삼항
//단항 접두사 연산자 !b, 단항 접미사 연산자 c!
//이항 연산자 2+3    여기서 +는 중위 연산자, 1과 2는 피연산자
//삼항 연산자 a?b:c

/*대입 연산자*/
let b = 10
var a = 5
a = b
let (x, y) = (1, 2)
/*
 에러남, ==이 와야 할 자리에 대입연산자가 있음
if x = y {
    // This is not valid, because x = y does not return a value.
}
*/

/*산술 연산자*/
1 + 2
5 - 3
2 * 3
10.0 / 2.5
"hello, " + "world"

/*나머지 연산자*/
9 % 4
-9 % 4 //음수여도 결과는 같다

/*단항 뺄셈 연산자*/
let three = 3
let minusThree = -three
let plusThree = -minusThree

/*단항 덧셈 연산자*/
let minusSix = -6
let alsoMinusSix = +minusSix //값 그대로 반환

/*복합 대입 연산자*/
var c = 1
c += 2

/*비교 연산자*/
1 == 1 //Bool값 반환
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
//튜플값 비교
(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")
("blue", -1) < ("purple", 1)
//("blue", false) < ("purple", true)    비교할 수 없으므로 error

/*삼항 조건 연산자*/
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

/*Nil-결합 연산자*/
//a != nil ? a! : b     이 코드를 짧게 표현
let defaultColorName = "red"
var userDefinedColorName: String? //nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName //colorNameToUse=green

/*범위 연산자*/
/*닫힌 범위 연산자*/
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
/*반-열림 범위 연산자*/
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
/*단-방향 범위*/
for name in names[2...] {
    print(name)
}
for name in names[...2] {
    print(name)
}
//반-열림 연산자를 이용한 단-방향 형식 사용
for name in names[..<2] {
    print(name)
}
let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1) //true

/*논리 연산자*/
/*논리적 NOT 연산자*/
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
/*논리적 AND 연산자*/
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
/*논리적 OR 연산자*/
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
/*논리적 연산자 결합*/
//논리 복합식은 왼쪽부터 오른쪽으로 판단함
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
/*명시적 소괄호*/
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

import UIKit

/*대입 연산자*/
let b = 10
var a = 5
a = b

let (x,y) = (1, 2)

/*if x = y
{
    
}
이건 성립하지 않는다. ==이 사용될 곳에 =이 사용되는 것 방지*/

/*산술연산자*/
// swift는 오버플로우 되는 것을 허락하지 않는다. + string연결도 지원한다.

/*비교연산자*/
a == b
a != b
a > b
a < b
a >= b
a <= b
// true인지 아닌지 bool값 반환

let name = "world"
if name == "world"
{
    print("hello, world")
}
else
{
    print("I'am sorry \(name), but I don't recognize you")
}
// 비교연산자는 If문에 자주 사용됨. 위의 결과값은 hello, world


(1, "zebra") < (2, "apple")
// 튜플도 비교가능함. 대신, (string, bool)타입은 비교할 수 없다.


/*삼항 조건 연산자*/

/*
if question
{
    answer1
}
else
{
    answer2
}
이것과 삼항 조건 연산자는 같은 의미이다*/

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// 결과는 rowHeight는 90


/*Nil 결합 연산자*/

//a != nil ? a! : b
// a가 nil이 아니면, a안에 래핑된 값을 접근하기 위해 강제 언래핑, a가 nil이면 b를 반환.

let defaultcolorName = "red"
var userdefinedColorNmae: String?

var colorNametouse = userdefinedColorNmae ?? defaultcolorName
// user~는 옵셔널 string으로 정의되고 nil이기 때문에 "red"의 값 반환한다.

/*범위 연산자*/
for index in 1...5
{
    print("\(index) times 5 is \(index * 5)")
    
}


/*반-열림 범위 연산자*/
let names = ["Anna", "Alex", "Brain", "jack"]
let count = names.count
for i in 0..<count
{
    print("Person \(i + 1) is called \(names[i])")
}
// a..<b의 뜻은 a이상 b미만 count=4
//person 1 is called Anna
//person 2 is called Alex
//person 3 is called Brain
//person 4 is called Jack



/*단방향 범위*/
for name in names[2...]
{
    print(name)
}
// Brain Jack > 인덱스 2에서 배열의 끝까지
for name in names[...2]
{
    print(name)
}
// Anna Alex Brain >인덱스 2까지

for name in names[..<2]
{
    print(name)
}
// Anna
// Alex

let range = ...5
range.contains(7)//false
range.contains(4)//true
range.contains(-1)//true


/*논리 연산자
NOT !a
AND a && b
OR a || b
*/

let allowedEntry = false
if !allowedEntry
{
    print("ACCESS DENIED")
}


let enteredDoorCode = true
let passedRetinascan = false
if enteredDoorCode && passedRetinascan
{
    print("Welcome!")
} else
{
    print("ACCESS DENIED")
}
// 2개다 true일때  OR || 이면 하나만
// A && B || C || D || E 이런식으로 되어있으면, A and B, C,D,E 이런 경우 true
// 그래서 (A && B) || C || D || E 읽기쉽게 변경한다.


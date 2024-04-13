import UIKit

// 1. 문자열 리터럴
// 문자열 리터럴 = 쌍타옴표로 둘러싸인 문자의 연속
let someString = "Some string literal value"

// 1) 여러줄 문자열 리터럴(여는 따옴표 (""") 다음 줄부터 시작하고 닫는 따옴표의 이전 줄로 끝)
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

//여러줄 문자열 리터럴에서 줄 바꿈을 원할 때 -> \
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

// 시작 또는 끝에 빈 줄을 추가하고 싶다면 -> 추가하면 된다!
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""

// 2) 문자열 리터럴 특수문자
// \0 : null, \" : 쌍따옴표, \' : 홀따옴표, \\ : 역슬래시, \u{n}로 쓰여진 임의의 유니코드 스칼라 값
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}" // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}" // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""

// 3) 확장된 문자열 구분 기호
// 아무런 영향없이 문자열에 특수 문자를 포함하기 위해 확장된 구분기호 안에 문자열 리터럴을 위치할 수 있다.
// 문자열을 따옴표 (")로 둘러싸고 숫자 기호(#)로 둘러싼다 -> #"Line 1\nLine 2"#
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

// 2. 빈 문자열 초기화
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}

// 3. 문자열 변경
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
constantString += " and another Highlander"
//-> 오류 상수는 변경될 수 없음

// 4. 문자열은 값 타입

// 5. 문자 작업
//문자열과 for-in 루프로 String의 각각의 Character 값에 접근할 수 있다
for character in "Dog!" {
    print(charater)
}

let exclamationMark: Character = "!"
// -> 하나의 문자 문자열 리터럴을 Character 차입을 명시하여 단독의 Character 상수 또는 변수 생성 가능

// String 값은 초기화 인수로 Character 값의 배열을 전달해 생성 가능
let catCharacters: [Character] = ["C", "a", "t", "!"]
let catString = String(catCharacters)
print(catString)

// 6. 문자열과 문자연결
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

//String 타입의 append() 메서드
let exclamationMark: Character = "!"
welcome.append(exclamationMark)

// 여러줄 문자열 리터럴을 이용하여 긴 문자열의 라인을 구성하는 경우 문자열 매 라인 끝에 공백이 포함되길 원합니다.
let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
// Prints two lines:
// one
// twothree

let goodStart = """
one
two

"""
print(goodStart + end)
// Prints three lines:
// one
// two
// three

// 7. 문자열 삽입
// 문자열 삽입 : 상수, 변수, 리터럴, 그리고 문자열 리터럴에 값이 포함된 표현식을 혼합해 새로운 String 값을 생성하는 방법
// 문자열 리터럴에 추가하는 방법은 역슬래시 (\) 접두사에 소괄호를 감싸서 추가
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// 확장된 문자열 구분기호를 사용하여 문자열 삽입으로 사용할 문자를 포함하는 문자열을 생성할 수 있다.
print(#"Write an interpolated string in Swift using \(multiplier)."#)
// Prints "Write an interpolated string in Swift using \(multiplier)."

// 확장된 구분기호를 사용하는 문자열에서 문자열 삽입을 사용하기 위해 문자열의 시작과 끝에 숫자 기호의 개수만큼 역슬래시 다음에 숫자 기호를 넣어주면 됩니다.
print(#"6 times 7 is \#(6 * 7)."#)
// Prints "6 times 7 is 42."

// 8. 유니코드
// 1) 유니코드 스칼라 값
// 2) 확장된 문자소 클러스터


// 9. 문자 카운팅
// 문자열에서 Character 값의 카운트를 구하려면 문자열에서 count 프로퍼티를 사용
let unusalMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusalMenagerie has \(unusalMenagerie.count) charaters")

var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{201}"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"

// 10. 문자열 접근과 수정
// 1) 문자열 인덱스
// Swift 문자열은 정수값으로 인덱스를 생성할 수 없다.
// String 의 첫번째 Character 에 접근하기 위해 startIndex 프로퍼티를 사용
// endIndex 프로퍼티는 String 에 마지막 문자의 다음 위치 -> 서브 스크립트에서 유효한 인수 X
// index(before:) 와 index(after:) 를 사용하여 주어진 인덱스의 전과 후에 접근 가능
// 주어진 인덱스에서 먼 인덱스에 접근하려면 이러한 메서드를 여러번 호출하는 대신 index(_:offsetBy:) 메서드를 사용
let greeting = "Guten Tag!"
greeting[greeting.startIndex] //G
greeting[greeting.index(before: greeting.endIndex)] //!
greeting[greeting.index(after: greeting.startIndex)] //u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index] //a

//문자열 범위에 벗어나는 인덱스로 접근 -> 런타임 에러
greeting[greeting.endIndex] //Error
greeting.index(after: greeting.endIndex) //Error

// indices 프로퍼티 : 문자열에 있는 개별 문자의 모든 인덱스에 접근
for index in greeting.indices {
    print("\(greeting[index])", terminator: "") //Prints "G u t e n   T a g ! "
}

// 2) 삽입과 삭제
// 문자열에 특정 인덱스에 하나의 문자를 삽입하려면 insert(_:at:) 메서드를 사용
// 다른 문자열의 콘텐츠를 특정 인덱스에 삽입하려면 insert(contentsOf:at:) 메서드를 사용
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex) //hello!
welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex)) // hello there!

// 문자열에 특정 인덱스에 있는 하나의 문자를 삭제하려면 remove(at:) 메서드를 사용
// 특정 범위의 부분 문자열을 삭제하려면 removeSubrange(_:) 메서드를 사용
welcome.remove(at: welcome.index(before: welcome.endIndex)) // hello there
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

// 11. 부분 문자열(Substrings)
let greet = "Hello, world!"
let index2 = greet.firstIndex(of: ",") ?? greet.endIndex
let beginning = greet[..<index] // beginning is "Hello"

let newString = String(beginning)

// 12. 문자열 비교
// 1) 문자열과 문자 동등성
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// 확장된 문자소 클러스터는 다른 유니코드 스칼라로 구성되어 있더라도 언어적 의미와 모양이 같으면 정규적으로 같다
// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

//모양이 같아도 언어적 의미가 같지 않으면, 같지 않다
let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}

// 2) 접두사와 접미사 동등성
// 문자열의 hasPrefix(_:) 와 hasSuffix(_:) 메서드 활용
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's namsion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"

// 13. 문자열의 유니코드 표현
//UTF-8 표현
let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("") //Prints "68 111 103 226 128 188 240 159 144 182 "
//UTF-16 표현
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("") // Prints "68 111 103 8252 55357 56374 "
//유니코드 스칼라 표현
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "
for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶

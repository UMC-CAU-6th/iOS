import UIKit

/*문자열 리터럴(String Literals)*/
let someString = "Some string literal value"
/*여러줄 문자열 리터럴*/
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
//둘이 똑같음
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
//줄바꿈이 문자열의 값의 일부가 되는걸 원치 않을 때 \ 사용
let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""
//빈 줄 추가
let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
/*문자열 리터럴에 특수 문자*/
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"        // $
let blackHeart = "\u{2665}"      // ♥
let sparklingHeart = "\u{1F496}" //💖
let threeDoubleQuotationMarks = """
Escaping the first quotation mark \"""
Escaping all three quotation marks \"\"\"
"""
/*확장된 문자열 구분기호*/
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

/*빈 문자열 초기화*/
var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("Nothing to see here")
}
/*문자열 변경*/
var variableString = "Horse"
variableString += " and carriage"
/*
상수는 변경할 수 X
let constantString = "Highlander"
constantString += " and another Highlander"
*/

/*문자열은 값 타입*/
//Swift의 String 타입은 값 타입(value type)

/*문자 작업*/
for character in "Dog!🐶" {
    print(character)
}
let exclamationMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

/*문자열과 문자 연결*/
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
var instruction = "look over"
instruction += string2
//append() 메서드 사용
welcome.append(exclamationMark)
let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
let goodStart = """
one
two

"""
print(goodStart + end)

/*문자열 삽입*/
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(#"Write an interpolated string in Swift using \(multiplier)."#)
print(#"6 times 7 is \#(6 * 7)."#)

/*유니코드(Unicode)*/
//Swift의 기본 String 타입은 유니코드 스칼라 값(Unicode scalar values)으로부터 생성
/*확장된 문자소 클러스터*/
let eAcute: Character = "\u{E9}"
let n1: Character = "\u{65}"
let combinedEAcute: Character = "\u{65}\u{301}"
let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
let n2: Character = "\u{1F1FA}"
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

/*문자 카운팅*/
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
//확장된 문자소 클러스터 사용은 문자열의 연결과 수정은 문자열의 문자 카운트에 영향을 주지 않음
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.count)")

/*문자열 접근과 수정*/
/*문자열 인덱스*/
let greeting = "Guten Tag!"
greeting[greeting.startIndex] // G
greeting[greeting.index(before: greeting.endIndex)] // !
greeting[greeting.index(after: greeting.startIndex)] // u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index] // a
/*
문자열 범위에 벗어나는 인덱스로 접근하거나 문자열 범위에 벗어나는 인덱스의 Character 를 접근하려고 하면 런타임 에러가 발생
greeting[greeting.endIndex]
greeting.index(after: greeting.endIndex)
*/
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
/*삽입과 삭제*/
//삽입: insert(_:at:) 메서드, insert(contentsOf:at:) 메서드
var welcome2 = "hello"
welcome2.insert("!", at: welcome2.endIndex)
welcome2.insert(contentsOf: " there", at: welcome2.index(before: welcome2.endIndex))
//삭제: remove(at:) 메서드, removeSubrange(_:) 메서드
welcome2.remove(at: welcome2.index(before: welcome2.endIndex))
let range = welcome2.index(welcome2.endIndex, offsetBy: -6)..<welcome2.endIndex
welcome2.removeSubrange(range)

/*부분 문자열(Substrings)*/
let greeting2 = "Hello, world!"
let index2 = greeting2.firstIndex(of: ",") ?? greeting2.endIndex
let beginning = greeting2[..<index2]
let newString = String(beginning)

/*문자열 비교*/
/*문자열과 문자 동등성*/
let quotation2 = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation2 == sameQuotation {
    print("These two strings are considered equal")
}
//다른 유니코드 스칼라로 구성되어 있더라도 언어적 의미와 모양이 같으면 같다고 판단
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
//모양은 같지만 언어적 의미가 같지 않은 경우, 다르다고 판단
let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}
/*접두사와 접미사 동등성*/
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
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

/*문자열의 유니코드 표현*/
let dogString = "Dog‼🐶"
/*UTF-8 표현*/
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
/*UTF-16 표현*/
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
/*유니코드 스칼라 표현*/
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}

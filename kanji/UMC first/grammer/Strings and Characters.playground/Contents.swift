import UIKit

/*문자열 리터럴*/
let someString = "Some string literal value"

let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

print(quotation)

/*문자열 리터럴에 특수문자*/

let wisewords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarsign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

// \\, \", \', \u{} 등 특수문자 사용가능



/*확장된 문자열 구분기호*/


/*빈 문자열 초기화*/
var emptystring = ""
var anotherEmptyString = String()

if emptystring.isEmpty
{
    print("Nothing to see here")
}

/*문자열 변경*/
var variablestring = "Horse"
variablestring += " and carriage"
//variablestring은 Horse and carriage

/*문자 작업*/
for character in "Dog!"
{
    print(character)
}
//D
//O
//G
//!


let catcharacters: [Character] = ["C", "a", "t"]
let catstring = String(catcharacters)
print(catstring)
// Cat



/*문자열 삽입*/
let multiplier = 3
let message = "\(multiplier) times 2.5"


/*문자열 접근과 수정*/

let greeting = "Guten tag!"
greeting[greeting.startIndex]
//G
greeting[greeting.index(before: greeting.endIndex)]

//!
greeting[greeting.index(after: greeting.startIndex)]
//u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
//a

/* Error
greeting[greeting.endIndex]
greeting.index(after: greeting.endIndex)
*/

for index in greeting.indices
{
    print("\(greeting[index])", terminator: "")
}
// G u t e n  T a g !


/*삽입과 삭제*/

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: "there", at: welcome.index(before: welcome.endIndex))
// 위는 하나의 문자, 아래는 다른 문자열을 삽입

welcome.remove(at: welcome.index(before: welcome.endIndex))

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex; welcome.removeSubrange(range)

// 위는 하나의 문자 삭제, 아래는 문자열 삭제





import UIKit
//배열, 집합, 딕셔너리
//변수에 할당하면 변경 가능, 상수에 할당하면 불가변성

/*배열(Arrays)*/
//순서대로 같은 타입의 값을 저장
var someInts: [Int] = [] //Array<Int> 로 타입명 작성 가능
print("someInts is of type [Int] with \(someInts.count) items.")
someInts.append(3)
someInts = [] //다시 빈 배열
/*기본값 배열 생성(배열 초기화)*/
var threeDoubles = Array(repeating: 0.0, count: 3) //0.0 3번 반복
/*배열을 더해 생성*/
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
/*배열 리터럴로 생성*/
//작성하는 방법 [<#value 1#>, <#value 2#>, <#value 3#>]
var shoppingList: [String] = ["Eggs", "Milk"]
//var shoppingList = ["Eggs", "Milk"]   타입 추론이 가능하므로 타입 명시하지 않아도 됨
/*배열의 접근과 수정*/
print("The shopping list contains \(shoppingList.count) items.") //Array.count
//Array.isEmpty
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
shoppingList.append("Flour") //Array.append
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
var firstItem = shoppingList[0] //배열 값 가져오기
shoppingList[0] = "Six eggs" //배열 값 변경
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.insert("Maple Syrup", at: 0) //특정 인덱스의 값 추가
let mapleSyrup = shoppingList.remove(at: 0) //배열 삭제
let apples = shoppingList.removeLast()
/*배열 반복*/
for item in shoppingList {
    print(item)
}
//인덱스 값을 사용한 반복
//Array.enumerateed()   정수와 아이템을 조합하여 튜플로 반환하는 메서드
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

/*집합(Sets)*/
//콜렉션에 순서와 상관없이 같은 타입의 다른 값을 저장
/*빈 집합 생성과 초기화*/
//생성
var letters = Set<Character>() //타입 정의 Set<Element>
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
letters = [] //다시 빈 집합
/*배열 리터럴로 집합 생성*/
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]    하나의 타입값만 사용한다면 타입 명시안해도 됨
/*집합 접근과 수정*/
//갯수
print("I have \(favoriteGenres.count) favorite music genres.")
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
//생성
favoriteGenres.insert("Jazz")
//삭제
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
//Set.removeAll()   아이템 전체 삭제
//특정 아이템이 포함되어 있는지 확인
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
/*집합 반복*/
for genre in favoriteGenres {
    print("\(genre)")
}
//정렬
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

/*집합 연산 수행*/
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sorted() //a.union(b) 메서드 : a||b
oddDigits.intersection(evenDigits).sorted() //a.intersection(b) 메서드 : a&&b
oddDigits.subtracting(singleDigitPrimeNumbers).sorted() //a.subtracting(b) 메서드 : a-b
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() 
//a.symmetricDifference(b) 메서드 : (a||b)-(a&&b)
/*집합 멤버십과 동등성*/
//초집합, 부분집합, 분리집합
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubset(of: farmAnimals) //a.isSubset(of:b) a가 b의 부분집합인지
farmAnimals.isSuperset(of: houseAnimals) //a.isSuperset(of:b) b가 a의 초집합인지
farmAnimals.isDisjoint(with: cityAnimals) //a.isDisjoint(with:b) a가 b의 분리집합인지

/*딕셔너리(Dictionaries)*/
//순서와 상관없이 콜렉션에 같은 타입의 키(key)와 같은 타입의 값(value)를 저장
/*빈 딕셔너리 생성*/
var namesOfIntegers = [Int: String]() //Dictionary<Key, Value>
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:] //빈 딕셔너리 생성
/*딕셔너리 리터럴로 딕셔너리 생성*/
//[<#key 1#>: <#value 1#>, <#key 2#>: <#value 2#>, <#key 3#>: <#value 3#>]
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
/*딕셔너리 접근과 수정*/
//갯수 확인
print("The airports dictionary contains \(airports.count) items.")
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
//아이템 추가, 변경
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
//특정 값 업데이트, 업데이트 수행 후에 이전 값 반환
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
//특정 키로 딕셔너리 값 가져오기
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
//값 삭제
airports["APL"] = "Apple International"
airports["APL"] = nil
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
/*딕셔너리 반복*/
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
//key, value 프로퍼티 이용
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
for airportName in airports.values {
    print("Airport name: \(airportName)")
}
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

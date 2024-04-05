import UIKit

/*콜렉션의 가변성*/
//배열, 집합, 딕셔너리를 생성하고 변경 가능하다

//배열
var someints: [Int] = []
print("someInts is of type [int] with \(someints.count)items")
//someInts is of type [Int] with 0 items

someints.append(3)
// int타입 값 하나 포함

/*기본값 배열 생성*/
var threeDoubles = Array(repeating: 0.0, count: 3)

//[0.0, 0.0, 0.0]

var anotherDoubles = Array(repeating: 2.5, count: 3)
// 배열끼리 더하면 [0.0 0.0 0.0 2.5 2.5 2.5]

var shoppingList: [String] = ["Eggs", "Milk"]

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
//기존에 있던 것에 추가

shoppingList[4...6] = ["Bananas", "Apples"]
//chocolate Spread, Cheese를 위의 것으로 바꾸기

shoppingList.insert("Maple Syrup", at: 0)
// 추가
let mapleSyrup = shoppingList.remove(at: 0)
// 삭제하고 반환


/*배열 반복*/
for item in shoppingList
{
    print(item)
}

for (index, value) in shoppingList.enumerated() 
{
    print("Item \(index + 1): \(value)")
}


/*집합*/
var letters = Set<Character>()
print("letters is of type set<Chracter> with \(letters.count) items")
// 빈 집합 생성과 초기화

letters.insert("a")
letters = []
//letters는 empty set이지만, 자료형은 set<Character>

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//string값 저장하는 집합

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")
//추가

let removedGenre = favoriteGenres.remove("Rock")
//삭제 및 반환, 만약 없으면 nil값 반환

/*집합 반복*/
for genre in favoriteGenres
{
    print("\(genre)")
}

/*기본집합연산*/
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
//[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
//[]
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
//[1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
//[1, 2, 9]

//intersection(): 공통값
//symmetricDifference: 공통값 제외
//union : 두집합 전체합
//subtracting: 특정집합의 공통집합 제외



/*딕셔너리*/
var namesofIntegers = [Int: String]()

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
//3글자 국제 운송협회 : 공항이름 으로 딕셔너리 생성

airports["LHR"] = "London"
//새로운 아이템 추가

airports["APL"] = "Apple International"
airports["APL"] = nil
//nil값을 넣어 삭제

if let removedValue = airports.removeValue(forKey: "DUB") 
{
    print("The removed airport's name is \(removedValue).")
} else 
{
    print("The airports dictionary does not contain a value for DUB.")
}
// 만약 키-값 쌍이 존재하면 삭제하고 반환 or 존재하지 않으면 nil반환


for (airportCode, airportName) in airports
{
    print("\(airportCode): \(airportName)")
}
//딕셔너리 반복

for airportCode in airports.keys 
{
    print("Airport code: \(airportCode)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
//Array 인스턴스의 API를 사용해야 할 경우 keys or value로 새로운 배열을 초기화해라.

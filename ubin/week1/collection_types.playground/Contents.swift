import UIKit

// 콜렉션 타입
// 배열, 집합, 그리고 딕셔너리
// 콜렉션의 가변성
// 1. 배열 -> 순서대로
// 1) 빈 배열 생성
var someInts: [Int] = []
print("someInts is of type [int] with \(someInts.count) items.")
someInts.append(3) //now contains 1 value
someInts = [] // now an empty array, but still type of [Int]

// 2) 기본값 배열 생성
var threeDoubles = Array(repeating: 0.0, count: 3) //type [Double], and equals [0.0, 0.0, 0.0]

// 3) 배열을 더해 생성 -> 동일하 타입 +
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// 4) 배열 리터럴로 생성 -> [<#value 1#>, <#value 2#>, <#value 3#>]
var shoppingList: [String] = ["Eggs", "Milk"]
// 타입 추론 -> 초기화하면 배열의 타입 명시할 필요 X
var shoppingList2 = ["Eggs", "Milk"]

// 5) 배열 접근과 수정
// count
print("The shopping list contains \(shoppingList.count) items.")

// isEmpty
if shoppingList.isEmpty {
    print("empty")
} else {
    print("not empty")
}

// append(_:)
shoppingList.append("Flour")

// +=
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

// 인덱스
var firstItem = shoppingList[0]
// 값 변경 가능
shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas", "Apples"] //shoppingList now contains 6 items

// 특정 인덱스에 아이템 추가 -> insert()
shoppingList.insert("Maple Syrup", at: 0)
// 아이템 삭제 -> remove()
let mapleSyrup = shoppingList.remove(at: 0)
//아이템이 삭제되면 배열의 공간도 삭제 -> 인덱스0인값은 "Six eggs"
firstItem = shoppingList[0] //Six eggs

// 배열의 마지막 아이템 삭제 -> remove()보다 removeLast()
let apples = shoppingList.removeLast()

// 6) 배열 반복
for item in shoppingList { print(item) }
// 값의 인덱스도 필요하다면 -> enumerated()
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}


// 2. 집합 -> 순서 상관 X
// 집합에 저장하기 위한 타입은 반드시 hashable! Swift의 모든 기본타입은 기본적으로 hashable
// 1) 빈 집합 생성 및 초기화
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a") // now contains 1 value
letters = [] // now empty set

// 2) 배열 리터럴로 집합 생성
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// 집합 타입은 배열 리터럴에서 추론할 수 없기 때문에, Set 타입은 명시적으로 선언해야함!!
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]

// 3) 집합 접근과 수정
// count
print("I have \(favoriteGenres.count) favorite music genres.")

//isEmpty
if favoriteGenres.isEmpty {
    print("empty")
} else {
    print("not empty")
}

// insert()
favoriteGenres.insert("Jazz")

// remove()
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

// contain() : 집합에 특정 아이템이 포함되어 있는지 알 수 있습니다.
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

// 4) 집합 반복
for genre in favoriteGenres {
    print("\(genre)")
}
// 집합은 순서X 특정 순서를 적용하려면 -> sorted()
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

// 5) 집합 연산 수행
// intersection(_:) 메서드를 사용하면 두 집합의 공통 값을 가지는 새로운 집합을 생성합니다.
// symmetricDifference(_:) 메서드를 사용하면 두 집합의 공통 값을 제외한 새로운 집합을 생성합니다.
// union(_:) 메서드를 사용하면 두 집합의 모든 값으로 새로운 집합을 생성합니다.
// subtracting(_:) 메서드를 사용하면 특정 집합의 공통 값을 제외한 새로운 집합을 생성합니다.
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted() //[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted() //[]
oddDigits.subtracting(singleDigitPrimeNumbers).sorted() //[1,9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() //[1,2,9]

// 6) 집합 멤버십과 동등성
// 두 집합이 같은 값을 모두 포함하고 있는지 판단하려면 "같음" 연산자 (==)를 사용
// isSubset(of:) : 집합이 특정 집합에 모든 값이 포함되어 있는지 판단합니다.
// isSuperset(of:) : 집합에 특정 집합에 모든 값을 포함 하는지 판단합니다.
// isStrictSubset(of:), isStrictSuperset(of:) : 집합이 특정 집합과 같지 않고 부분집합인지 초집합인지 판단합니다.
// isDisjoint(with:) : 두 집합이 공통 값이 없는지 판단합니다.
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals) //true
farmAnimals.isSubset(of: houseAnimals) //true
farmAnimals.isDisjoint(with: cityAnimals) //true


// 3. 딕셔너리 -> 순서와 상관없이 콜렉션에 같은 타입의 키 (key)와 같은 타입의 값 (value)를 저장
// 1) 빈 딕셔너리 생성
var nameOfIntegers = [Int: String]()
nameOfIntegers[16] = "sixteen"
nameOfIntegers = [:] //empty dictionary of type [Int:String]
// -> 컨텍스트가 이미 타입 정보를 제공한다면 [:] 로 빈 딕셔너리를 생성 가능

// 2) 딕셔너리 리터롤로 딕셔너리 생성 -> [<#key 1#>: <#value 1#>, <#key 2#>: <#value 2#>, <#key 3#>: <#value 3#>]
var airports: [String:String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// 딕셔너리 리터럴로 초기화하는 경우, 딕셔너리 타입을 작성할 필요X(배열과 마찬가지)
var airports2 =["YYZ": "Toronto Pearson", "DUB": "Dublin"]

// 3) 딕셔너리 접근과 수정
// count
print("The airports dictionary contains \(airports.count) items.")

//isEmpty
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

//딕셔너리에 새로운 아이템 추가
airports["LHR"] = "London"
//변경 가능
airports["LHR"] = "London Heathrow"

//updateValue() : 특정 키에 값을 설정하거나 업데이트, 업데이트 수행 후에 이전 값을 반환
// 딕셔너리의 값 타입의 옵셔널 값을 반환 -> 해당 키에 존재한 업데이트 전의 값 또는 존재한 값이 없었을 때는 nil 을 포함
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// 서브 스크립트 구문도 사용 가능
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

// 삭제 : 딕셔너리의 해당 키에 nil 값을 할당하여 키-값 쌍을 서브 스크립트 구문을 사용
airports["APL"] = "Apple International"
airports["APL"] = nil //APL has now been removed from the dictionary
// removeValue() 메서드도 사용 가능 -> 키-값 쌍이 존재하면 삭제 or 삭제된 값을 반환 / 값이 존재하지 않으면 nil 반환

// 4) 딕셔너리 반복
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// 딕셔너리의 키 또는 값을 Array 인스턴스의 API를 사용해야 할 경우 keys 또는 values 프로퍼티로 새로운 배열을 초기화
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

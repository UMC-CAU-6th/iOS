import UIKit


/*에러 처리*/
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

//enum으로 에러의 조건 열거 > throw로 에러 발생

//swift에서 에러처리를 하는 방법
/*
 1. 해당 함수를 호출하는 코드로 에러를 전파
 2. do- catch구문
 3. 옵셔널 값으로 에러를 처리 Or 에러가 발생하지 않을 것이라고 주장한다.
 */


/*던지기 함수를 이용한 에러 전파*/
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    //딕셔너리 설정
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}



/*Do-catch를 이용한 에러처리*/
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}

//try:예외가 발생할 수 있음 > catch를 사용해 예외를 처리함.
//여러 케이스에 대해 catch를 사용한다.


/*에러를 옵셔널 값으로 변환*/
func someThrowingFunction() throws -> Int {
    // ...
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}


/*정리 작업 지정*/
func processFile(filename: String) throws {
    if exists(filename){
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
        }
    }
}

//close(file)를 defer블록에 저장하며 파일이 열려있는 동안 사용되고 함수범위가 종료될때 닫힌다.

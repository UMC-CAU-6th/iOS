import UIKit

/*옵셔널 체이닝*/
//nil일수도 있는 옵셔널 프로퍼티, 메서드를 호출하기 위한 프로세스

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

//let roomCount = john.residence!.numberOfRooms
// 강제 언래핑을 하면 error

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

//옵셔널을 사용해서 존재하면 출력하고 존재하지 않으면 다른 값이 나오도록 한다.


/*옵셔널 체이닝에 대한 모델 클래스 정의*/


class Residence {
    var rooms: [Room] = []
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

//여기서 number은 room의 배열의 count 프로퍼티 값 반환.



/*옵셔널 체이닝을 통해 프로퍼티 접근*/
let Hohn = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress
// 옵셔널 체이닝을 통해 프로퍼티 값 설정 가능


//옵셔널 체이닝을 통한 함수 호출
if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}


/*옵셔널 반환값으로 메서드 체이닝*/
if let beginsWithThe =
    john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
// residence, address가 nil이 아닐경우 building메서드 호출하여 옵셔널로 반환, building이 nil이 아닌 경우에만 hasprefix메서드를 호출하여 the로 시작하는지 여부를 불리언으로 반환한다.


import UIKit


/*프로토콜*/
/*
프로토콜은 특정 기능을 제공하는데 필요한 메서드 및 프로퍼티의 요구사항을 정의한다.
 
 
 */

/*프로토콜 구문
 protocol SomeProtocol {
    
 }
 
 struct SomeStructure: FirstProtocol, AnotherProtocol {
   
 }
 
 class SomeClass: SomeSuperclass, FirstProtocol {
    
 }
 */


/*프로퍼티 요구사항*/

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Appleseed")

// fullynamed프로토콜 채택


protocol SomeProtocol {
    static func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random() -> Double
}



class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c)
            .truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")



/*변경메서드*/
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()



/*초기화 구문 요구사항*/
protocol SomeProtocol {
    init(someParameter: Int)
}



/*프로토콜 초기화 구문 요구사항의 클래스 구현*/
class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
    }
}


/*위임*/
class DiceGame {
    let sides: Int
    let generator = LinearCongruentialGenerator()
    weak var delegate: Delegate?

    init(sides: Int) {
        self.sides = sides
    }

    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }

    func play(rounds: Int) {
        delegate?.gameDidStart(self)
        for round in 1...rounds {
            let player1 = roll()
            let player2 = roll()
            if player1 == player2 {
                delegate?.game(self, didEndRound: round, winner: nil)
            } else if player1 > player2 {
                delegate?.game(self, didEndRound: round, winner: 1)
            } else {
                delegate?.game(self, didEndRound: round, winner: 2)
            }
        }
        delegate?.gameDidEnd(self)
    }
    
    protocol Delegate: AnyObject {
        func gameDidStart(_ game: DiceGame)
        func game(_ game: DiceGame, didEndRound round: Int, winner: Int?)
        func gameDidEnd(_ game: DiceGame)
    }
}





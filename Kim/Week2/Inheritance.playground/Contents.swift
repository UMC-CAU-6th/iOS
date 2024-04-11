import UIKit

//기능을 추가 또는 재정의 하기 위한 하위 클래스
/*기본 클래스 정의(Defining a Base Class)*/
//기본 클래스(base class): 다른 클래스에서 상속하지 않은 클래스
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}
let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

/*하위 클래스(Subclassing)*/
//하위 클래스(Subclassing): 기존 클래스를 기반으로 새로운 클래스를 만드는 작업
/*
class SomeSubclass: SomeSuperclass {
    // subclass definition goes here
}
 */
class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
//하위 클래스의 하위 클래스
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

/*재정의(Overriding)*/
//재정의: 하위 클래스는 상위 클래스에 접근 후 재정의
/*상위 클래스 메서드, 프로퍼티, 그리고 서브 스크립트 접근*/
//super.someMethod(), super.somProperty, super[someIndex]로 상위 클래스에 접근
/*매서드 재정의(Overriding Methods)*/
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()
/*프로퍼티 재정의(Overriding Properties)*/
//프로퍼티 getter와 setter 재정의
//프로퍼티 재정의의 부분으로 setter를 제공하면 getter도 제공해야 함
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
//프로퍼티 관찰자 재정의
//상속된 프로퍼티의 값이 변경될 때 알림을 받을 수 있음
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

/*재정의 방지(Preventing Overrides)*/
//final 표시를 통해 실수로 메서드, 프로퍼티, 또는 서브 스크립트를 재정의 하는 것을 방지
//final var, final func, final class func, final subscript

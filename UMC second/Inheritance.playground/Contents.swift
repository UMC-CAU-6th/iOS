import UIKit


//기능을 추가 또는 재정의 하기 위한 하위 클래스
//상속은 클래스의 특성과 동작을 물려받을 수 있도록함.
// 부모 클래스
class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("Animal \(name) makes a sound")
    }
}

// 자식 클래스
class Dog: Animal {
    // 자식 클래스에서 새로운 속성 추가
    var breed: String
    
    init(name: String, breed: String) {
        self.breed = breed
        // 부모 클래스의 이니셜라이저 호출
        super.init(name: name)
    }
    
    // 부모 클래스의 메서드 오버라이딩
    override func makeSound() {
        print("Dog \(name) barks")
    }
    
    // 새로운 메서드 추가
    func fetch() {
        print("Dog \(name) fetches the ball")
    }
}

// 자식 클래스 인스턴스 생성
let myDog = Dog(name: "Buddy", breed: "Golden Retriever")

// 부모 클래스의 메서드 호출
myDog.makeSound() // 출력: "Dog Buddy barks"

// 자식 클래스의 메서드 호출
myDog.fetch() // 출력: "Dog Buddy fetches the ball"

// 부모 클래스로 타입을 지정한 변수에 자식 클래스의 인스턴스 할당
let someAnimal: Animal = Dog(name: "Rex", breed: "Labrador")
someAnimal.makeSound() // 출력: "Dog Rex barks" (다형성)


/*기본 클래스 정의*/
class Vehicle {
    var currentSpeed = 0.0
    var description: String{
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}

let someVehicle = Vehicle()


/*하위 클래스*/
class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true


bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")


/*재정의*/
//메서드 재정의
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
//vehicle을 상속한 train에 makniose() 메서드 재정의

let train = Train()
train.makeNoise()


//프로퍼티 재정의
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}


import UIKit

// 프로퍼티 : 특정 클래스, 구조체, 또는 열거형을 연결
// 저장된 프로퍼티 : 스턴스의 일부로 상수와 변수 값을 저장 -> 클래스와 구제체에 의해서만 제공
// 계산된 프로퍼티 : 값을 저장하는 대신에 계산 -> 클래스, 구조체, 그리고 열거형에 의해 제공

// 1. 저장된 프로퍼티
// 1) 가장 간단한 형식 : 특정 클래스 또는 구조체의 인스턴스의 부분으로 저장된 상수 또는 변수
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8
// -> FixedLengthRange 의 인스턴스는 firstValue 라는 저장된 프로퍼티 변수, length 라는 저장된 프로퍼티 상수 존재

// 2) 상수 구조체 인스턴스의 저장된 프로퍼티



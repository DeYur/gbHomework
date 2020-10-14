import UIKit


// Задание 1.
let equation = "2(x^2)+6x+8=0"
//Уравнение пользователя по формуле ax2 + bx + c = 0

let a = 2
let b = 6
let c = -8
let discriminant = sqrt(Double(b*b)-Double(4*a*c))

if discriminant == 0 {
    let root = Double(b*(-1)) / Double(2*a)
    print("Уравнение \(equation) имеет один корень \(root).\n")
} else if discriminant < 0 {
    print("Дискриминант меньше нуля, поэтому корней нет.\n")
} else {
    let rootOne = (Double(b*(-1)) - discriminant) / Double(2*a)
    let rootTwo = (Double(b*(-1)) + discriminant) / Double(2*a)
    print("Первый корень равен: \(rootOne)\nВторой корень равен: \(rootTwo)\n")
}


// Задание 2.
let legA = 4
let legB = 3
let area = Double(legA*legB)/2 //Написал Double, чтобы при указании других значений была видна цифра поле запятой.
let hypotenuse = sqrt((Double)(legA * legA) + (Double)(legB * legB))
let perimeter = (Double)(legB + legA) + hypotenuse

print("Площадь треугольника равна: \(area)\nПериметр треугольника равен: \(perimeter)\nДлина гипотенузы треугольника равна: \(hypotenuse)\n")


//Задание 3.
typealias Ruble = Float
typealias Rate = Float

var depositSumm : Ruble = 500000
let annualPercent : Rate = 4
var depositYear = 1

while depositYear <= 5 {
    let rate = depositSumm / 100
    let annualSumm = rate * annualPercent
    depositSumm = depositSumm + annualSumm
    depositYear += 1
}
print("Сумма вклада через 5 лет будет равна: \(depositSumm)")


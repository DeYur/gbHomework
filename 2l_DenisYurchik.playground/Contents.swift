import UIKit

//Задание 1.
var number = 11

func isEven (){
    if (number % 2 == 0){
        print("Число \(number) четное.")
    } else {
        print("Число \(number) нечетное.")
    }
}

isEven()

//Задание 2.
func isDivisible (number: Int) -> Bool {
    if (number % 3 == 0){
        print("Число \(number) делится на 3 без остатка.")
    } else {
        print("Число \(number) не делится на 3 без остатка.")
    }
    return true
}

isDivisible(number: number)

//Задание 3.
var array = [Int]()

func makeArray (){
    for numb in (1...100){
        array.append(numb)
    }
    print(array)
}

makeArray()

//Задание 4.
var index = 0

while array.count > 0 && index < array.count {
    if array[index] % 3 != 0{
        array.remove(at: index)
        index -= 1
    }
    index += 1
}

print(array)

//Задание 5. Сделал так,с Int возникала ошибка в 72-й строке, не получилось ее убрать, пришлось поменять на Decimal.
var arrayFib = [Decimal]()
arrayFib.append(0)
var n  = 100

func fibonacci (n: Int) -> (Decimal) {
     if (n < 3) {
         return 1
     } else {
         var x1 : Decimal = 1, x2 : Decimal = 1, x:Decimal
         for _ in 3...n {
             x = x1 + x2
             x1 = x2
             x2 = x
         }
         return x2
     }
 }
 for i in 1...n {
    arrayFib.append(fibonacci(n: i))
 }
 print(arrayFib)

//Задание 6. Сделал как смог))
func make (numb: Int) -> Bool {
     if numb < 2 {
         return false
     }
     for i in 2..<numb {
         if numb % i == 0 {
             return false
         }
     }
     return true
 }
func makeArraY () -> [Int] {
     var arraY = [Int]()
     var i = 2
     while arraY.count < 100 {
         if make(numb: i) {
            arraY.append(i)
         }
         i += 1
     }
     return arraY
}
print (makeArraY())

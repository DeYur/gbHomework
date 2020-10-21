import UIKit

//Задание 1-6.

enum Capacity {
    case empty, full, withOutATrailer
}
enum TruckWindows {
    case closed, opened, checkWindows
}
enum TruckEngine {
    case turnedOff, engineStarted, checkEngine
}

struct TrunkCar {
    var brandName: String
    var year: Int
    var trunkCapacity: Capacity
    var engineStatus: TruckEngine
    var windows: TruckWindows
    var truckBody: Bool
    var acceleration: Int
    var tonnage: Int
    var fuelRange: Int
    var maxSpeed: Int
    var weight: Int
    var truckLength: Int
    var numbofSeats: Int
    var wheelsSize: Int
    var horsePower: Int
    var trailer: Bool
    
    mutating func engineStatus (status: String) {
        switch engineStatus {
        case .turnedOff:
            self.engineStatus = .turnedOff
            print("Двигатель выключен.")
        case .engineStarted:
            self.engineStatus = .engineStarted
            print("Двигатель запущен.")
        default:
            self.engineStatus = .checkEngine
            print("Двигатель \(brandName) не работает. Обратитесь на ближайшую СТО.")
        }
    }
    mutating func windows (status: String) {
        switch windows {
        case .closed:
            self.windows = .closed
            print("Окна закрыты.")
        case .opened:
            self.windows = .opened
            print("Окна открыты.")
        default:
            self.windows = .checkWindows
            print("Проверьте окна \(brandName).")
        }
    }
    mutating func trunkCapacity (status: Int) {
        switch trunkCapacity {
        case .empty:
            self.trunkCapacity = .empty
            print("\(brandName) не загружен.")
        case .full:
            self.trunkCapacity = .full
            print("\(brandName) полностью загружен.")
        default:
            self.trunkCapacity = .withOutATrailer
            print("\(brandName) не имеет прицепа.")
        }
    }
}

enum CarWindows: String {
    case closed = "Окна закрыты."
    case opened = "Окна открыты."
    case checkWindows = "Проверьте окна автомобиля."
}
enum CarEngine: String {
    case turnedOff = "Двигатель выключен."
    case engineStarted = "Двигатель запущен."
    case checkEngine = "Двигатель не работает. Обратитесь на ближайшую СТО."
}
enum CarTrunkCapacity: String {
    case empty = "Багажник пуст."
    case full = "Багажник полностью загружен."
}

func describeWindows (status: CarWindows) -> String {
    return status.rawValue
}
func describeEngine (status: CarEngine) -> String {
    return status.rawValue
}
func describeTrunk (status: CarTrunkCapacity) -> String {
    return status.rawValue
}

struct SportCar {
    var brandName: String
    var year: Int
    var engineStatus: CarEngine
    var windows: CarWindows
    var trunkCapacity: CarTrunkCapacity
    var acceleration: Int
    var fuelRange: Int
    var horsePower: Int
    var maxSpeed: Int
    var engineAtTheBack: Bool
    var numbofSeats: Int
    var wheelsSize: Int
    var weight: Int
    var carLength: Int
    
    mutating func engineStatus (status: String) {
        switch engineStatus {
        case .turnedOff:
            self.engineStatus = .turnedOff
        case .engineStarted:
            self.engineStatus = .engineStarted
        case .checkEngine:
            self.engineStatus = .checkEngine
        }
    }
    mutating func windows (status: String) {
        switch windows {
        case .closed:
            self.windows = .closed
        case .opened:
            self.windows = .opened
        case .checkWindows:
            self.windows = .checkWindows
        }
    }
    mutating func trunkCapacity (status: Int) {
        switch trunkCapacity {
        case .empty:
            self.trunkCapacity = .empty
        case .full:
            self.trunkCapacity = .full
        }
    }
}


var teslaTruck = TrunkCar(brandName: "Tesla Truck", year: 2021, trunkCapacity: .withOutATrailer, engineStatus: .turnedOff, windows: .closed, truckBody: false, acceleration: 20, tonnage: 36, fuelRange: 500, maxSpeed: 150, weight: 5500, truckLength: 6, numbofSeats: 2, wheelsSize: 18, horsePower: 500, trailer: false)
var bmwM5 = SportCar(brandName: "BMW M5", year: 2020, engineStatus: .engineStarted, windows: .opened, trunkCapacity: .empty, acceleration: 4, fuelRange: 600, horsePower: 625, maxSpeed: 250, engineAtTheBack: false, numbofSeats: 4, wheelsSize: 20, weight: 2000, carLength: 5)

print("""
    BMW Connected

    Ваш BMW сейчас:
    \(describeEngine(status: (bmwM5.engineStatus)))
    \(describeWindows(status: (bmwM5.windows)))
    \(describeTrunk(status: (bmwM5.trunkCapacity)))

    Технические характеристики \(bmwM5.brandName):
    Год выпуска - \(bmwM5.year);
    Разгон от 0 до 100 км/ч - \(bmwM5.acceleration) секунд;
    Запас хода - \(bmwM5.fuelRange) км;
    Мощность двигателя - \(bmwM5.horsePower) лошадиных сил;
    Максимальная скорость - \(bmwM5.maxSpeed) км/ч;
    Допустимое количество персон в авто - \(bmwM5.numbofSeats);
    Диаметр тапок - \(bmwM5.wheelsSize) дюймов;
    Вес без учета персон - \(bmwM5.weight) килограмм;
    Длина авто - \(bmwM5.carLength) метров.
    """)

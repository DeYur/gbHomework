import UIKit

enum Action{
     //MARK:- TruckCar actions
     case load(amount: Int)
     case unload(amount: Int)
     //MARK:- Car actions
     case suspensionUp, suspensionDown
     case exhaustOpened, exhaustClosed
}
protocol Car: AnyObject {
    var brandName: String { get }
    var year: Int { get }
    var horsePower: Int { get }
    var windowOpened: Bool { get set }
    var engineTurnedOn: Bool { get set }
    var lightIsOn: Bool { get set }
}

extension Car {
    func handleWindows() {
        windowOpened = (windowOpened ? false : true)
    }
    func engineTurnedOn() {
        engineTurnedOn = (engineTurnedOn ? false : true)
    }
    func lightIsOn() {
        lightIsOn = (lightIsOn ? false : true)
    }
}

class TruckCar: Car {
    var lightIsOn: Bool
    var engineTurnedOn: Bool
    var brandName: String
    var year: Int
    var horsePower: Int
    var windowOpened: Bool
    var load: Int

    func handleAction(_ action: Action) {
        switch action {
        case .load(amount: let amount):
            self.load += amount
            print("Добавили груз в \(brandName).")
        case .unload(amount: let amount):
            if amount > self.load {
                print("Нет столько груза в \(brandName).")
            } else {
                self.load -= amount
                print("Выгрузили \(amount) из \(brandName).")
            }
        default: break
        }
    }
    init(brandName: String, year: Int, horsePower: Int, loadAmount: Int, windowOpened: Bool, engineTurnedOn: Bool, lightIsOn: Bool) {
        self.brandName = brandName
        self.year = year
        self.horsePower = horsePower
        self.load = loadAmount
        self.lightIsOn = lightIsOn
        self.engineTurnedOn = engineTurnedOn
        self.windowOpened = windowOpened
    }
}

extension TruckCar: CustomStringConvertible {
    var description: String {
        return """
            Описание \(brandName):
            Год выпуска: \(year)
            Мощность: \(horsePower) л.с.
            Загруженность: \(load) кг.
            Окна открыты: \(windowOpened)
            Двигатель заведен: \(engineTurnedOn)
            Фары включены: \(lightIsOn)
            """
    }
}

class SportCar: Car {
    var lightIsOn: Bool
    var engineTurnedOn: Bool
    var brandName: String
    var year: Int
    var horsePower: Int
    var windowOpened: Bool
    var options: Action
    
    func handleAction(_ action: Action) {
        switch action {
        case .suspensionUp:
            self.options = .suspensionUp
        case .suspensionDown:
            self.options = .suspensionDown
        case .exhaustOpened:
            self.options = .exhaustOpened
        case .exhaustClosed:
            self.options = .exhaustClosed
        default: break
        }
    }
    init(brandName: String, year: Int, horsePower: Int, windowOpened: Bool, engineTurnedOn: Bool, lightIsOn: Bool, suspension: Action, exhaust: Action) {
        self.options = suspension; exhaust
        self.brandName = brandName
        self.year = year
        self.horsePower = horsePower
        self.lightIsOn = lightIsOn
        self.engineTurnedOn = engineTurnedOn
        self.windowOpened = windowOpened
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return """
            Описание \(brandName):
            Год выпуска: \(year)
            Мощность: \(horsePower) л.с.
            Окна открыты: \(windowOpened)
            Двигатель заведен: \(engineTurnedOn)
            Фары включены: \(lightIsOn)
            Подвеска: \(sportCar)
            Выхлоп: \(options)
            """
    }
}

let truck = TruckCar(brandName: "KamaZ", year: 2005, horsePower: 300, loadAmount: 4000, windowOpened: false, engineTurnedOn: true, lightIsOn: false)
let sportCar = SportCar(brandName: "Bentley", year: 2020, horsePower: 635, windowOpened: false, engineTurnedOn: true, lightIsOn: true, suspension: .suspensionDown, exhaust: .exhaustOpened)
print("""
\(truck.description)

\(sportCar.description)
""")

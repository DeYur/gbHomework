import UIKit

enum Action{
    //MARK:- TruckCar actions
    case load(amount: Int)
    case unload(amount: Int)
    //MARK:- SportCar actions
    case suspensionUp, suspensionDown
    case exhaustOpened, exhaustClosed
}
enum EngineType {
    case engineTypeDiesel, engineTypePetrol, engineTypeElectro
}

class Car {
    var brandName: String
    var year: Int
    var horsePower: Int
    var engineType: EngineType
    
    func handleAction(_ action: Action) {}
    
    init(brandName: String, year: Int, horsePower: Int, engineType: EngineType) {
        self.brandName = brandName
        self.year = year
        self.horsePower = horsePower
        self.engineType = engineType
    }
}

class TruckCar: Car {
    var load: Int
    
    override func handleAction(_ action: Action) {
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
    init(brandName: String, year: Int, horsePower: Int, engineType: EngineType, loadAmount: Int) {
        self.load = loadAmount
        super.init(brandName: brandName, year: year, horsePower: horsePower, engineType: .engineTypeDiesel)
    }
}
class SportCar: Car {
    var options: Action
    
    override func handleAction(_ action: Action) {
        switch action {
        case .suspensionUp:
            self.options = .suspensionUp
            print("Подвеска \(brandName) поднята.")
        case .suspensionDown:
            self.options = .suspensionDown
            print("Подвеска \(brandName) опущена.")
        case .exhaustOpened:
            self.options = .exhaustOpened
            print("Заслонки \(brandName) открыты.")
        case .exhaustClosed:
            self.options = .exhaustClosed
            print("Прямоток \(brandName) закрыт.")
        default: break
        }
    }
    
    init(brandName: String, year: Int, horsePower: Int, engineType: EngineType, suspension: Action, exhaust: Action) {
        self.options = suspension; exhaust
        super.init(brandName: brandName, year: year, horsePower: horsePower, engineType: .engineTypePetrol)
    }
}

let truckCar = TruckCar(brandName: "Zil", year: 2, horsePower: 300, engineType: .engineTypeDiesel, loadAmount: 1000)
let sportCar = SportCar(brandName: "MB E63 S AMG", year: 1, horsePower: 612, engineType: .engineTypePetrol, suspension: .suspensionDown, exhaust: .exhaustOpened)

truckCar.handleAction(.unload(amount: 100))
sportCar.handleAction(.exhaustClosed)
sportCar.handleAction(.suspensionUp)


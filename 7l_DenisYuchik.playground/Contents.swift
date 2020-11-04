import UIKit

enum GameErrors: String, Error {
    case noMoneyToBuy
    case noInternet
    case oldVersion
}
struct thing {
    var price: Int
}

class Game {
    var balance = 0
    var internet = true
    var lastVersion = true
    
    func yourBalance() {
        print("Your balance is: \(balance)")
    }
    
    func buySmth(thing: thing) throws {
        guard internet == true else {
            throw GameErrors.noInternet
        }
        guard lastVersion == true else {
            throw GameErrors.oldVersion
        }
        guard thing.price <= self.balance else {
            throw GameErrors.noMoneyToBuy
        }
        balance = self.balance - thing.price
    }
    
    func donate(money: Int) {
        balance = self.balance + money
        print("Donated \(money) successfully!")
        action.yourBalance()
    }
    
    func internetIsOn(internet: Bool) {
        switch internet {
        case true:
            self.internet = true
        case false:
            self.internet = false
        }
    }
    
    func appUpdate(lastVersion: Bool) {
        switch lastVersion {
        case true:
            self.lastVersion = true
        case false:
            self.lastVersion = false
        }
    }
}

extension GameErrors: CustomStringConvertible {
    var description: String {
        switch self {
        case .noMoneyToBuy: return "You don't have enough money to buy it. Donate immediately."
        case .noInternet: return "Check your Internet connection. Can't play without Internet."
        case .oldVersion: return "Check App Store and update the game."
        }
    }
}

let action = Game()

//MARK: Играем:

// Пополняем.
action.donate(money: 500)

// Покупаем.
do {
    try action.buySmth(thing: .init(price: 550))
    print("Purchased successfully!")
} catch let error as GameErrors {
    print(error.description)
}

// Пополняем еще и проверяем баланс.
action.donate(money: 500)

// Отрубаем интернет и пробуем купить (на счету достаточно средств.
action.internetIsOn(internet: false)
do {
    try action.buySmth(thing: .init(price: 550))
    print("Purchased successfully!")
} catch let error as GameErrors {
    print(error.description)
}

// Включаем сеть.
action.internetIsOn(internet: true)

// Успешно покупаем.
do {
    try action.buySmth(thing: .init(price: 150))
    print("Purchased successfully!")
} catch let error as GameErrors {
    print(error.description)
}
action.yourBalance()

// Внезапно выкатили новую версию игры.
action.appUpdate(lastVersion: false)

do {
    try action.buySmth(thing: .init(price: 550))
    print("Purchased successfully!")
} catch let error as GameErrors {
    print(error.description)
}





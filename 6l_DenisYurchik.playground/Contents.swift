import UIKit

struct Queue <T> {
    var items: [T] = []
    
    mutating func takeFirst() -> T? {
        guard items.count > 0 else { return nil }
        return items.removeFirst()
    }
    
    mutating func addToQueue(_ element: T) {
        self.items.append(element)
    }
    
    func filter(predicate: (T) -> Bool) -> [T] {
        return items.filter(predicate)
    }
    
    subscript(index: Int) -> T? {
        guard index < items.count && index >= 0 else { return nil }
        return items[index]
    }
}

struct Names {
    var heroesNames: String
}

let hero1 = Names(heroesNames: "Walter White")
let hero2 = Names(heroesNames: "Jesse Pinkman")
let hero3 = Names(heroesNames: "Hank Shreider")
let hero4 = Names(heroesNames: "Gustavo Fring")
let hero5 = Names(heroesNames: "Saul Goodman")
let array = [hero1, hero2, hero3, hero4, hero5]

var queue = Queue<Names>()
array.forEach {
    queue.addToQueue($0)
}
print(queue.items)

queue.addToQueue(Names(heroesNames: "Steven Gomez"))
print(queue.items)
print(queue.takeFirst())

queue[4]

print(queue.filter { item -> Bool in
    item.heroesNames > "Walter White"
})



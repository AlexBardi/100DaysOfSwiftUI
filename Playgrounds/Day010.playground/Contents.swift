/** Structs */

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func summary() {
        print("\(title) by \(artist) was released in \(year)")
    }
}

let damn = Album(title: "DAMN.", artist: "Kendrick Lamar", year: 2017)
damn.summary()

// You can only use methods to modify values if they are marked "mutating" and the struct is a var, not let
struct Employee {
    let name: String
    var vacationRemaining: Int

    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var bond = Employee(name: "James Bond", vacationRemaining: 8)
bond.takeVacation(days: 3)

// Supports getters and setters
struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated =  vacationTaken + newValue // newValue is provided by swift
        }
    }
}

var archer = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)



/*** Property Observers: Funcs that run when a property changes */

struct Game {
    var score = 0 {
        willSet {
            print("The score is \(score)")
            print("The score will be \(newValue)") // provided by the func
        }
        didSet {
            print("The score is \(oldValue)") // provided by the func
            print("The score was changed to \(score)")
        }
    }
}

var cod = Game()
cod.score += 2

/** Structs have a default init, but you can overwrite it */

struct player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1...99)
    }
    
    init(name: String, number: Int) {
        self.name = name
        if (1 <= number && number <= 99) {
            self.number = number
        } else {
            print("That number is not allowable, assigning random number instead")
            self.number = Int.random(in: 1...99)
        }
    }
}

let bob = player(name: "Bob")
let jill = player(name: "Jill", number: 8)

/* Classes */
//  Basically the exact same as structs but has inheritance, has no default constructor,
//  has mutable properties even when defined with let, assignment is a shallow copy,
//  and theres a special deinitializer that can run when all copies of a class are gone

class Employee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

let alex = Developer(hours: 8)
alex.printSummary()
alex.work()

class Manager: Employee {
    override func printSummary() { // use override in the child class to replace a func defined by the parent
        print("Yo, I'm da boss")
    }
}

let dude = Manager(hours: 10)
dude.printSummary()
// can mark a class as "final" to prevent any others from inheriting from it

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        // Have to call the parent init
        super.init(isElectric: isElectric)
    }
}

// Since assignment is shallow, define a copy function to make deep copies
class Userr {
    var username = "Anonymous"

    func copy() -> Userr {
        let user = Userr()
        user.username = username
        return user
    }
}


// Deinit is called when last reference to the class is deleted
class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

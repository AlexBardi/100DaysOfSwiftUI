/** Struct Access control */
// private
// fileprivate
// public <-- default

struct BankAccount {
    private var funds = 0 // <-- Only this struct's funcs can change funds

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

// can also use "private(set)"


/** Static is used to make a variable hold the same value for all instances of the struct */

struct School {
    static var studentCount = 0 // don't need to mark as mutating since it isn't part of an instance

    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift") // Don't need to create an instance of the struct to use static
print(School.studentCount)

// Difference between self and Self
//  - self refers to the current value of the struct
//  - Self refers to the current type (like Int and Bool)

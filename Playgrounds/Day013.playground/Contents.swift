// PROTOCALS //

// - Protocols are used to define minimum requirements for a struct, class, or enum
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)


// OPAQUE RETURN TYPE //
// can't return something like the protocol 'Equitable' because that includes bools and ints which can't be compared
// instead, use 'some Equitable' and at compile, swift will know which type it actually refers to
// idea is to think about the functionality you want to return, not the specific type so you can change it later
func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}
print(getRandomNumber())


// EXTENSIONS //
// lets you add functionality to a data type
extension String {
    func stupified() -> String {
        var stup = ""
        var lower = false
        for char in self {
            if lower {
                stup += char.lowercased()
            } else {
                stup += char.uppercased()
            }
            lower = !lower
        }
        return stup
    }
}

let testSentence = "This is just a test"
print(testSentence.stupified())

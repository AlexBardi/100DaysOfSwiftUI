import UIKit

/* Type Inferences */

let name: String = "Alex"
print(name)

// Mostly useful for things initialized empty. These two are equivalent
var teams: [String] = []
var other = [String]()

enum Weekday {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

var today = Weekday.Friday
var tomorrow: Weekday = .Saturday
// var yesturday = .Thursday <- Not allowed

// Can assign value for a constant later if you declare its type
let pi: Double
pi = 3.14159
print(pi)


/* Checkpoint 2 */
let arr = ["a", "b", "c", "d", "e", "e"]
print(arr.count," ",Set(arr).count)

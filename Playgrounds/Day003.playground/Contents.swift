import UIKit
/* array */
var greeting = ["Hello", "playground", "woohoo"]
greeting.append("yahoo")
print(greeting,": ",greeting.count)
greeting.remove(at:1)
print("containts woohoo?: ",greeting.contains("woohoo"))
print(greeting,": ",greeting.count)
greeting.removeAll()
print(greeting,": ",greeting.count)
// greeting.append(1) not allowed

var scores = Array<Int>()
scores.append(1)
print(scores)
// .sorted() and .reverse()


/* dictionary */

let infomation = [
    "name": "Alex",
    "pass": "supasecret",
    "id": "1700396"  // cant switch type to int
]

print(infomation["name", default: "unknown"])

var funNums = [String: Int]() // var scores = Dictionary<String, Int>()
funNums["favorite"] = 396
print(funNums["favorite", default: 0])

/* Set */
// unordered, very fast to lookup if an elem is in it
var people = Set<String>()
people.insert("Denzel Washington")
people.insert("Tom Cruise")
people.insert("Nicolas Cage")
people.insert("Samuel L Jackson")
print(people.contains("Tom Cruise"), people.contains("Me"))

/* enum */
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}
var day = Weekday.monday
day = .tuesday
day = .friday
print(day)

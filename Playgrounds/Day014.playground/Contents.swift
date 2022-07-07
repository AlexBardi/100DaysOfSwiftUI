// OPTIONALS
// Represented by a question mark after the type name ex: Int?
// Let vars have the possibility of having no value. Can "unwrap" an option to do something if it has a var

import Darwin

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

// can't use optionals where a non optional is needed. Need to unwrap optional to use it in that case
func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil

if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

// can rename the unwrapped var to the same name, and inside the condition you will be dealing with the unoptional
if let number = number {
    print(square(number: number))
}


var myVar: Int? = 3

// "if let" and "guard let" run the code in their brackets in opposite situations
/*
if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

guard let unwrapped = myVar else {
    print("Run if myVar doesn't have a value inside")
}
*/

// guard let is useful for testing func inputs


// nil coalescing is another way to unwrap an optional, lets you define a value if the optional is nil
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let newCapt = captains["Ebon Hawk"] ?? "UNK"

print(newCapt)

// If you want to call multiple functinos on an option, you can use optional training to continue unwraping in one line

var names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

var names2: [String]? = nil

let chosen2 = names2?.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen2)")


// Optionals are useful return values of functions that can fail
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
// try? is what causes the func to return an optional

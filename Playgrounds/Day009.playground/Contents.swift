/*** Closures */

// functions can be assigned like vars, just omit the paraenthesis

func greet() {
    print("Howdy!")
}
var greetCopy = greet
greetCopy()

// this is a clousure expression
let hello = {
    print("Hi")
}
hello()

// can make parameters available
let sayHiTo = { (name: String) -> String in // everything before the "in" is params and return type
    "hi \(name)"
}
sayHiTo("Bing") // the params of closures aren't named, just follow type signature

// Useful to be passed into funcs as params. Used extensively in SwiftUI
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let captainFirstTeam = team.sorted(by: captainFirstSorted) // Could also write the closure directly in the function call
print(captainFirstTeam)

// since the params and return type the sorted() expects are set, don't actually need to specify them in the closure
let captainFirst = team.sorted { name1, name2 in // This is called trailing closure syntax
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}
print(captainFirst)

// There's special shorthand closure syntax for vars
let piperFirst = team.sorted {
    if $0 == "Piper" {
        return true
    } else if $1 == "Piper" {
        return false
    }
    return $0 < $1
}
print(piperFirst)

// a couple examples of good usage
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

/*** Making functions that accept functinos as params */
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}
func rando() -> Int {
    Int.random(in: 1...20)
}

makeArray(size: 3, using: rando)
makeArray(size: 3) {
    1
}

// Can have a func that accepts multiple closures

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

// Checkpoint
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let sol = luckyNumbers.filter{$0 % 2 == 1}.sorted().map{"\($0) is a lucky number"}
print(sol)

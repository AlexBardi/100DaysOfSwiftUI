/* FUNCTIONS */
func myAdd(num1: Int, num2: Int) {
    print(num1 + num2)
}

myAdd(num1: 9, num2: 39)

func mySubFromTen(num: Int) {
    print(10 - num)
}

mySubFromTen(num: 9)

func rollD20() -> Int {
    return Int.random(in: 1...20)
}

print(rollD20())

func sameLetters(str1: String, str2: String) -> Bool {
    str1.sorted() == str2.sorted() // when a func is only one line, don't need a return. Result of line is returned
}

sameLetters(str1: "abc", str2: "cba")
sameLetters(str1: "aabc", str2: "abc")

// You can return multiple values by using a list
func giveStuff() -> [String] {
    return ["wee", "woo"]
}
giveStuff()
// or a dict
func giveOrganizedStuff() -> [Int: String] {
    return [200: "OK",
            404: "Not found"]
}
giveOrganizedStuff()

// BUT... tuples are prefered
func rightWay() -> (first: String, last: String) { // Don't need to provide names, could use (String, String) and acces the values with [i]
    return ("Greatest", "Ever")
}
let good = rightWay()
print("First name \(good.first), last name, \(good.last)")

// can also set variables equal to multiple return values and use '_' to exclude certain values
let (_, last) = rightWay()
print(last)

// Same function can have multiple interfaces
func myBuild(x: Int) {
    print(x)
}
func myBuild(x: String) {
    print(x)
}

// if you add and underscore before a param, then you don't need to label it when you call
func addOne(_ x: Int) -> Int {
    return x + 1
}
print(addOne(4))

// Cool alert, can have an external param name that is different from the internal one to add readability
func printFactorial(for num: Int) {
    var fact = 1
    for x in 2...num {
        fact *= x
    }
    print(fact)
}

printFactorial(for: 5)

import UIKit

var greeting = "Hello, playground" // Changeable
let hello = "There"                // Not-Changeable

let a = "escape character is \\"
print(a)

let multiline = """
This is
a long
string
"""

let stringLength = hello.count
let loudHello = hello.uppercased()

print("greeting.hasPrefix(\"Hello\"): ",greeting.hasPrefix("Hello"))
print("greeting.hasSuffix(\"playground\"): ",greeting.hasSuffix("playground"))

let num = 123
let bigNum = 1_000_000_000
print("1_000_000_000==1000000000: ",bigNum==1000000000)

print("120.isMultiple(of: 3): ",120.isMultiple(of: 3))

print(0.1 + 0.2)

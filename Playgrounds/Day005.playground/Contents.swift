import UIKit

let mySpeed = 85

if mySpeed > 70 {
    print("Speeding!")
}
if mySpeed <= 70 {
    print("You're good")
}

/* Strings can be sorted alphabetically with < and > */
// A -> 0   Z -> 26
let myName = "Alex"
let gfName = "Steph"

if myName < gfName {
    print("\(myName) comes first!")
}
if myName > gfName {
    print("\(gfName) comes first!")
}

// faster than checking count or string comparison
let name = ""
if name.isEmpty {
    print("The Mysterious Stranger!")
}

let a = true
let b = false

if a || b {
    print("Or")
}

if a && b {
    print("And")
}

if b {
    print("if")
} else if a {
    print("else")
}


let season = "Summer"

switch season {
case "Winter":
    print("Christmas!")
case "Summer":
    print("Too hot")
case "Fall":
    print("sweater weather")
case "Spring":
    print("Yay flowers!")
default:
    print("whatchya talking bout?")
}

// Tertiary operator
let mode = 24
let time = mode == 12 ? 4 : 16
print(time)

/* FOR LOOPS */

let platforms = ["iPadOS", "tvOS", "iOS", "macOS"]

for os in platforms {
    print("I use \(os) in my apartment")
}

for i in 1...10 { // inclusive of the 1 and 10
    print(i)
}


/* Not allowed
for i in 10...0 { // inclusive of the 1 and 10
    print(i)
}
*/
 
for i in 0..<platforms.count { // this is how you write them like in python
    print(platforms[i])
}

for _ in 1...5 {
    print("echo")
}


/* WHILE LOOPS */

var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}
print("LAUNCH")

/* Random is available for int and double */
print(Int.random(in: 1...20))
print(Double.random(in:0...1))


/* BREAKING A LOOP */
// Continue skips the rest of the current iteration
// Break ends the looping
let filenames = ["notpic.txt", "essay.word", "pic.jpeg", "mymixtape.mp4", "pfp.jpeg"]
for file in filenames {
    if !file.hasSuffix(".jpeg") {
        continue
    }
    print("\(file) is a picture!")
}

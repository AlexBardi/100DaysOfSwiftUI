// Function params can have default values
func timesTables(for num: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(num) = \(i * num)")
    }
}
timesTables(for: 7)
timesTables(for: 3, end: 10)


/*** Error Handling */
// Firts, define the errors
enum PasswordError: Error {
    case short, obvious
}

// Next, write a function that can throw errors
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// Finally, call the function and handle the erros
let password = "12345"
do {
    let result = try checkPassword(password)
    print("The password is \(result)")
} catch PasswordError.short {
    print("Your password was too short")
} catch PasswordError.obvious {
    print("Your password is too obvious")
} catch {
    print("That password produced an unknown error")
}

//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Alexander Bardi on 6/9/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()  // set as a var to surpress a warning
    let name: String
    let type: String
    let amount: Double
}

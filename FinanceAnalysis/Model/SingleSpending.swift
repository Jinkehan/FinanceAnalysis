//
//  SingleSpending.swift
//  FinanceAnalysis
//
//  Created by Kehan Jin on 2/27/25.
//

import Foundation
import SwiftData

@Model
final class SingleSpending {
    
    /*
     Fields
     */
    private(set) var amount: Double // The amount of purchase (Rounded to 2 decimal places)
    private(set) var time: Date // The date of purchase
    private(set) var category: SpendingCategory // The category of the spending
    private(set) var location: String // Where the purchase was made
    private(set) var notes: String // Notes with the purchase

    /*
     Initializer
     */
    
    init(amount: Double, time: Date, category: SpendingCategory, location: String, notes: String) {
        self.amount = (amount * 100).rounded() / 100
        self.time = time
        self.category = category
        self.location = location
        self.notes = notes
    }
    
    
    /*
     Field Modifiers
     */
    
    public func updateAmount(_ newAmount: Double) {
        self.amount = (newAmount * 100).rounded() / 100
    }
    
    public func updateCategory(_ newCategory: SpendingCategory) {
        self.category = newCategory
    }
    
    public func updateTime(_ newTime: Date) {
        self.time = newTime
    }
    
    public func updatetLocation(_ newLocation: String) {
        self.location = newLocation
    }
    
    public func updatetNotes(_ newNotes: String) {
        self.notes = newNotes
    }
}

@Model
final class SpendingCategory {
    final var name: String
    final var icon: String

    init(name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
}



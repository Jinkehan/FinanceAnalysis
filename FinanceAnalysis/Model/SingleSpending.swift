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

    /*
     Initializer
     */
    
    init(amount: Double, time: Date, category: SpendingCategory) {
        self.amount = (amount * 100).rounded() / 100
        self.time = time
        self.category = category
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
    
    public func updatetime(_ newTime: Date) {
        self.time = newTime
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



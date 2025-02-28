//
//  AccountBook.swift
//  FinanceAnalysis
//
//  Created by Kehan Jin on 2/27/25.
//
import Foundation
import SwiftData

@Model
final class AccountBook: Identifiable, Hashable {
    var id: UUID
    private(set) var name: String
    private(set) var spendings: [SingleSpending]
    private(set) var categories: [SpendingCategory]
    private(set) var notes: String
    final var dateCreated: Date

    init(name: String, notes: String) {
        self.id = UUID()
        self.name = name
        self.spendings = []
        self.categories = []
        self.notes = notes
        self.dateCreated = Date()
        addCategories(name: "餐饮", icon: "fork.knife")
        addCategories(name: "超市", icon: "basket")
        addCategories(name: "饮料", icon: "takeoutbag.and.cup.and.straw")
        addCategories(name: "交通", icon: "car")
        addCategories(name: "服饰", icon: "jacket")
        addCategories(name: "数码", icon: "macbook.and.iphone")
        addCategories(name: "通讯", icon: "phone.connection")
        addCategories(name: "旅行", icon: "airplane")
        addCategories(name: "学习", icon: "book")
        addCategories(name: "娱乐", icon: "music.microphone")
        addCategories(name: "医疗", icon: "cross.case")
        addCategories(name: "住房", icon: "house")
    }
    
    public func addSpending(amount: Double, time: Date, category: SpendingCategory, location: String, notes: String) {
        var spendingLocation: String = ""
        if (location != "") {
            spendingLocation = location
        }
        spendings.append(SingleSpending(amount: amount, time: time, category: category, location: spendingLocation, notes: notes))
    }
    
    public func addCategories(name: String, icon: String) {
        categories.append(SpendingCategory(name: name, icon: icon))
    }
}

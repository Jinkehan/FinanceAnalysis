//
//  NewSpendingView.swift
//  FinanceAnalysis
//
//  Created by Kehan Jin on 2/27/25.
//

import SwiftUI

struct NewSpendingView: View {
    @Binding var isPresented: Bool // Connects to HomeView to determine if newSpendingView is present
    @State var spending = true
    
    
    var body: some View {
        List {
            Text("as")
        }
    }
}

#Preview {
    NewSpendingView(isPresented: .constant(true))
}

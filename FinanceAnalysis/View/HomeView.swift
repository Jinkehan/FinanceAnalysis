//
//  HomeView.swift
//  FinanceAnalysis
//
//  Created by Kehan Jin on 2/27/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab) {
                    DetailsView()
                        .tabItem {
                            Label("明细", systemImage: "book.pages")
                        }
                        .tag(0)
                    
                    GraphsView()
                        .tabItem {
                            Label("图表", systemImage: "chart.xyaxis.line")
                        }
                        .tag(1)
                    
                    
                    Spacer()
                    
                    SummaryView()
                    
                        .tabItem {
                            Label("总结", systemImage: "doc.plaintext")
                        }
                        .tag(2)
                    
                    SettingView()
                    
                        .tabItem {
                            Label("设置", systemImage: "gear")
                        }
                        .tag(4)
                }
                .tint(.dollarGreen)
                .overlay(
                    Button(action: {
                        print("Center Button Pressed!")
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.blue)
                            .background(Color.white.clipShape(Circle()))
                            .shadow(radius: 4)
                    }
                    , // Adjust to position inside the tab bar
                    alignment: .bottom
                )
                
                
            }
        }
    }
    
    var addButton: some View {
        VStack {
            
            NavigationLink {
                NewSpendingView()
            } label: {
                VStack {
                    Image(systemName: "plus")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(15)
                        .background((.dollarGreen))
                        .clipShape(Circle())
                    Text("记账")
                        .font(.caption)
                        .padding(.top, 1)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

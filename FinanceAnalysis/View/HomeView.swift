//
//  HomeView.swift
//  FinanceAnalysis
//
//  Created by Kehan Jin on 2/27/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    // Model Context
    @Environment(\.modelContext) private var modelContext
    @Query private var accountBooks: [AccountBook]
    
    // State variables for new
    @State private var newName = ""
    @State private var newNotes = ""
    
    // State variables for normalView
    @State private var selectedTab = 0
    @State private var newSpending = false
    @State private var selectedAccountBook: AccountBook?
    
    
    var body: some View {
        if (accountBooks.isEmpty) {
            
            newAccountBookView
        
        } else {
            
            normalView
            
        }
    }
    
    /*
     New Account Book View
     */
    var newAccountBookView: some View {
        ZStack {
            Color.dollarGreen.opacity(0.8).ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("还没有记账本，快新建一个来开始记账吧！")
                        .font(.headline)
                        .foregroundColor(.black.opacity(0.8))
                        .padding(10)
                    
                    newNameTextField
                    
                    newNotesTextEditor
                    
                    createAccountBookButton
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding(10)
                .padding(.top)
                
                Spacer()
            }
        }
    }
    
    // Text field for new Account Book Name entry
    var newNameTextField: some View {
        TextField("账本名称", text: $newName)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal)
    }
    
    // Text editor for new Account Book Notes entry
    var newNotesTextEditor: some View {
        ZStack (alignment: .topLeading) {
            
            TextEditor(text: $newNotes)
                .frame(maxHeight: 140)
                .padding(.horizontal, 5)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                .padding(.bottom)
                .padding(.top, 10)
            
            if newNotes.isEmpty {
                Text("备注 ...")
                    .foregroundColor(.gray.opacity(0.5))
                    .padding()
                    .padding(.horizontal, 9)
                    .padding(.top, 2)
            }
        }
    }
    
    // Button for creating new Account Book
    var createAccountBookButton: some View {
        Button {
            addAccountBook()
        } label: {
            Text("新建")
                .font(.headline)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.dollarGreen.opacity(newName == "" ? 0.4 : 1)))
        }
        .disabled(newName == "")
    }
    
    // Executes new Account Book creation
    private func addAccountBook() {
        let newAccountBook = AccountBook(name: newName, notes: newNotes)
        modelContext.insert(newAccountBook)
    }
    
    /*
     Normal View
     */
    var normalView: some View {
        VStack {
            topBar
            
            NavigationStack {
                ZStack {
                    tabView
                    
                    addButton
                }
                .ignoresSafeArea()
            }
            .fullScreenCover(isPresented: $newSpending) {
                NewSpendingView(isPresented: $newSpending)
            }
        }
        .onAppear {
            if selectedAccountBook == nil {
                if !accountBooks.isEmpty {
                    selectedAccountBook = accountBooks.first
                } else {
                    selectedAccountBook = AccountBook(name: "Default", notes: "No available account books")
                }
            }
        }

    }
        
    // Top bar
    var topBar: some View {
        HStack {
            Picker("Select an Account Book", selection: $selectedAccountBook) {
                            ForEach(accountBooks, id: \.id) { book in
                                Text(book.name)
                                    .tag(book as AccountBook?)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
        }
        .padding(.bottom)
        .frame(maxWidth: .infinity)
        .background(Color.dollarGreen.ignoresSafeArea(edges: .top))
    }
    
    // bottom tab
    var tabView: some View {
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
    }
    
    // Button for adding new spending
    var addButton: some View {
        VStack {
            Spacer()
            
            Button {
                newSpending = true
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
        .padding(.bottom, 25)
    }
}


#Preview {
    HomeView()
        .modelContainer(for: AccountBook.self, inMemory: true)
}

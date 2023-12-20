//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Dominique Strachan on 12/19/23.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    /*
    @Query(filter: #Predicate<User> { user in
        user.name.localizedStandardContains("R") &&
        user.city == "London"
        //user.name.contains("R")
    },
        sort: \User.name) var users: [User]
     */
    //@Query(sort: \User.name) var users: [User]
    
    //@State private var path = [User]()
    
    var body: some View {
        //(path: $path)
        NavigationStack {
            UsersView(minimumJoinDate: showUpcomingOnly ? .now : .distantPast, sortOrder: sortOrder)
        /*
            List(users) { user in
                //NavigationLink(value: user) {
                    Text(user.name)
                //}
            }
         */
            .navigationTitle("Users")
//            .navigationDestination(for: User.self) { user in
//                EditUserView(user: user)
//            }
            .toolbar {
                Button("Add User", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))

                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                    
                    //let user = User(name: "", city: "", joinDate: .now)
                    //modelContext.insert(user)
                    //path = [user]
                }
                
                Button(showUpcomingOnly ? "Show Everyone" : "Show Upcoming") {
                    showUpcomingOnly.toggle()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ToDoListView.swift
//  Simple TODO list
//
//  Created by Jeffrey Klinkhamer on 23/03/2023.
//

import SwiftUI

struct ToDoListView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var settingsModel = MySettingsModel()
    @State var textScale: CGFloat = 1.0
    @StateObject var model = ToDoListModel()
    @State var userInput: String = ""
    @State var titleColorLight: Color = .red
    @State var titleColorDark: Color = .yellow
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("to-do list!")
                    .foregroundColor(colorScheme == .light ? titleColorLight : titleColorDark)
                    .font(.system(size: 35.0))
                Text("You have ^[\(model.showCount()) task](inflect: true) on your list")
                TextField("Tell me what you want to do today", text: $userInput)
                    .border(.secondary)
                    .padding(10.0)
                    .onSubmit {
                        withAnimation {
                            model.addTask(input: userInput)
                            userInput = ""
                        }
                    }
                Group {
                    HStack {
                        Button(action: { model.sortListAlphabetically() }) {
                            Text("Sort A/Z")
                                .padding(5.0)
                        }
                        .border(.purple)
                        .buttonBorderShape(.capsule)
                        .cornerRadius(2.5)
                        
                        Button(action: { model.prioritySort() }) {
                            Text("Sort on priority")
                                .padding(5.0)
                        }
                        .border(.purple)
                    }
                }
                
                List(model.chores) {item in
                    HStack {
                        Image(systemName: item.completed ? settingsModel.taskFinishedIcon : settingsModel.taskUnfinishedIcon)
                            .foregroundColor(item.completed ? .green : .yellow)
                        Text(item.name)
                        Text("\(item.priority)")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .swipeActions {
                        Button("Remove", role: .destructive) {
                            model.removeTask(item)
                        }
                        .tint(.red)
                        
                        Button("Completed") {
                            model.completeTask(item)
                        }
                        .tint(.green)
                        Button("Raise") {
                            model.alterPriority(item, raise: true)
                        }
                        .tint(.black)
                        Button("Lower") {
                            model.alterPriority(item, raise: false)
                        }
                        .tint(.blue)
                    }
                }
                
                HStack {
                    NavigationLink {
                        MySettingsView()
                    } label: {
                        Text("settings")
                            .padding()
                    }
                }
            }
        }
        .environmentObject(settingsModel)
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}

//
//  ToDoListModel.swift
//  Simple TODO list
//
//  Created by Jeffrey Klinkhamer on 23/03/2023.
//

import Foundation
import Combine

class ToDoListModel: ObservableObject {
    struct MyTask: Identifiable {
        let id = UUID()
        var name: String
        var completed: Bool
        var priority: Int
    }
    
    @Published var chores = [
        MyTask(name: "Clean kitchen", completed: false, priority: 2),
        MyTask(name: "Take out trash", completed: false, priority: 3),
        MyTask(name: "Put out fire", completed: false, priority: 1),
        ]
    @Published var item: String = ""
    @Published private var reload: Bool = false
    
    func addTask(input: String) {
        guard !input.isEmpty else { return }
        chores.append(MyTask(name: input, completed: false, priority: 3))
    }
    
    func completeTask(_ item: MyTask) {
        chores.indices.filter { chores[$0].id == item.id}
            .forEach { chores[$0].completed = true}
    }
    
    func removeTask(_ item: MyTask) {
        chores.removeAll { deleteTarget in
            deleteTarget.id == item.id
        }
    }
    
    func alterPriority(_ item: MyTask, raise: Bool) {
        if raise {
            chores.indices.filter { chores[$0].id == item.id}
                .forEach { chores[$0].priority += 1 }
        }
        else {
            chores.indices.filter { chores[$0].id == item.id}
                .forEach {
                    if chores[$0].priority > 1 {
                        chores[$0].priority -= 1
                    }
                }
        }
    }
    
    func showCount() -> Int {
        let count = chores.count
        return count
    }
    
    func sortListAlphabetically() {
        if reload {
            chores.sort {
                $0.name < $1.name
            }
        }
        else {
            chores.sort {
                $0.name > $1.name
            }
        }
        reload.toggle()
    }
    
    func prioritySort() {
        if reload {
            chores.sort {
                $0.priority < $1.priority
            }
        }
        else {
            chores.sort {
                $0.priority > $1.priority
            }
        }
        reload.toggle()
    }
}

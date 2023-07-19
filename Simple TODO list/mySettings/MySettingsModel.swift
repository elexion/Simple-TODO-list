//
//  MySettingsModel.swift
//  Simple TODO list
//
//  Created by Jeffrey Klinkhamer on 03/04/2023.
//

import Foundation
import Combine

class MySettingsModel: ObservableObject {
    struct UnfinishedTaskIcons: Identifiable, Hashable {
        let id = UUID()
        let name: String
        var selected: Bool
    }
    struct FinishedTasksIcons: Identifiable, Hashable {
        let id = UUID()
        let name: String
        var selected: Bool
    }
    @Published var taskUnfinishedIcon: String = "sparkles"
    @Published var taskFinishedIcon: String = "checkmark"
    @Published var selectedUnfishedIcon: Bool = false
    @Published var selectedFinishedIcon: Bool = false
    
    @Published var listOfUnfishedTaskIcons = [
        UnfinishedTaskIcons(name: "sparkles", selected: true),
        UnfinishedTaskIcons(name: "pencil", selected: false),
        UnfinishedTaskIcons(name: "pencil.and.outline", selected: false),
        UnfinishedTaskIcons(name: "bell.fill", selected: false),
        UnfinishedTaskIcons(name: "flame.fill", selected: false),
        UnfinishedTaskIcons(name: "drop.fill", selected: false),
        UnfinishedTaskIcons(name: "hare.fill", selected: false),
        UnfinishedTaskIcons(name: "tortoise.fill", selected: false),
        UnfinishedTaskIcons(name: "pawprint.fill", selected: false),
        UnfinishedTaskIcons(name: "leaf.fill", selected: false),
        UnfinishedTaskIcons(name: "eyes.inverse", selected: false),
        UnfinishedTaskIcons(name: "brain.head.profile", selected: false),
        UnfinishedTaskIcons(name: "figure.walk", selected: false),
        UnfinishedTaskIcons(name: "ear.and.waveform", selected: false),
    ]

    @Published var listOfFinishedTasksIcons = [
        FinishedTasksIcons(name: "checkmark", selected: true),
        FinishedTasksIcons(name: "heart.fill", selected: false),
        FinishedTasksIcons(name: "brain", selected: false),
        FinishedTasksIcons(name: "bed.double.fill", selected: false),
        FinishedTasksIcons(name: "sun.max.fill", selected: false),
        FinishedTasksIcons(name: "moon.fill", selected: false),
        FinishedTasksIcons(name: "cloud.sun.fill", selected: false),
        FinishedTasksIcons(name: "wind.snow", selected: false),
        FinishedTasksIcons(name: "snowflake", selected: false),
        FinishedTasksIcons(name: "tornado", selected: false),
        FinishedTasksIcons(name: "thermometer.sun.fill", selected: false),
        FinishedTasksIcons(name: "humidity", selected: false),
        FinishedTasksIcons(name: "paperplane.fill", selected: false),
        FinishedTasksIcons(name: "calendar", selected: false),
    ]
    
    func updateIcon(_ item: UnfinishedTaskIcons, newIcon: String) {
        guard !newIcon.isEmpty else { return }
        listOfUnfishedTaskIcons.indices.filter {
            listOfUnfishedTaskIcons[$0].id == item.id
        }
            .forEach { listOfUnfishedTaskIcons[$0].selected = true }
        // very ugly - how could I have written this differently and more effective?
        listOfUnfishedTaskIcons.indices.filter { listOfUnfishedTaskIcons[$0].id != item.id}
            .forEach { listOfUnfishedTaskIcons[$0].selected = false }
        taskUnfinishedIcon = newIcon
    }
    
    func updateFinishedIcon(_ item: FinishedTasksIcons, newIcon: String) {
        guard !newIcon.isEmpty else { return }
        listOfFinishedTasksIcons.indices.filter {
            listOfFinishedTasksIcons[$0].id == item.id
        }
            .forEach { listOfFinishedTasksIcons[$0].selected = true }
        listOfFinishedTasksIcons.indices.filter { listOfFinishedTasksIcons[$0].id != item.id }
            .forEach { listOfFinishedTasksIcons[$0].selected = false
                taskFinishedIcon = newIcon
        }
    }
}

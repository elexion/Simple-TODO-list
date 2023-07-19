//
//  MySettingsView.swift
//  Simple TODO list
//
//  Created by Jeffrey Klinkhamer on 03/04/2023.
//

import SwiftUI

struct MySettingsView: View {
    @EnvironmentObject var settingsModel: MySettingsModel

    var body: some View {
        VStack {
            Label("unfinished tasks icon", systemImage: "sparkles")
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(settingsModel.listOfUnfishedTaskIcons, id: \.self) { icon in
                        Image(systemName: "\(icon.name)")
                            .border(icon.selected ? .yellow : .clear )
                            .scaleEffect(2.00)
                            .padding()
                            .onTapGesture {
                                settingsModel.updateIcon(icon, newIcon: "\(icon.name)")
                            }
                    }
                }
                .padding()
            }
            Label("Finished tasks icon", systemImage: "checkmark")
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(settingsModel.listOfFinishedTasksIcons, id: \.self) { icon in
                        Image(systemName: "\(icon.name)")
                            .border(icon.selected ? .yellow : .clear )
                            .scaleEffect(2.00)
                            .padding()
                            .onTapGesture {
                                settingsModel.updateFinishedIcon(icon, newIcon: "\(icon.name)")
                            }
                    }
                }
                .padding()
            }
        }
        .environmentObject(MySettingsModel())
    }
}

struct MySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        MySettingsView().environmentObject(MySettingsModel())
    }
}

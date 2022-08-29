//
//  MangakaApp.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 11/08/2022.
//

import SwiftUI

@main
struct MangakaApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistantContainer.viewContext
            
            ContentView(vm: MangaListViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}

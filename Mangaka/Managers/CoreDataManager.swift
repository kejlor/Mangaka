//
//  CoreDataManager.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 11/08/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistantContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        ValueTransformer.setValueTransformer(UIImageTransformer(), forName: NSValueTransformerName("UIImageTransformer"))
        
        persistantContainer = NSPersistentContainer(name: "MangaModel")
        persistantContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("🔥 Unable to initialize Core Data \(error.localizedDescription)")
            }
        }
    }
}

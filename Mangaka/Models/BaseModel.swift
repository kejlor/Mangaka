//
//  BaseModel.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 11/08/2022.
//

import Foundation
import CoreData

protocol BaseModel where Self: NSManagedObject {
//    static var viewContext: NSManagedObjectContext { get }
    func save() throws
    func delete() throws
    static func byId<T: NSManagedObject>(id: NSManagedObjectID) -> T?
    static func all<T: NSManagedObject>() -> [T]
}

extension BaseModel {
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.persistantContainer.viewContext
    }
    
    func save() {
        do {
            try Self.viewContext.save()
        } catch {
            Self.viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
    
    static func all<T>() -> [T] where T: NSManagedObject {
        let fetchRequest: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
        
        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    static func byId<T>(id: NSManagedObjectID) -> T? where T: NSManagedObject {
        do {
            return try viewContext.existingObject(with: id) as? T
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

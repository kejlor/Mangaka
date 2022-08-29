//
//  Manga+Ext.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 11/08/2022.
//

import Foundation
import CoreData

extension Manga: BaseModel {
    static var all: NSFetchRequest<Manga> {
        let request = Manga.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
    static func byFavourite() -> [Manga] {
        let request: NSFetchRequest = Manga.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", #keyPath(Manga.favourite), NSNumber(value: true))
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
}

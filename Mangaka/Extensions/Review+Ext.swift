//
//  Review+Ext.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import Foundation
import CoreData

extension Review: BaseModel {
    static func getReviewsByMangaId(mangaId: NSManagedObjectID) -> [Review] {
        let request: NSFetchRequest<Review> = Review.fetchRequest()
        request.predicate = NSPredicate(format: "manga + %@", mangaId)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
    }
}

//
//  AddMangaViewModel.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 11/08/2022.
//

import Foundation
import CoreData
import UIKit

class AddMangaViewModel: ObservableObject {
    var title = ""
    var terse = ""
    var favourite = false
    var content: UIImage?
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save() {
        let manga = Manga(context: context)
        manga.title = title
        manga.terse = terse
        manga.content = content
        manga.favourite = favourite
        manga.save()
    }
}

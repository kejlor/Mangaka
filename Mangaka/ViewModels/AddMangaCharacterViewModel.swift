//
//  AddMangaCharacterViewModel.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import Foundation
import CoreData
import UIKit

class AddMangaCharacterViewModel: ObservableObject {
    var name = ""
    
    func addMangaCharacterToManga(mangaId: NSManagedObjectID) {
        let manga: Manga? = Manga.byId(id: mangaId)
        if let manga = manga {
            let mangaCharacter = MangaCharacter(context: MangaCharacter.viewContext)
            mangaCharacter.name = name
            mangaCharacter.addToMangas(manga)
            
            manga.save()
        }
    }
}

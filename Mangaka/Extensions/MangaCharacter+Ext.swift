//
//  MangaCharacter+Ext.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import Foundation
import CoreData

extension MangaCharacter: BaseModel {
    static func getMangaCharactersByMangaId(mangaId: NSManagedObjectID) -> [MangaCharacter] {
        guard let manga = Manga.byId(id: mangaId) as? Manga,
              let mangaCharacters = manga.mangaCharacters
        else {
            return []
        }
        
        return mangaCharacters as [MangaCharacter]
    }
}

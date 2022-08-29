//
//  MangaCharactersListViewModel.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import Foundation
import CoreData

class MangaCharacterListViewModel: ObservableObject {
    @Published var mangaCharacters = [MangaCharacterViewModel]()
    
    func getCharactersByManga(vm: MangaViewModel) {
        DispatchQueue.main.async {
            self.mangaCharacters = MangaCharacter.getMangaCharactersByMangaId(mangaId: vm.id).map(MangaCharacterViewModel.init)
        }
    }
}

struct MangaCharacterViewModel {
    let mangaCharacter: MangaCharacter
    
    var mangaCharacterId: NSManagedObjectID {
        return mangaCharacter.objectID
    }
    
    var name: String {
        return mangaCharacter.name ?? ""
    }
}

//
//  MangaCharacterListView.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import SwiftUI

struct MangaCharacterListView: View {
    @StateObject private var mangaCharacterListVM = MangaCharacterListViewModel()
    @State private var isPresented = false
    
    let manga: MangaViewModel
    
    var body: some View {
        List {
            ForEach(mangaCharacterListVM.mangaCharacters, id: \.mangaCharacterId) { mangaCharacter in
                Text(mangaCharacter.name)
            }
        }
        .onAppear {
            mangaCharacterListVM.getCharactersByManga(vm: manga)
        }.sheet(isPresented: $isPresented) {
            mangaCharacterListVM.getCharactersByManga(vm: manga)
        } content: {
            AddMangaCharacterView(manga: manga)
        }

    }
}

struct MangaCharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        let manga = MangaViewModel(manga: Manga(context: Manga.viewContext))
        
        MangaCharacterListView(manga: manga)
    }
}

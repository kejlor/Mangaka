//
//  FavouriteMangaListViewModel.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import Foundation

class FavouriteMangaListViewModel: ObservableObject {
    @Published var mangas = [MangaViewModel]()
    
    func getFavouriteMangas() {
        DispatchQueue.main.async {
            self.mangas = Manga.byFavourite().map(MangaViewModel.init)
        }
    }
}

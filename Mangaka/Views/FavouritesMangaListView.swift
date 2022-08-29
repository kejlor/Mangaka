//
//  FavouritesMangaListView.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import SwiftUI

struct FavouritesMangaListView: View {
    @StateObject private var favouritesVM = FavouriteMangaListViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(favouritesVM.mangas, id: \.id) { manga in
                    HStack {
                        NavigationLink(destination: DetailMangaView(manga: manga)) {
                            MangaCell(manga: manga)
                        }
                    }
                }
            }
        }
    }
}

struct FavouritesMangaListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesMangaListView()
    }
}

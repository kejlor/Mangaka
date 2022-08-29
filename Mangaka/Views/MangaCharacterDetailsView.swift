//
//  MangaCharacterDetailsView.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import SwiftUI

struct MangaCharacterDetailsView: View {
    let mangaCharacter: MangaCharacterViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MangaCharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let mangaCharacterVM = MangaCharacterViewModel(mangaCharacter: MangaCharacter(context: MangaCharacter.viewContext))
        
        MangaCharacterDetailsView(mangaCharacter: mangaCharacterVM)
    }
}

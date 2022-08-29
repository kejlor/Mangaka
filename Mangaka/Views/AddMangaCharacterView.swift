//
//  AddMangaCharacterView.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import SwiftUI

struct AddMangaCharacterView: View {
    @StateObject private var addMangaCharacterVM = AddMangaCharacterViewModel()
    @Environment(\.presentationMode) private var presentationMode
    
    let manga: MangaViewModel
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                Text("Add Character")
                Text(manga.title)
            }
            
            TextField("Enter name", text: $addMangaCharacterVM.name)
            
            Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            }
            
            Button("Save") {
                addMangaCharacterVM.addMangaCharacterToManga(mangaId: manga.id)
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct AddMangaCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        let manga = MangaViewModel(manga: Manga(context: Manga.viewContext))
        
        AddMangaCharacterView(manga: manga)
    }
}

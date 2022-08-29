//
//  AddReviewView.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import SwiftUI

struct AddReviewView: View {
    @StateObject private var addReviewVM = AddReviewViewModel()
    @Environment(\.presentationMode) var presentationMode
    let manga: MangaViewModel
    
    var body: some View {
        Form {
            TextField("Enter title", text: $addReviewVM.title)
            TextEditor(text: $addReviewVM.content)
            
            HStack {
                Spacer()
                Button("Save") {
                    addReviewVM.addReviewForManga(vm: manga)
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }
        }
        .navigationTitle("Add review")
        .embedInNavigationView()
    }
}

struct AddReviewView_Previews: PreviewProvider {
    static var previews: some View {
        let manga = MangaViewModel(manga: Manga(context: Manga.viewContext))
        
        AddReviewView(manga: manga)
    }
}

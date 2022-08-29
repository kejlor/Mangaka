//
//  AddReviewViewModel.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import Foundation

class AddReviewViewModel: ObservableObject {
    var title = ""
    var content = ""
    
    func addReviewForManga(vm: MangaViewModel) {
        let manga: Manga? = Manga.byId(id: vm.id)
        
        if let manga = manga {
            let review = Review(context: Review.viewContext)
            review.title = title
            review.content = content
            review.manga = manga
            
            review.save()
        }
    }
}

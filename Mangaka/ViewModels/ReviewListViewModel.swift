//
//  ReviewListViewModel.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import Foundation
import CoreData

class ReviewListViewModel: ObservableObject {
    @Published var reviews = [ReviewViewModel]()
    
    func getReviewsByManga(vm: MangaViewModel) {
        DispatchQueue.main.async {
            self.reviews = Review.getReviewsByMangaId(mangaId: vm.id).map(ReviewViewModel.init)
        }
    }
}

struct ReviewViewModel {
    let review: Review
    
    var reviewId: NSManagedObjectID {
        return review.objectID
    }
    
    var title: String {
        return review.title ?? ""
    }
    
    var content: String {
        return review.content ?? ""
    }
}

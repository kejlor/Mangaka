//
//  ReviewListView.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 29/08/2022.
//

import SwiftUI

struct ReviewListView: View {
    @State private var isPresented = false
    @StateObject private var reviewListVM = ReviewListViewModel()
    
    let manga: MangaViewModel
    
    var body: some View {
        VStack {
            List(reviewListVM.reviews, id: \.reviewId) { review in
                HStack {
                    VStack(alignment: .leading) {
                        Text(review.title)
                        Text(review.content)
                            .font(.caption)
                    }
                    Spacer()
                }
            }
        }
        .navigationTitle(manga.title)
        .navigationBarItems(trailing: Button("Add new review") {
            isPresented = true
        })
        .sheet(isPresented: $isPresented) {
            reviewListVM.getReviewsByManga(vm: manga)
        } content: {
            AddReviewView(manga: manga)
        }
        .onAppear {
            reviewListVM.getReviewsByManga(vm: manga)
        }
    }
}

struct ReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        let manga = MangaViewModel(manga: Manga(context: Manga.viewContext))
        
        ReviewListView(manga: manga)
    }
}

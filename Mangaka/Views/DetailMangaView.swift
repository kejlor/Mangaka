//
//  DetailMangaView.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 11/08/2022.
//

import SwiftUI

struct DetailMangaView: View {
    var manga: MangaViewModel
    let heightRatio: CGFloat = 0.5
    
    var body: some View {
        VStack {
            RatioImageView(image: Image(uiImage: manga.content))
            
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                    .frame(width: geo.size.width, height: geo.size.height * heightRatio)
                
                VStack {
                    HStack {
                        Text(manga.title)
                            .font(.title)
                        
                        Spacer()
                        
                        Image(systemName: manga.favourite ? "heart.filled" : "heart")
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text("\(manga.pages) Pages")
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Text(manga.terse)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                }
                .padding()
                .padding(.horizontal)
            }
        }
    }
}

struct DetailMangaView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistantContainer.viewContext
        let manga = MangaViewModel(manga: Manga(context: viewContext))
        
        DetailMangaView(manga: manga)
    }
}

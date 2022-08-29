//
//  ContentView.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 11/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject private var mangaListVM: MangaListViewModel
    
    init(vm: MangaListViewModel) {
        self.mangaListVM = vm
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(mangaListVM.mangas) { manga in
                        NavigationLink {
                            DetailMangaView(manga: manga)
                        } label: {
                            MangaCell(manga: manga)
                        }
                    }
                    .onDelete(perform: deleteManga)
                }
                .sheet(isPresented: $isPresented) {
                    AddMangaView(vm: AddMangaViewModel(context: viewContext))
                }
                .navigationTitle("Mangaka")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add New Manga") {
                            isPresented = true
                        }
                    }
                }
            }
        }
    }
}

extension ContentView {
    private func deleteManga(at offsets: IndexSet) {
        offsets.forEach { index in
            let manga = mangaListVM.mangas[index]
            mangaListVM.deleteManga(mangaId: manga.id)
        }
    }
}

struct MangaCell: View {
    let manga: MangaViewModel
    
    var body: some View {
        HStack {
                Image(uiImage: manga.content)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 150)
            
            Spacer()
            
            
            VStack {
                HStack {
                    Text(manga.title)
                        .font(.title)
                    
                    Image(systemName: manga.favourite ? "heart.filled" : "heart")
                }
                
                Spacer()
                
                Text("Read More")
            }
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = CoreDataManager.shared.persistantContainer.viewContext
        
        ContentView(vm: MangaListViewModel(context: viewContext))
    }
}

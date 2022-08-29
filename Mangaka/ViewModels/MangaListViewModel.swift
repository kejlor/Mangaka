//
//  MangaListViewMode.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 11/08/2022.
//

import Foundation
import CoreData
import UIKit

class MangaListViewModel: NSObject, ObservableObject {
    @Published var mangas = [MangaViewModel]()
    private let fetchedResultsController: NSFetchedResultsController<Manga>
    private (set) var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: Manga.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            
            guard let mangas = fetchedResultsController.fetchedObjects else {
                return
            }
            
            self.mangas = mangas.map(MangaViewModel.init)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteManga(mangaId: NSManagedObjectID) {
        do {
            guard let manga = try context.existingObject(with: mangaId) as? Manga else { return }
            
            try manga.delete()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension MangaListViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let mangas = controller.fetchedObjects as? [Manga] else {
            return
        }
        
        self.mangas = mangas.map(MangaViewModel.init)
    }
}

struct MangaViewModel: Identifiable {
    private var manga: Manga
    
    init(manga: Manga) {
        self.manga = manga
    }
    
    var id: NSManagedObjectID {
        manga.objectID
    }
    
    var title: String {
        manga.title ?? ""
    }
    
    var favourite: Bool {
        manga.favourite
    }
    
    var pages: Int {
        Int(manga.pages)
    }
    
    var terse: String {
        manga.terse ?? ""
    }
    
    var content: UIImage {
        manga.content ?? UIImage(systemName: "photo")!
    }
}

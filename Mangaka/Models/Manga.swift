//
//  Manga.swift
//  Mangaka
//
//  Created by Bartosz Wojtkowiak on 11/08/2022.
//

import Foundation
import CoreData
import UIKit

@objc(Manga)
public class Manga: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Manga> {
        return NSFetchRequest<Manga>(entityName: "Manga")
    }

    @NSManaged public var content: UIImage?
    @NSManaged public var terse: String?
    @NSManaged public var title: String?
    @NSManaged public var favourite: Bool
    @NSManaged public var pages: Int16
    @NSManaged public var mangaCharacters: [MangaCharacter]?
    @NSManaged public var reviews: [Review]?

}

extension Manga : Identifiable {

}

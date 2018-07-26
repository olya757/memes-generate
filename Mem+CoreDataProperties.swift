//
//  Mem+CoreDataProperties.swift
//  memes
//
//  Created by Дмитрий Трофимов on 26.07.2018.
//  Copyright © 2018 Ольга Шишкина. All rights reserved.
//
//

import Foundation
import CoreData


extension Mem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mem> {
        return NSFetchRequest<Mem>(entityName: "Mem")
    }

    @NSManaged public var imageName: String?
    @NSManaged public var textDescription: String?
    @NSManaged public var textName: String?

}

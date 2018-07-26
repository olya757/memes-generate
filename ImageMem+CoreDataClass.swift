//
//  ImageMem+CoreDataClass.swift
//  memes
//
//  Created by Дмитрий Трофимов on 26.07.2018.
//  Copyright © 2018 Ольга Шишкина. All rights reserved.
//
//

import Foundation
import CoreData


public class ImageMem: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "ImageMem"), insertInto: CoreDataManager.instance.managedObjectContext)
    }
}

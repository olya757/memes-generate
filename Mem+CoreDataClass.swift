//
//  Mem+CoreDataClass.swift
//  memes
//
//  Created by Дмитрий Трофимов on 26.07.2018.
//  Copyright © 2018 Ольга Шишкина. All rights reserved.
//
//

import Foundation
import CoreData


public class Mem: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.instance.entityForName(entityName: "Mem"), insertInto: CoreDataManager.instance.managedObjectContext)
    }
}

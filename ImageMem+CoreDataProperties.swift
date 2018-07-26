//
//  ImageMem+CoreDataProperties.swift
//  memes
//
//  Created by Дмитрий Трофимов on 26.07.2018.
//  Copyright © 2018 Ольга Шишкина. All rights reserved.
//
//

import Foundation
import CoreData


extension ImageMem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageMem> {
        return NSFetchRequest<ImageMem>(entityName: "ImageMem")
    }

    @NSManaged public var imageName: String?

}

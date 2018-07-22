//
//  CollectionViewCell.swift
//  memes
//
//  Created by Дмитрий Трофимов on 22.07.2018.
//  Copyright © 2018 Ольга Шишкина. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var ivImage: UIImageView!
    
    @IBOutlet weak var tvText: UITextView!
}

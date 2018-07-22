//
//  CreateMemViewController.swift
//  memes
//
//  Created by Дмитрий Трофимов on 23.07.2018.
//  Copyright © 2018 Ольга Шишкина. All rights reserved.
//

import UIKit

class CreateMemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var ivImage: UIImageView!
    
    @IBOutlet weak var tvName: UITextView!
    
    @IBOutlet weak var tvDescription: UITextView!
    
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var btnSave: UIBarButtonItem!
}

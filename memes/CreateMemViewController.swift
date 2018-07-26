//
//  CreateMemViewController.swift
//  memes
//
//  Created by Дмитрий Трофимов on 23.07.2018.
//  Copyright © 2018 Ольга Шишкина. All rights reserved.
//

import UIKit

class CreateMemViewController: UIViewController {

    var mem: Mem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let mem = mem {
            tvName.text = mem.textName
            tvDescription.text = mem.textDescription
            ivImage.image = UIImage(named: mem.imageName!)
            imageName = mem.imageName
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        ivImage.isUserInteractionEnabled = true
        ivImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        // Your action
    }
    var imageName : String?
    
   /* required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    */
    @IBAction func save(_ sender: Any) {
        //performSegue(withIdentifier: "ComeBackToCollection", sender: nil)

        if saveCustomer() {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cansel(_ sender: Any) {
        //performSegue(withIdentifier: "ComeBackToCollection", sender: nil)
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tvName: UITextView!
    @IBOutlet weak var tvDescription: UITextView!
    
    @IBOutlet weak var ivImage: UIImageView!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if tvName.text!.isEmpty {
            let alert = UIAlertController(title: "Validation error", message: "Input the name of the Customer!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            //return false
        }
        // Creating object
        if mem == nil {
            mem = Mem()
        }
        // Saving object
        if let mem = mem {
            mem.textName = tvName.text
            mem.textDescription = tvDescription.text
            mem.imageName = imageName!
            CoreDataManager.instance.saveContext()
        }
    }
    func saveCustomer() -> Bool {
        // Validation of required fields
        if tvName.text!.isEmpty {
            let alert = UIAlertController(title: "Validation error", message: "Input the name of the Customer!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        // Creating object
        if mem == nil {
            mem = Mem()
            imageName = "gendalf.jpg"
        }
        // Saving object
        if let mem = mem {
            mem.textName = tvName.text
            mem.textDescription = tvDescription.text
            mem.imageName = imageName!
            CoreDataManager.instance.saveContext()
        }
        return true
    }
}

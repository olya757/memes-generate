//
//  CreateMemViewController.swift
//  memes
//
//  Created by Дмитрий Трофимов on 23.07.2018.
//  Copyright © 2018 Ольга Шишкина. All rights reserved.
//
import CoreData
import UIKit

class CreateMemViewController: UIViewController,  UICollectionViewDelegate, UICollectionViewDataSource, NSFetchedResultsControllerDelegate {
    
     var fetchedResultsController = CoreDataManager.instance.fetchedResultsController(entityName: "ImageMem", keyForSort: "imageName")
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        
        cell.ivImage.image = UIImage(named: images[indexPath.item].imageName!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mem = images[indexPath.item]
        imageName = mem.imageName!
        ivImage.image = UIImage(named: imageName)
        collectionView.isHidden = true
     
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    var mem: Mem?
    var images = [ImageMem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let mem = mem {
            tvName.text = mem.textName
            tvDescription.text = mem.textDescription
            imageName = mem.imageName!
        }
        ivImage.image = UIImage(named: imageName)
        collectionView.register(UINib.init(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isHidden = true
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
        
        images = fetchedResultsController.fetchedObjects as! [ImageMem]
       
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        ivImage.isUserInteractionEnabled = true
        ivImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        collectionView.isHidden = false
        // Your action
    }
    
    
    
    var imageName : String = "benladon.png"
    
    
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
    
    
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
            mem.imageName = imageName
            CoreDataManager.instance.saveContext()
        }
    }*/
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
        }
        // Saving object
        if let mem = mem {
            mem.textName = tvName.text
            mem.textDescription = tvDescription.text
            mem.imageName = imageName
            CoreDataManager.instance.saveContext()
        }
        return true
    }
}

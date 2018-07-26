//
//  ViewController.swift
//  memes
//
//  Created by Дмитрий Трофимов on 22.07.2018.
//  Copyright © 2018 Ольга Шишкина. All rights reserved.
//
import CoreData
import UIKit

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate, NSFetchedResultsControllerDelegate {

    var fetchedResultsController = CoreDataManager.instance.fetchedResultsController(entityName: "Mem", keyForSort: "textName")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource=self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        searchBar.delegate = self
        fetchedResultsController.delegate = self
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }

        filtred = fetchedResultsController.fetchedObjects as! [Mem]
    }

    var filtred = [Mem]()
    var text = ["item1","i2","i3","i4"]
    
    var images = [UIImage(named: "gendalf.jpg"),UIImage(named: "putin.jpg"),UIImage(named: "benladon.png"),UIImage(named: "image1.jpg")]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtred.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.ivImage.image=UIImage(named: filtred[indexPath.item].imageName!)
        cell.tvText.text = filtred[indexPath.item].textName
        
        cell.ivImage.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.size.width)/2, height: 150)
        cell.tvText.frame = CGRect(x: Int(self.view.frame.size.width)/2, y: 0, width: Int(self.view.frame.size.width)/2, height: 150)
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }

        filtred = fetchedResultsController.fetchedObjects as! [Mem]
        collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.reloadData(str: searchText)
    }
    
    func reloadData(str : String){
        if (str==""){
            filtred = fetchedResultsController.fetchedObjects as! [Mem]
            collectionView.reloadData()
            return
        }
        let obj = fetchedResultsController.fetchedObjects as! [Mem]
        filtred = obj.filter{
            item in return (item.textName?.lowercased().contains(str.lowercased()))!
        }
        collectionView.reloadData()
    }
    
    @IBAction func createMem(_ sender: Any) {
        performSegue(withIdentifier: "CreateMem", sender: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mem = fetchedResultsController.object(at: indexPath) as? Mem
        performSegue(withIdentifier: "CreateMem", sender: mem)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CreateMem" {
            let controller = segue.destination as! CreateMemViewController
            controller.mem = sender as? Mem
        }
    }
    
    
    
}


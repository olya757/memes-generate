//
//  ViewController.swift
//  memes
//
//  Created by Дмитрий Трофимов on 22.07.2018.
//  Copyright © 2018 Ольга Шишкина. All rights reserved.
//

import UIKit

class Pair{
    var image = UIImage(named : "gendalf.jpg")
    var text = ""
    init(i: UIImage, t : String){
        text = t
        image = i
    }
}

class ViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        var i : Int = 0
        while (i<text.count){
            objects.append(Pair(i: images[i]!,t: text[i]))
            i=i+1
        }
        filtred=objects
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource=self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        searchBar.delegate = self
    }

    var objects = [Pair]()
    var filtred = [Pair]()
    var text = ["item1","i2","i3","i4"]
    
    var images = [UIImage(named: "gendalf.jpg"),UIImage(named: "putin.jpg"),UIImage(named: "benladon.png"),UIImage(named: "image1.jpg")]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtred.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.ivImage.image=filtred[indexPath.item].image
        cell.tvText.text = filtred[indexPath.item].text
        
        
        
        cell.ivImage.frame = CGRect(x: 0, y: 0, width: Int(self.view.frame.size.width)/2, height: 150)
        cell.tvText.frame = CGRect(x: Int(self.view.frame.size.width)/2, y: 0, width: Int(self.view.frame.size.width)/2, height: 150)
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.reloadData(str: searchText)
    }
    
    func reloadData(str : String){
        if (str==""){
            filtred = objects
            collectionView.reloadData()
            return
        }
        filtred = objects.filter{
            item in return item.text.lowercased().contains(str.lowercased())
        }
        collectionView.reloadData()
    }
    
}


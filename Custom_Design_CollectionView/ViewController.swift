//
//  ViewController.swift
//  Custom_Design_CollectionView
//
//  Created by Ramya Oduri on 30/08/22.
//

import UIKit

class ViewController: UIViewController {
    let collectionviewClass = CollectionViewClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionviewClass)
        collectionviewClass.frame = CGRect(x: 10, y: 0, width: view.frame.size
            .width - 20, height: view.frame.size.height)
    }
    
    override func viewDidLayoutSubviews() {
        collectionviewClass.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.height)
    }

    
}



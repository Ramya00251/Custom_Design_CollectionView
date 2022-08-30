//
//  CollectionViewClass.swift
//  CustomDesign
//
//  Created by Ramya Oduri on 29/08/22.
//

import Foundation
import UIKit

class CollectionViewClass: UIView , UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    var myCollectionView : UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)

    }
    required public init(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    let collectionview : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        return collectionView
    }()
    func setUpViews() {
        addSubview(collectionview)
        collectionview.dataSource = self
        collectionview.delegate = self
    }
    override func layoutSubviews() {
        collectionview.frame = CGRect(x: 10, y: 0, width: frame.size.width - 10, height: 500)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        return cell
        
    }
    
}

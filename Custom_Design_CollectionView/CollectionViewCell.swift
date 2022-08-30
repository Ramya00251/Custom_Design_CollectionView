//
//  CollectionViewCell.swift
//  CustomDesign
//
//  Created by Ramya Oduri on 28/08/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell ,UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    var questionNumberArray = [10,10,0,30,50]
    var questionDataArray = ["CorrectAnswers","Skipped Visited","Skipped Not Visited","Partially Correct","InCorrect Answers"]
    
    static let identifier = "CollectionViewCell"
    
    var myView1 : UIView = {
       let myView1 = UIView()
      myView1.backgroundColor = .green
       return myView1
   }()
    
    private var myView2 : UIView = {
        let myView2 = UIView()
        myView2.backgroundColor = .orange
        return myView2
    }()
    private var myView3 : UIView = {
        let myView3 = UIView()
        myView3.backgroundColor = .cyan
        return myView3
    }()
    private var myView4 : UIView = {
        let myView4 = UIView()
        myView4.backgroundColor = .yellow
        return myView4
    }()
    private var myView5 : UIView = {
        let myView5 = UIView()
        myView5.backgroundColor = .red
        return myView5
    }()
    let collectionview : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        return collectionView
    }()

    var cellId = "cell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpViews() {
        addSubview(collectionview)
        collectionview.dataSource = self
        collectionview.delegate = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myView1)
        contentView.addSubview(myView2)
        contentView.addSubview(myView3)
        contentView.addSubview(myView4)
        contentView.addSubview(myView5)
        
        myView1.layer.cornerRadius = 15
        myView1.layer.maskedCorners = [.layerMinXMinYCorner , .layerMinXMaxYCorner]
        myView5.layer.cornerRadius = 15
        myView5.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMaxXMinYCorner]
        
        setUpViews()
        collectionview.register(QuestionsDataCollectionViewCell.self, forCellWithReuseIdentifier: QuestionsDataCollectionViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        myView1.frame = CGRect(x: 30, y: 39, width: (CGFloat(questionNumberArray[0])/CGFloat(Float(100.0))) * frame.width, height: 50)
//        myView2.frame = CGRect(x: 30 + (CGFloat(questionNumberArray[0])/CGFloat(Float(100.0))) * frame.width, y: 39, width:(CGFloat(questionNumberArray[1])/CGFloat(Float(100.0))) * frame.width , height: 50)
//        myView3.frame = CGRect(x: 30 + 30 + (CGFloat(questionNumberArray[1])/CGFloat(Float(100.0))) * frame.width, y: 39, width: (CGFloat(questionNumberArray[2])/CGFloat(Float(100.0))) * frame.width, height: 50)
//       myView4.frame = CGRect(x:30 + 30 + 30 + (CGFloat(questionNumberArray[2])/CGFloat(Float(100.0))) * frame.width, y: 39, width: (CGFloat(questionNumberArray[3])/CGFloat(Float(100.0))) * frame.width, height: 50)
//        myView5.frame = CGRect(x: 30 + 30 + 30 + 30 + (CGFloat(questionNumberArray[3])/CGFloat(Float(100.0))) * frame.width, y: 39, width: (CGFloat(questionNumberArray[4])/CGFloat(Float(100.0))) * frame.width, height: 50)
        
        myView1.frame = CGRect(x: 30, y: 35, width: questionNumberArray[0] * 3, height: 70)
                myView2.frame = CGRect(x: questionNumberArray[0] * 3 + 30, y: 45, width: questionNumberArray[1] * 3, height: 50)
                myView3.frame = CGRect(x: questionNumberArray[0] * 3 + 30 + questionNumberArray[1] * 3, y: 45, width: questionNumberArray[2] * 3, height: 50)
                myView4.frame = CGRect(x:questionNumberArray[0] * 3 + 30 + questionNumberArray[1] * 3 + questionNumberArray[2] * 3 , y: 45, width: questionNumberArray[3] * 3, height: 50)
                myView5.frame = CGRect(x: questionNumberArray[0] * 3 + 30 + questionNumberArray[1] * 3 + questionNumberArray[2] * 3 + questionNumberArray[3] * 3, y: 45, width: questionNumberArray[4] * 3, height: 50)
                
        collectionview.frame = CGRect(x: 20, y: 120, width: 400, height: 400)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionNumberArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: QuestionsDataCollectionViewCell.identifier, for: indexPath) as! QuestionsDataCollectionViewCell
        cell.numberOfQuestionsLabel.text = "\(questionNumberArray[indexPath.row]) \(questionDataArray[indexPath.row])"
//        collectionview.backgroundColor = .orange
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 50)
    }

    

}

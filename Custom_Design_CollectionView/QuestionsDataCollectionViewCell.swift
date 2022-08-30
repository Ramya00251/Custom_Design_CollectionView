//
// QuestionsDataCollectionViewCell.swift
// CustomDesign
//
// Created by Ramya Oduri on 29/08/22.
//

import UIKit

class QuestionsDataCollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionCell"
    
    let uiColors : [UIColor] = [.green, .orange, .red , .cyan , .yellow]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawCircle(uiColors[0])
        contentView.addSubview(numberOfQuestionsLabel)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        numberOfQuestionsLabel.frame = CGRect(x: 29, y: 11, width: frame.size.width, height: 30)
    }
    
    let numberOfQuestionsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize:16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    func drawCircle(_ color : UIColor){
        let trackLayer = CAShapeLayer()
        trackLayer.frame  = CGRect(x: 0, y: 10, width: 17, height: 17)
        let circularPath1 = UIBezierPath(roundedRect: CGRect(x: 1, y:10, width: 17, height: 17), cornerRadius: 40)
        trackLayer.path = circularPath1.cgPath
        trackLayer.lineWidth = 10
        trackLayer.fillColor = color.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        contentView.layer.addSublayer(trackLayer)
    }
}

//
//  BillListHeader.swift
//  TestApp
//
//  Created by javad on 11.05.22.
//

import UIKit

class BillListHeader: UICollectionReusableView {
    
    let monthLabel = UILabel()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "More").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        headerLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMonthLabel(monthString: String) {
        monthLabel.attributedText = NSAttributedString(string: monthString, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
    }
   
    func headerLayout() {
        addSubview(monthLabel)
        addSubview(moreButton)
        
        // constraints for the this month label under textfield
        monthLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        monthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        monthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50).isActive = true
        monthLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // constraints for More button near the This Month label
        moreButton.bottomAnchor.constraint(equalTo: monthLabel.bottomAnchor, constant: -5).isActive = true
        moreButton.leadingAnchor.constraint(equalTo: monthLabel.trailingAnchor, constant: 5).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
}

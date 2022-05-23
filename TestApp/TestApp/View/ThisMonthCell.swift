//
//  ThisMonthCell.swift
//  TestApp
//
//  Created by javad on 21.04.22.
//

import UIKit

class ThisMonthHeader: UICollectionReusableView {
  
    
    let findFriendsTextField: UITextField = {
        let textField = UITextField()
        let button = UIButton()
//        let searchImage = UIImage(systemName: "Search")?.withRenderingMode(.alwaysOriginal)
        button.setImage(#imageLiteral(resourceName: "Search").withRenderingMode(.alwaysOriginal), for: .normal)
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSAttributedString(string: "Find your friends... ", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.attributedPlaceholder = attributedText
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.rightView = button
        textField.rightViewMode = .always
        return textField
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let thisMonthLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "This Month", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    
   
    
    func headerLayout() {
        addSubview(findFriendsTextField)
        addSubview(dividerLineView)
        addSubview(thisMonthLabel)
        addSubview(moreButton)
        
        // constraints for the search textfield
        findFriendsTextField.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        findFriendsTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        findFriendsTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        findFriendsTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // constraints for the line under the search textfield
        dividerLineView.topAnchor.constraint(equalTo: findFriendsTextField.bottomAnchor, constant: 10).isActive = true
        dividerLineView.leadingAnchor.constraint(equalTo: findFriendsTextField.leadingAnchor).isActive = true
        dividerLineView.trailingAnchor.constraint(equalTo: findFriendsTextField.trailingAnchor).isActive = true
        dividerLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        // constraints for the this month label under textfield
        thisMonthLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        thisMonthLabel.leadingAnchor.constraint(equalTo: dividerLineView.leadingAnchor).isActive = true
        thisMonthLabel.trailingAnchor.constraint(equalTo: dividerLineView.trailingAnchor, constant: -50).isActive = true
        thisMonthLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // constraints for More button near the This Month label
        moreButton.bottomAnchor.constraint(equalTo: thisMonthLabel.bottomAnchor).isActive = true
        moreButton.leadingAnchor.constraint(equalTo: thisMonthLabel.trailingAnchor, constant: 5).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
}

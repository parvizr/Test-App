//
//  ActivityCell.swift
//  TestApp
//
//  Created by javad on 20.04.22.
//

import UIKit

class ActivityCell: UICollectionViewCell {
    
    
    
    let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let activityNameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Coffee at the cafe", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "08 jan, 2022", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "19:30", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amountOfPaymentLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "+$24.00", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        backgroundColor = .clear
        
        addSubview(arrowImageView)
        addSubview(activityNameLabel)
        addSubview(dateLabel)
        addSubview(dividerLineView)
        addSubview(timeLabel)
        addSubview(amountOfPaymentLabel)
        
        
        
        // constraints for image which shows recent operation
        arrowImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        arrowImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        // constraints for the text label which gives information about activity
        activityNameLabel.topAnchor.constraint(equalTo: arrowImageView.topAnchor, constant: 8).isActive = true
        activityNameLabel.leadingAnchor.constraint(equalTo: arrowImageView.trailingAnchor, constant: 12).isActive = true
        activityNameLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        activityNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        // constraints for the date text
        dateLabel.bottomAnchor.constraint(equalTo: arrowImageView.bottomAnchor, constant: -12).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: arrowImageView.trailingAnchor, constant: 12).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
        // constraints for the divider line view between date label and time label
        dividerLineView.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor).isActive = true
        dividerLineView.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor).isActive = true
        dividerLineView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        dividerLineView.widthAnchor.constraint(equalToConstant: 0.8).isActive = true
        
        // constraints for the time label
        timeLabel.leadingAnchor.constraint(equalTo: dividerLineView.trailingAnchor, constant: 5).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: dividerLineView.bottomAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        // constraints for the lable which shows the last payment amount
        amountOfPaymentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        amountOfPaymentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        amountOfPaymentLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        amountOfPaymentLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
    }
}

class SectionHeader: UICollectionReusableView {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Recent activity", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor : UIColor.gray])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(headerLabel)
        
        // constraints for the Recent Activity header label
        headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    }
}

//
//  BalanceCell.swift
//  TestApp
//
//  Created by javad on 20.04.22.
//

import UIKit

class BalanceCell: UICollectionViewCell {
    
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Your Balance\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor.gray])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let balanceAmountLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "$1.243.00", attributes: [NSAttributedString.Key.font  : UIFont.boldSystemFont(ofSize: 40)])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .orange
        imageView.layer.cornerRadius = 20
        imageView.image = #imageLiteral(resourceName: "Plus").withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let billView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.87, green: 1.00, blue: 0.05, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let totalBillLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Total Bill", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor.gray])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let splitToLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Split to", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor.gray])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalBillAmountLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "$32.002", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let splitToLabelAmount: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "4", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(balanceLabel)
        addSubview(balanceAmountLabel)
        addSubview(plusImageView)
        addSubview(billView)
        billView.addSubview(separatorView)
        billView.addSubview(totalBillLabel)
        billView.addSubview(splitToLabel)
        billView.addSubview(totalBillAmountLabel)
        billView.addSubview(splitToLabelAmount)
        
        // constraints for balance information
        balanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        balanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14).isActive = true
        balanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14).isActive = true
        balanceLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        // constraints for balance amount information
        balanceAmountLabel.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 20).isActive = true
        balanceAmountLabel.leadingAnchor.constraint(equalTo: balanceLabel.leadingAnchor).isActive = true
        balanceAmountLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        balanceAmountLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        // constraints for plus image inside the balance text view
        plusImageView.topAnchor.constraint(equalTo: balanceLabel.topAnchor, constant: 25).isActive = true
        plusImageView.trailingAnchor.constraint(equalTo: balanceLabel.trailingAnchor).isActive = true
        plusImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        plusImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
       // constraints for bill information view
        billView.topAnchor.constraint(equalTo: balanceAmountLabel.bottomAnchor, constant: 20).isActive = true
        billView.leadingAnchor.constraint(equalTo: balanceAmountLabel.leadingAnchor).isActive = true
        billView.trailingAnchor.constraint(equalTo: plusImageView.trailingAnchor).isActive = true
        billView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        // constraints for Total Bill Label
        totalBillLabel.topAnchor.constraint(equalTo: billView.topAnchor, constant: 10).isActive = true
        totalBillLabel.leadingAnchor.constraint(equalTo: billView.leadingAnchor, constant: 40).isActive = true
        totalBillLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        totalBillLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        // constraints for the total bill
        totalBillAmountLabel.topAnchor.constraint(equalTo: totalBillLabel.bottomAnchor, constant: 5).isActive = true
        totalBillAmountLabel.leadingAnchor.constraint(equalTo: totalBillLabel.leadingAnchor).isActive = true
        totalBillAmountLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        totalBillAmountLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        
        // constraints for split to Label
        splitToLabel.topAnchor.constraint(equalTo: billView.topAnchor, constant: 10).isActive = true
        splitToLabel.trailingAnchor.constraint(equalTo: billView.trailingAnchor, constant: -40).isActive = true
        splitToLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        splitToLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        // constraint for split number
        splitToLabelAmount.topAnchor.constraint(equalTo: splitToLabel.bottomAnchor, constant: 5).isActive = true
        splitToLabelAmount.leadingAnchor.constraint(equalTo: splitToLabel.leadingAnchor).isActive = true
        splitToLabelAmount.heightAnchor.constraint(equalToConstant: 30).isActive = true
        splitToLabelAmount.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        //constraints for separator inside of the bill text view
        separatorView.centerXAnchor.constraint(equalTo: billView.centerXAnchor).isActive = true
        separatorView.centerYAnchor.constraint(equalTo: billView.centerYAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        separatorView.widthAnchor.constraint(equalToConstant: 0.8).isActive = true

    }
}

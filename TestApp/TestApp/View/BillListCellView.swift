//
//  BillListCellView.swift
//  TestApp
//
//  Created by javad on 11.05.22.
//

import UIKit

class BillListCellView: UICollectionViewCell {
    
    weak var billListController: BillListController?
    
    let activityImageView = UIImageView()
    let titleLabel = UILabel()
    let totalPaymentLabel = UILabel()
    let paymentStatusView = PaymentStatusCircleBar()
    
    let firstView: UIImageView = {
        let imageView = UIImageView()
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 10, y: 10), radius: 10, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 2
        imageView.layer.addSublayer(shapeLayer)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    let secondView: UIImageView = {
        let imageView = UIImageView()
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 10, y: 10), radius: 10, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 2
        imageView.layer.addSublayer(shapeLayer)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    let thirdView: UIImageView = {
        let imageView = UIImageView()
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 10, y: 10), radius: 10, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 2
        imageView.layer.addSublayer(shapeLayer)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // requetsing to the API for getting pictures
    func configurePictures(with urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {return}
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self?.firstView.image = image
                self?.secondView.image = image
                self?.thirdView.image = image
            }
        }.resume()
    }
    
    func setupActivityImage(backgroundColor: UIColor) {
        activityImageView.layer.cornerRadius = 25
        activityImageView.isUserInteractionEnabled = true
        activityImageView.clipsToBounds = true
        activityImageView.backgroundColor = backgroundColor
        activityImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupTitle(titleString: String) {
        titleLabel.attributedText = NSAttributedString(string: titleString, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)])
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupTotalPayment(totalPaymentString: String) {
        totalPaymentLabel.attributedText = NSAttributedString(string: "Total payment: $\(totalPaymentString)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12), NSAttributedString.Key.foregroundColor : UIColor.systemGray])
        totalPaymentLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc func animate() {
        billListController?.animateActivityImageview(activityImageView: activityImageView)
    }
    
    func setupViews() {
        
        let friendsImageStackView = UIStackView(arrangedSubviews: [firstView, secondView, thirdView])
        friendsImageStackView.translatesAutoresizingMaskIntoConstraints = false
        friendsImageStackView.distribution = .fillEqually
        friendsImageStackView.spacing = -5
        
        addSubview(activityImageView)
        addSubview(titleLabel)
        addSubview(totalPaymentLabel)
        addSubview(friendsImageStackView)
        addSubview(paymentStatusView.view)
        
        activityImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animate)))
        
        
        // constraints for the image view which illustrate the activity
        activityImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        activityImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        activityImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        activityImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        // constraints for the title text
        titleLabel.topAnchor.constraint(equalTo: activityImageView.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: activityImageView.trailingAnchor, constant: 5).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        // constraints for the total payment text
        totalPaymentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        totalPaymentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        totalPaymentLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        totalPaymentLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        // constraints for image stack view
        friendsImageStackView.topAnchor.constraint(equalTo: totalPaymentLabel.bottomAnchor, constant: 5).isActive = true
        friendsImageStackView.leadingAnchor.constraint(equalTo: totalPaymentLabel.leadingAnchor).isActive = true
        friendsImageStackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        friendsImageStackView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        // constsraints for payment status
        paymentStatusView.view.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        paymentStatusView.view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        paymentStatusView.view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        paymentStatusView.view.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}


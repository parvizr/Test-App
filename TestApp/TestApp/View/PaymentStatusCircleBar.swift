//
//  LastMonthCell.swift
//  TestApp
//
//  Created by javad on 21.04.22.
//

import UIKit

class PaymentStatusCircleBar: UIView {
    let view = UIView()
    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    let percentLabel = UILabel()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Paid", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor : UIColor.gray])
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        setupLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCirclePath(toValue: CGFloat) {
        
        let circularPathForTrackLayer = UIBezierPath(arcCenter: CGPoint(x: 25, y: 25), radius: 25, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPathForTrackLayer.cgPath
        trackLayer.strokeColor = UIColor.systemGray4.cgColor
        trackLayer.lineWidth = 3
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)
        
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 25, y: 25), radius: 25, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(shapeLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        shapeLayer.strokeEnd = 0
        basicAnimation.toValue = toValue / 100
        if toValue == 100 {
            shapeLayer.strokeColor = UIColor.orange.cgColor
        } else {
            shapeLayer.strokeColor = UIColor.black.cgColor
        }
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "animationForStroke")
    }
    
    func setPercent(percent: String) {
        percentLabel.attributedText = NSAttributedString(string: percent + "%", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)])
        percentLabel.textAlignment = .center
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLabels() {
        view.addSubview(percentLabel)
        view.addSubview(textLabel)
        
        // constrait for the label inside payment status view
        percentLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        percentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor/*, constant: 6*/).isActive = true
        percentLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        percentLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        // constrtaint for the paid text under the percentage
        textLabel.topAnchor.constraint(equalTo: percentLabel.bottomAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: percentLabel.leadingAnchor, constant: 1).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
}


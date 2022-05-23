//
//  BillListController.swift
//  TestApp
//
//  Created by javad on 21.04.22.
//

import UIKit

class paymentStatusView: UIView {
  

}

class BillListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let thisMonthHeaderID = "thisMonthHeaderID"
    let billListCellID = "billListCellID"
    let billListHeaderID = "billListHeaderID"
   
    let black = UIImage.SymbolConfiguration(weight: .bold)
    
    var request = APIRequests()
    var billList = [BillList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // this code help to remove navigation bar bottom line
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        navigationItem.title = "Bill List"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor : UIColor.black]
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward", withConfiguration: black)?.withTintColor(UIColor.black, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(backHandler))
       
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false

        collectionView.register(ThisMonthHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: thisMonthHeaderID)
        collectionView.register(BillListCellView.self, forCellWithReuseIdentifier: billListCellID)
        collectionView.register(BillListHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: billListHeaderID)

        
        request.requestAPIForBillList { data in
            DispatchQueue.main.async {
                [self] in
                billList = data
                collectionView.reloadData()
            }
        }
    }
    
    @objc func backHandler() {
        self.navigationController?.popViewController(animated: true)
        
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if billList.count == 0 {
            return billList.count
        }else if section == 0 {
            return billList[0].thisMonth.count
        } else {
            return billList[0].lastMonth.count
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let thisMonthHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: thisMonthHeaderID, for: indexPath) as! ThisMonthHeader
            return thisMonthHeader
        } else {
            let lastMonthHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: billListHeaderID, for: indexPath) as! BillListHeader
            lastMonthHeader.setupMonthLabel(monthString: "Last Month")
            return lastMonthHeader
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let imageURLString = billList[0].thisMonth[indexPath.row].friends[0].avatarURL
            let titleStringUrl = billList[0].thisMonth[indexPath.row].title
            let totalPaymentStringUrl = billList[0].thisMonth[indexPath.row].totalPayment
            let percentNumber = Int(billList[0].thisMonth[indexPath.row].percent)
            let thisMonthCell = collectionView.dequeueReusableCell(withReuseIdentifier: billListCellID, for: indexPath) as! BillListCellView
            
            thisMonthCell.setupActivityImage(backgroundColor: UIColor.systemTeal)
            thisMonthCell.setupTitle(titleString: titleStringUrl)
            thisMonthCell.setupTotalPayment(totalPaymentString: totalPaymentStringUrl)
            thisMonthCell.configurePictures(with: imageURLString)
            thisMonthCell.paymentStatusView.setCirclePath(toValue: CGFloat(percentNumber!))
            thisMonthCell.paymentStatusView.setPercent(percent: billList[0].thisMonth[indexPath.row].percent)
            thisMonthCell.billListController = self
            return thisMonthCell
        } else {
            let imageURLString = billList[0].lastMonth[indexPath.row].friends[0].avatarURL
            let titleStringUrl = billList[0].lastMonth[indexPath.row].title
            let totalPaymentStringUrl = billList[0].lastMonth[indexPath.row].totalPayment
            let percentNumber = Int(billList[0].lastMonth[indexPath.row].percent)
            let lastMonthCell = collectionView.dequeueReusableCell(withReuseIdentifier: billListCellID, for: indexPath) as! BillListCellView
            
            lastMonthCell.setupActivityImage(backgroundColor: UIColor.systemGray6)
            lastMonthCell.setupTitle(titleString: titleStringUrl)
            lastMonthCell.setupTotalPayment(totalPaymentString: totalPaymentStringUrl)
            lastMonthCell.configurePictures(with: imageURLString)
            lastMonthCell.paymentStatusView.setCirclePath(toValue: CGFloat(percentNumber!))
            lastMonthCell.paymentStatusView.setPercent(percent: billList[0].lastMonth[indexPath.row].percent)
            lastMonthCell.billListController = self
            return lastMonthCell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: view.frame.width, height: 100)
        } else {
            return CGSize(width: view.frame.width, height: 50)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 100)
        } else {
            return CGSize(width: view.frame.width, height: 100)
        }
        
        
    }
    
    let navBarCoverView = UIView()
    let zoomingView = UIView()
    let blackBackgroundView = UIView()
    var activityImageView: UIImageView?
    
    func animateActivityImageview(activityImageView: UIImageView) {
        
        self.activityImageView = activityImageView
        
        if let startingFrame = activityImageView.superview?.convert(activityImageView.frame, to: nil) {
            
            activityImageView.alpha = 0
            
            blackBackgroundView.frame = self.view.frame
            blackBackgroundView.backgroundColor = .black
            blackBackgroundView.alpha = 0
            view.addSubview(blackBackgroundView)
            
            zoomingView.backgroundColor = activityImageView.backgroundColor
            zoomingView.frame = activityImageView.frame
            zoomingView.isUserInteractionEnabled = true
            zoomingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(zoomOut)))
            view.addSubview(zoomingView)
            
            if let keyWindow = UIApplication.shared.keyWindow {
                navBarCoverView.frame = CGRect(x: 0, y: 0, width: 1000, height: 128)
                navBarCoverView.backgroundColor = .black
                navBarCoverView.alpha = 0
                keyWindow.addSubview(navBarCoverView)
            }
            
            UIView.animate(withDuration: 0.75) {
                let height = (self.view.frame.width / startingFrame.width) * startingFrame.height
                let y = self.view.frame.height / 2 - height / 2
                self.zoomingView.frame = CGRect(x: 0, y: y, width: self.view.frame.width, height: height)
                self.blackBackgroundView.alpha = 1
                self.navBarCoverView.alpha = 1
            }
        }
    }
    
    @objc func zoomOut(){
        
        if let startingFrame = activityImageView?.superview?.convert(activityImageView!.frame, to: nil) {
            
            UIView.animate(withDuration: 0.75) {
                self.zoomingView.frame = startingFrame
                self.blackBackgroundView.alpha = 0
                self.navBarCoverView.alpha = 0
            } completion: { (didComplete) in
                self.zoomingView.removeFromSuperview()
                self.blackBackgroundView.removeFromSuperview()
                self.navBarCoverView.removeFromSuperview()
                self.activityImageView?.alpha = 1
            }
        }
    }
}

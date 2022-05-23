//
//  ViewController.swift
//  TestApp
//
//  Created by javad on 19.04.22.
//

import UIKit


class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let balanceCellID = "balanceCellID"
    let friendsCellID = "friendsCellID"
    let activityCellID = "activityCellID"
    let activityHeaderID = "activityHeaderID"
    
    var request = APIRequests()
    var account = [Account]()
    var activity = [Activity]()
    
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Menu").withRenderingMode(.alwaysOriginal), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 20).isActive = true
        return button
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        // this code help to remove navigation bar bottom line
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        collectionView.register(BalanceCell.self, forCellWithReuseIdentifier: balanceCellID)
        collectionView.register(FriendsCell.self, forCellWithReuseIdentifier: friendsCellID)
        collectionView.register(ActivityCell.self, forCellWithReuseIdentifier: activityCellID)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: activityHeaderID)
        
        setupNavigationBarItems()
        configureImage()
        
//         request to API
        request.requestAPIForTotalBillInformation { data in
            DispatchQueue.main.async {
                [self] in
                account = data
                collectionView.reloadData()
            }
        }
        
        request.requestAPI { data in
            DispatchQueue.main.async {
                [self] in
                activity = data
                collectionView.reloadData()
            }
            
        }

        
        
    }
    
    func configureImage() {
        guard let url = URL(string: "http://placeimg.com/640/480") else {return}
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self?.profileImageView.image = image
            }
        }.resume()
    }
    
    
    func setupNavigationBarItems() {
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return account.count
        } else if section == 1 {
            return 1
        } else {
            return activity.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let balanceCell = collectionView.dequeueReusableCell(withReuseIdentifier: balanceCellID, for: indexPath) as! BalanceCell
            if let balance = account[indexPath.row].balance {
                balanceCell.balanceAmountLabel.text = "$\(balance)"
            }
            if let totalBill = account[indexPath.row].totalBill {
                balanceCell.totalBillAmountLabel.text = "$\(totalBill)"
            }
            let optionalNumber = account[indexPath.row].split
            if let number = optionalNumber {
                balanceCell.splitToLabelAmount.text = "\(number)"
            } else {
                
            }
            return balanceCell
        } else  if indexPath.section == 1 {
            let friendsCell = collectionView.dequeueReusableCell(withReuseIdentifier: friendsCellID, for: indexPath) as! FriendsCell
            return friendsCell
        } else {
            let activityCell = collectionView.dequeueReusableCell(withReuseIdentifier: activityCellID, for: indexPath) as! ActivityCell
            activityCell.activityNameLabel.text = activity[indexPath.row].title
            activityCell.dateLabel.text = activity[indexPath.row].date
            activityCell.timeLabel.text = activity[indexPath.row].date
            if activity[indexPath.row].type == true {
                let amount = activity[indexPath.row].amount!
                let concatenate = "+" + "\(amount)"
                activityCell.amountOfPaymentLabel.text = concatenate
                activityCell.arrowImageView.backgroundColor = .darkGray
                activityCell.arrowImageView.image = UIImage(systemName: "arrow.up.to.line")?.withTintColor(UIColor.black).withRenderingMode(.alwaysOriginal)
            } else {
                let amount = activity[indexPath.row].amount!
                let concatenate = "-" + "\(amount)"
                activityCell.amountOfPaymentLabel.text = concatenate
                activityCell.arrowImageView.image = UIImage(systemName: "arrow.down.to.line")?.withTintColor(.black).withRenderingMode(.alwaysOriginal)
                activityCell.arrowImageView.backgroundColor = .lightGray
            }
            return activityCell
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: activityHeaderID, for: indexPath) as! SectionHeader
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        if section == 0 {
            return .zero
        } else if section == 1 {
            return .zero
        } else {
            return CGSize(width: view.frame.width, height: 30)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 220)
        } else if indexPath.section == 1 {
            return CGSize(width: view.frame.width, height: 120)
        } else {
            return CGSize(width: view.frame.width, height: 50)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            
            let billListViewController = BillListController(collectionViewLayout: UICollectionViewFlowLayout())
            billListViewController.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(billListViewController, animated: true)        
        }
    }


}


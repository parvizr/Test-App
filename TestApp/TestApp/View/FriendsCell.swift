//
//  FriendsCell.swift
//  TestApp
//
//  Created by javad on 20.04.22.
//

import UIKit

class FriendsCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var request = APIRequests()
    var friend = [Friends]()
   
    
    let imageCellID = "imageCellID"
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Search").withRenderingMode(.alwaysOriginal), for: .normal)
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSAttributedString(string: "Friends share", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.attributedPlaceholder = attributedText
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.rightView = button
        textField.rightViewMode = .always
        return textField
    }()
    
    let imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
            request.requestAPIForFriends { data in
            DispatchQueue.main.async {[self] in
                friend = data
                imageCollectionView.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .clear
        addSubview(searchTextField)
        addSubview(imageCollectionView)
        
        imageCollectionView.dataSource = self
        imageCollectionView.delegate = self
        
        imageCollectionView.register(ImageCell.self, forCellWithReuseIdentifier: imageCellID)
        
        // constraints for search textfield, which is on the image collection view
        searchTextField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 13).isActive = true
        searchTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -13).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        // constraints for the collection View, which is located inside of the FriendCell
        imageCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        imageCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        imageCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        imageCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friend.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = friend[indexPath.row].avatar
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellID, for: indexPath) as! ImageCell
        cell.nameLabel.text = friend[indexPath.row].name
        cell.configureImage(with: imageURLString!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 100)
    }
    
}

class ImageCell: UICollectionViewCell {
    
    let friendImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.backgroundColor = .green
//        imageView.image = #imageLiteral(resourceName: "Plus").withTintColor(.lightGray)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 0.2
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.cornerRadius = 38
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Alex", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)])
        label.textAlignment = .center
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
    
    func configureImage(with urlString: String) {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self?.friendImageView.image = image
            }
        }.resume()
    }
    
    func setupViews() {
        backgroundColor = .clear
        addSubview(friendImageView)
        addSubview(nameLabel)
        
        // constraints for the image inside of the cell
        friendImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2).isActive = true
        friendImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2).isActive = true
        friendImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -22).isActive = true
        
        // constraints for names under the image
        nameLabel.topAnchor.constraint(equalTo: friendImageView.bottomAnchor, constant: 2).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
    }
}

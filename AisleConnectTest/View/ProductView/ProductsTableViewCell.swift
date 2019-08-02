//
//  ProductsTableViewCell.swift
//  AisleConnectTest
//
//  Created by letao_IOS_2 on 2019/7/30.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    let bookImageView = UIImageView()
    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.accessoryType = .disclosureIndicator
        
        self.addSubview(bookImageView)
        NSLayoutConstraint(item: bookImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: bookImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: bookImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80).isActive = true
        NSLayoutConstraint(item: bookImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80).isActive = true
        bookImageView.contentMode = .scaleAspectFit
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLabel)
        NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: bookImageView, attribute: .trailing, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 30).isActive = true
        NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        titleLabel.textColor = UIColor.blue
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(subTitleLabel)
        NSLayoutConstraint(item: subTitleLabel, attribute: .leading, relatedBy: .equal, toItem: bookImageView, attribute: .trailing, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: subTitleLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -20).isActive = true
        NSLayoutConstraint(item: subTitleLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        subTitleLabel.textColor = UIColor.black
        subTitleLabel.font = UIFont.systemFont(ofSize: 14)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateView(data: ProductData){
        titleLabel.text = data.name
        var authorName = ""
        for author in data.authors{
            if let last = data.authors.last{
                if data.authors.count != 1 && author != last{
                    authorName = authorName + author + ", "
                }else{
                    authorName = authorName + author
                }
            }
        }
        subTitleLabel.text = authorName
        
        DispatchQueue.global().async {
            if let imageURL = URL(string: data.imageUrl){
                do{
                    if let downlaodImage = UIImage(data: try Data(contentsOf: imageURL)) {
                        DispatchQueue.main.async{
                            self.bookImageView.image = downlaodImage
                        }
                    }
                }catch{
                    DispatchQueue.main.async {
                        self.bookImageView.image = UIImage(named: "error")
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.bookImageView.image = UIImage(named: "error")
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

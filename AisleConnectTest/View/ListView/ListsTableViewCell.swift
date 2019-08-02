//
//  ListsTableViewCell.swift
//  AisleConnectTest
//
//  Created by letao_IOS_2 on 2019/7/30.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import UIKit

class ListsTableViewCell: UITableViewCell {
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
        NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -10).isActive = true
        titleLabel.textColor = UIColor.blue
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(subTitleLabel)
        NSLayoutConstraint(item: subTitleLabel, attribute: .leading, relatedBy: .equal, toItem: bookImageView, attribute: .trailing, multiplier: 1.0, constant: 10).isActive = true
        NSLayoutConstraint(item: subTitleLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -20).isActive = true
        NSLayoutConstraint(item: subTitleLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -10).isActive = true
        subTitleLabel.textColor = UIColor.black
        subTitleLabel.lineBreakMode = .byWordWrapping
        subTitleLabel.numberOfLines = 0
        subTitleLabel.font = UIFont.systemFont(ofSize: 14)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateView(data: ListsData, count: Int){
        titleLabel.text = data.name
        subTitleLabel.text = "0 of \(count) books read"
        bookImageView.image = UIImage(named: "book")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

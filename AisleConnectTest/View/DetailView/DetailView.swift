//
//  DetailView.swift
//  AisleConnectTest
//
//  Created by letao_IOS_2 on 2019/8/1.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import UIKit

class DetailView: UIScrollView {
    let imageView = UIImageView()
    let contentLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        self.addSubview(imageView)
        NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.8, constant: 0).isActive = true
        NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.8, constant: 0).isActive = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(contentLabel)
        NSLayoutConstraint(item: contentLabel, attribute: .top, relatedBy: .equal, toItem: imageView, attribute: .bottom, multiplier: 1.0, constant: 50).isActive = true
        NSLayoutConstraint(item: contentLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: contentLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.8, constant: 0).isActive = true
        contentLabel.textColor = UIColor.black
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.numberOfLines = 0
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func updateView(data: DetailData){
        contentLabel.text = data.description
        DispatchQueue.global().async {
            if let imageURL = URL(string: data.imageUrl){
                do{
                    if let downlaodImage = UIImage(data: try Data(contentsOf: imageURL)) {
                        DispatchQueue.main.async{
                            self.imageView.image = downlaodImage
                        }
                    }
                }catch{
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(named: "error")
                    }
                }
            }else{
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(named: "error")
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

}

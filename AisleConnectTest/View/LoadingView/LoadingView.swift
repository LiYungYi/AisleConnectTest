//
//  LoadingView.swift
//  AisleConnectTest
//
//  Created by letao_IOS_2 on 2019/7/30.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    let loadingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(activityIndicator)
        self.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        NSLayoutConstraint(item: activityIndicator, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: activityIndicator, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.addSubview(loadingLabel)
        NSLayoutConstraint(item: loadingLabel, attribute: .top, relatedBy: .equal, toItem: activityIndicator, attribute: .bottom, multiplier: 1.0, constant: 5).isActive = true
        NSLayoutConstraint(item: loadingLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        loadingLabel.text = "讀取中"
        loadingLabel.textColor = UIColor.gray
        loadingLabel.font = UIFont.systemFont(ofSize: 14)
        loadingLabel.textAlignment = .center
        loadingLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

}

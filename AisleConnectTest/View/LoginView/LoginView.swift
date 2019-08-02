//
//  LoginView.swift
//  AisleConnectTest
//
//  Created by letao_IOS_2 on 2019/7/30.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewDelegate: AnyObject{
    func recordInputEmailAndPassWord(email: String, password: String)
    func login(email: String, password: String)
    func popAlert(title: String, message: String)
}

class LoginView: UIView, UITextFieldDelegate {
    weak var delegate: LoginViewDelegate?
    let accountTextField = UITextField()
    let passwordTextField = UITextField()
    let loginBtn = UIButton()
    
    var email = ""
    var password = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(accountTextField)
        NSLayoutConstraint(item: accountTextField, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: -100).isActive = true
        NSLayoutConstraint(item: accountTextField, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: accountTextField, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        NSLayoutConstraint(item: accountTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        accountTextField.delegate = self
        accountTextField.placeholder = "E-mail"
        accountTextField.font = UIFont.systemFont(ofSize: 14)
        accountTextField.textColor = UIColor.black
        accountTextField.layer.borderWidth = 0.5
        accountTextField.layer.borderColor = UIColor.lightGray.cgColor
        accountTextField.layer.cornerRadius = 3
        accountTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(passwordTextField)
        NSLayoutConstraint(item: passwordTextField, attribute: .top, relatedBy: .equal, toItem: accountTextField, attribute: .bottom, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: passwordTextField, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: passwordTextField, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        NSLayoutConstraint(item: passwordTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
        passwordTextField.delegate = self
        passwordTextField.placeholder = "密碼"
        passwordTextField.font = UIFont.systemFont(ofSize: 14)
        passwordTextField.textColor = UIColor.black
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.cornerRadius = 3
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(loginBtn)
        NSLayoutConstraint(item: loginBtn, attribute: .top, relatedBy: .equal, toItem: passwordTextField, attribute: .bottom, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: loginBtn, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: loginBtn, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
        NSLayoutConstraint(item: loginBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 45).isActive = true
        loginBtn.setTitle("登入", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        loginBtn.backgroundColor = UIColor.blue
        loginBtn.layer.cornerRadius = 3
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let email = accountTextField.text{
            self.email = email
        }
        if let password = passwordTextField.text{
            self.password = password
        }
        delegate?.recordInputEmailAndPassWord(email: email, password: password)
    }
    
    @objc func login(){
        self.endEditing(true)
        if email.trimmingCharacters(in: .whitespacesAndNewlines) == "" && password.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            delegate?.popAlert(title: "請輸入E-mail及密碼", message: "")
            return
        }else if email.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            delegate?.popAlert(title: "請輸入E-mail", message: "")
            return
        }else if password.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            delegate?.popAlert(title: "請輸入密碼", message: "")
            return
        }
        delegate?.login(email: email, password: password)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}

//
//  LoginVC.swift
//  AisleConnectTest
//
//  Created by letao_IOS_2 on 2019/7/30.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, LoginViewDelegate {
    let loginView = LoginView()
    var loginData: LoginData!
    var loadingView: LoadingView!
    
    var email = ""
    var password = ""
    
    let webAddress = "https://apistage2.aisleconnect.us/ac.server/oauth/token"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubView()
        navigationItem.title = "Login"
    }
    
    func login(email: String, password: String) {
        APIService.shared.postJsonDataFromServer(urlString: webAddress, parameter: "grant_type=password&username=\(email)&password=\(password)&client_id=my-client&client_secret=my-secret&scope=read", handler: loginHandler)
        loadingView = LoadingView(frame: self.view.frame)
        self.view.addSubview(loadingView)
    }
    
    private func loginHandler(data: Data?){
        let outputDic = APIService.shared.serializeJsonData(data: data)
        loginData = LoginData(with: outputDic)
        if loginData.error == nil && loginData.error_description == nil{
            let listVC = ListsVC()
            listVC.loginData = loginData
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(listVC, animated: true)
                self.loadingView?.removeFromSuperview()
                self.loadingView = nil
            }
        }else{
            DispatchQueue.main.async {
                self.popAlert(title: "帳號或密碼有誤", message: "")
                self.loadingView?.removeFromSuperview()
                self.loadingView = nil
            }
        }
    }
    
    func recordInputEmailAndPassWord(email: String, password: String){
        self.email = email
        self.password = password
    }
    
    func popAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "確定", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    private func initSubView(){
        self.view.addSubview(loginView)
        NSLayoutConstraint(item: loginView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: loginView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: loginView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: loginView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        loginView.delegate = self
        loginView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

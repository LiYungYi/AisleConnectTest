//
//  DetaiilVC.swift
//  AisleConnectTest
//
//  Created by letao_IOS_2 on 2019/8/1.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UIScrollViewDelegate {
    let detailView = DetailView()
    var loadingView: LoadingView!
    
    var loginData: LoginData!
    var detailData: DetailData!
    
    var mainTitle = ""
    var id = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadDetailData()
        navigationItem.title = mainTitle
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        initSubView()
    }
    
    private func downloadDetailData(){
        APIService.shared.getJsonDataFromServer(urlString: "https://apistage2.aisleconnect.us/ac.server/rest/v2.5/product/\(id)", parameter: "Bearer \(loginData.access_token!)", handler: downloadDetailDataHandler)
        loadingView = LoadingView(frame: self.view.frame)
        self.view.addSubview(loadingView)
    }
    
    private func downloadDetailDataHandler(data: Data?){
        let dic = APIService.shared.serializeJsonData(data: data)
        detailData = DetailData(with: dic)
        DispatchQueue.main.async {
            if self.detailData != nil{
                self.detailView.updateView(data: self.detailData)
            }else{
                popAlert("無資料", message: "") { [weak self] in
                    DispatchQueue.main.async {
                        self?.navigationController?.popViewController(animated: true)
                    }
                }
                return
            }
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }
    
    private func initSubView(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(detailView)
        NSLayoutConstraint(item: detailView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: detailView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: detailView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: detailView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        detailView.delegate = self
        detailView.isScrollEnabled = true
        detailView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 2)
        detailView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

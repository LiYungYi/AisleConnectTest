//
//  ProductsVC.swift
//  AisleConnectTest
//
//  Created by letao_IOS_2 on 2019/7/30.
//  Copyright © 2019 李泳逸. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    var loadingView: LoadingView!
    
    var loginData: LoginData!
    var productData: ProductData!
    var productDatas = [ProductData]()
    
    var mainTitle = ""
    var id = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        initSubView()
        downloadProductsData()
        navigationItem.title = mainTitle
    }
    
    private func downloadProductsData(){
        APIService.shared.getJsonDataFromServer(urlString: "https://apistage2.aisleconnect.us/ac.server/rest/v2.5/checklist/\(id)", parameter: "Bearer \(loginData.access_token!)", handler: downloadProductsDataHandler)
        loadingView = LoadingView(frame: self.view.frame)
        self.view.addSubview(loadingView)
    }
    
    private func downloadProductsDataHandler(data: Data?){
        let dic = APIService.shared.serializeJsonData(data: data)
        if let data = dic["data"] as? [String: Any],
            let products = data["products"] as? [[String: Any]]{
            for product in products{
                productData = ProductData(with: product)
                productDatas.append(productData)
            }
        }
        if productDatas.count == 0{
            popAlert("無資料", message: "") { [weak self] in
                DispatchQueue.main.async {
                    self?.navigationController?.popViewController(animated: true)
                }
            }
            return
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsCell", for: indexPath) as! ProductsTableViewCell
        cell.updateView(data: productDatas[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detaiilVC = DetailVC()
        detaiilVC.loginData = loginData
        detaiilVC.mainTitle = productDatas[indexPath.row].name
        detaiilVC.id = productDatas[indexPath.row].id
        navigationController?.pushViewController(detaiilVC, animated: true)
    }
    
    private func initSubView(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(tableView)
        NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: "ProductsCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

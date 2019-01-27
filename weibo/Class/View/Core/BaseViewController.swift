//
//  BaseViewController.swift
//  weibo
//
//  Created by YZH on 2019/1/5.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    //声明一个访客试图
    var userLogin : UserLogin?
    //判断用户是否登陆
    let userName:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        view.backgroundColor = UIColor.init(red: CGFloat(arc4random()%256)/255.0,
                                            green: CGFloat(arc4random()%256)/255.0,
                                            blue: CGFloat(arc4random()%256)/255.0,
                                            alpha: 1.0)
        //添加访客试图
        setupUserLoginView()
       
        let tab = UITableView(frame:  CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), style: .plain)
        tab.backgroundColor = UIColor.orange
        //判断是否登陆
        userName ? view.addSubview(tab):setupUserLoginView()
    }
    
    func setupUserLoginView(){
        userLogin = UserLogin(frame: view.bounds)
        view.insertSubview(userLogin!, belowSubview: UINavigationBar())
    }
    
}

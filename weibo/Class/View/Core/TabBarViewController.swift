//
//  TabBarViewController.swift
//  weibo
//
//  Created by YZH on 2018/12/9.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    ///MARK :定义中间的按钮
    lazy var centerButton : UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加控制器
        setUpController()
        self.automaticallyAdjustsScrollViewInsets = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //添加中间按钮
        setupCenterButton()
    }

    func setUpController(){
        addChildViewController(viewController:"HomeViewController", title: "首页", imageName: "Tabbar_bookShelf_Highlighted")
        addChildViewController(viewController:"DiscoverViewController", title: "发现", imageName: "Tabbar_category_Highlighted")
        //添加中间的控制器
        addChildViewController(CenterViewController())
        addChildViewController(viewController:"MessageViewController", title: "消息", imageName: "Tabbar_leaderboard_Highlighted")
        addChildViewController(viewController:"MainViewController", title: "我", imageName: "Tabbar_more_Highlighted")
    }
}

extension TabBarViewController{
    func setupCenterButton(){
//        //设置背景图片
//        centerButton.setBackgroundImage(UIImage.init(named: "SplashX"), for: .normal)
//        centerButton.setBackgroundImage(UIImage.init(named: "SplashX"), for: .highlighted)
        //设置按钮图片
        centerButton.setImage(UIImage.init(named: "SplashX"), for: .normal)
        centerButton.setImage(UIImage.init(named: "SplashX"), for: .highlighted)
        centerButton.addTarget(self, action: #selector(centerButtonClick), for: .touchUpInside)
        tabBar.addSubview(centerButton)
        //设置frame
        //1.计算按钮宽度
        let btnWidth = tabBar.bounds.size.width/CGFloat((viewControllers?.count)!)-1
        //2.创建frame
        let rect = CGRect(x: 0, y: 0, width: btnWidth, height: tabBar.bounds.size.height)
        centerButton.frame = rect.offsetBy(dx: btnWidth * 2, dy: 0)
    }
    
    @objc func centerButtonClick(){
        print("123")
    }
    
}

// MARK:控制器
extension TabBarViewController{
    ///同来创建控制器
    /// viewController : 子控制器
    /// title：标题
    /// imageName：图片名
    func addChildViewController(viewController : String,title : String,imageName : String) {
        //1.动态获取命名空间
        let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as! String
        //2.告诉编译器真实的类型是class
        let cls : AnyClass = NSClassFromString(nameSpace + "." + viewController)!
        //3.告诉编译器真实的类型是UIViewController
        let vsCls = cls as! UIViewController.Type
        //4.实例化控制器
        let vc = vsCls.init()
        //5.从内到外设置
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named: imageName)
        //6.设置文字效果
        self.tabBar.tintColor = UIColor.black
        //7.创建导航控制器
        let nav =   NavViewController(rootViewController: vc)
        //8.把子控制器添加到导航控制器中
        //nav.addChildViewController(vc)
        //9.把导航控制器添加到tabbar控制器中
        self.addChildViewController(nav)
    }
}

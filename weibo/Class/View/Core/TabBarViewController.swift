//
//  TabBarViewController.swift
//  weibo
//
//  Created by YZH on 2018/12/9.
//  Copyright © 2018年 YZH. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpController()
        // Do any additional setup after loading the view.
    }

    func setUpController(){
        addChildViewController(viewController:"HomeViewController", title: "首页", imageName: "")
        addChildViewController(viewController:"DiscoverViewController", title: "发现", imageName: "")
        addChildViewController(viewController:"MessageViewController", title: "消息", imageName: "")
        addChildViewController(viewController:"MainViewController", title: "我", imageName: "")
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
       // vc.tabBarItem.selectedImage = UIImage.init(named: <#T##String#>)
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

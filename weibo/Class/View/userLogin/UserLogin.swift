//
//  UserLogin.swift
//  weibo
//
//  Created by YZH on 2019/1/14.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

class UserLogin: UIView {
    //MARK:私有空间
    //每次登陆都要判断，所以要懒加载，只要有就不必创建
    lazy var iconView:UIImageView = UIImageView.init(image: UIImage.init(named: "Tabbar_more_Normal"))
    
    //注册按钮
    lazy var registerBtn : UIButton = {
        let registerBtn = UIButton(type: UIButtonType.custom)
        registerBtn.setTitleColor(UIColor.orange, for: .normal)
        registerBtn.setTitle("注册", for: .normal)
        registerBtn.setTitleColor(UIColor.black, for: .highlighted)
        return registerBtn
    }()
    
    //提示标签
    lazy var tipLabel : UILabel = {
        let tipLabel = UILabel()
        tipLabel.text = "关注一些人，回来这里看看"
        tipLabel.font = UIFont.systemFont(ofSize: 14)
        tipLabel.textColor = UIColor.darkGray
        tipLabel.numberOfLines = 0
        tipLabel.sizeToFit()
        return tipLabel
    }()
    
    //按钮
    lazy var loginBtn : UIButton = {
        let loginBtn = UIButton(type: UIButtonType.custom)
        loginBtn.setTitleColor(UIColor.darkGray, for: .normal)
        loginBtn.setTitle("登陆", for: .normal)
        loginBtn.setTitleColor(UIColor.black, for: .highlighted)
        return loginBtn
    }()
    
    func startAnimation(){
        //1.创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        //2.设置动画属性
        anim.toValue = 2 * Double.pi
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        //false下次再通过set方法设定动画属性时，将在此使用你的动画而非默认动画
        anim.isRemovedOnCompletion = false
        //添加动画
        iconView.layer.add(anim, forKey: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        startAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UserLogin{
    func setUI() {
        //1.添加子控件
        self.addSubview(iconView)
        self.addSubview(tipLabel)
        self.addSubview(registerBtn)
        self.addSubview(loginBtn)
        
        //2.界面布局
        //1.在layoutSubView用纯代码实现
        //2.用Xib布局
        //3.用自动布局
        
        //取消autoresizing
        for v in self.subviews {
            v.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //3.自动布局
        
        //iconView
        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerX,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerX,
                                         multiplier: 1.0,
                                         constant: 0))


        addConstraint(NSLayoutConstraint(item: iconView,
                                         attribute: .centerY,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .centerY,
                                         multiplier: 1.0,
                                         constant: -60))
        
        addConstraint(NSLayoutConstraint(item: iconView,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 236))
        
        //tipLabel
        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .right,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .right,
                                         multiplier: 1.0,
                                         constant: 0))

        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: iconView,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 20))

        addConstraint(NSLayoutConstraint(item: tipLabel,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 236))

        //registerBtn
        addConstraint(NSLayoutConstraint(item: registerBtn,
                                         attribute: .left,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .left,
                                         multiplier: 1.0,
                                         constant: 0))

        addConstraint(NSLayoutConstraint(item: registerBtn,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 30))

        addConstraint(NSLayoutConstraint(item: registerBtn,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                    attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 100))

        addConstraint(NSLayoutConstraint(item: registerBtn,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: nil,
                                    attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 30))

        //loginBtn
        addConstraint(NSLayoutConstraint(item: loginBtn,
                                         attribute: .right,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .right,
                                         multiplier: 1.0,
                                         constant: 0))

        addConstraint(NSLayoutConstraint(item: loginBtn,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: tipLabel,
                                         attribute: .bottom,
                                         multiplier: 1.0,
                                         constant: 30))

        addConstraint(NSLayoutConstraint(item: loginBtn,
                                         attribute: .width,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 100))

        addConstraint(NSLayoutConstraint(item: loginBtn,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: 30))
        
        //阴影图层VFL
    }
}

//
//  ViewController.swift
//  SwiftDemo
//
//  Created by LiQunFei on 2020/8/18.
//  Copyright © 2020 IlreldI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _initMyScrollView();
    }


    func _initMyScrollView() -> Void {
        
        var stateH: CGFloat = 0
        if #available(iOS 13.0, *) {
            stateH = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        }
        else {
            stateH = UIApplication.shared.statusBarFrame.size.height
        }
        let navH: CGFloat = navigationController?.navigationBar.frame.height ?? 0
        let scrollX: CGFloat = 20
        let scrollW: CGFloat = (UIScreen.main.bounds.width - scrollX*2)
        let scrollBottom: CGFloat = 34
        let scrollY: CGFloat = stateH + navH + 10
        let scrollH: CGFloat = view.bounds.height - scrollY - scrollBottom
        let scrollRect: CGRect = CGRect.init(x: scrollX, y: scrollY, width: scrollW, height: scrollH)
        
        let myScrollView: UIScrollView = UIScrollView.init(frame: scrollRect)
        myScrollView.backgroundColor = UIColor.init(red: 1, green: 0.776, blue: 0.286, alpha: 0.1)
        
        view.addSubview(myScrollView)
        
        var myContentSize: CGSize = CGSize.zero
        let contentW: CGFloat = scrollW
        var contentH: CGFloat = 0
        
        let x: CGFloat = 50.0
        let verSpace: CGFloat = 20
        let w: CGFloat = (scrollW - x*2)
        let h: CGFloat = 44
        
        
        let frame1 = CGRect.init(x: x, y: verSpace, width: w, height: h)
        let btn1 = _myButton(title: "关于", frame: frame1, action: #selector(_aboutSwift))
        myScrollView.addSubview(btn1)
        
        contentH += (verSpace + h)
        
        myContentSize = CGSize.init(width: contentW, height: contentH)
        myScrollView.contentSize = myContentSize
        
    }
    
    @objc func _aboutSwift() -> Void  {
        self.navigationController?.pushViewController(AboutSwiftVC.init(), animated: true)
    }
    
    func _myButton(title: String, frame: CGRect, action: Selector) -> UIButton {
        
        let btn: UIButton = UIButton.init(type: .system)
        btn.setTitle(title, for: .normal)
        btn.frame = frame
        btn.addTarget(self, action: action, for: .touchUpInside)
        let titleColor = UIColor.init(red: 0.125, green: 0.667, blue: 0.886, alpha: 1)
        btn.setTitleColor(titleColor, for: .normal)
        btn.contentHorizontalAlignment = .right
        btn.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
        btn.contentHorizontalAlignment = .left
        return btn
        
    }
    
}



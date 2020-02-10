//
//  BaseViewController.swift
//  casualNote
//
//  Created by 胡俊峰 on 2/8/20.
//  Copyright © 2020 CasualNotes. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = RGBColorBase()
        navigationController?.navigationBar.tintColor = .white

    }
    
    
    func setTitleLabelWithTitle(title: String) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 17.0)
        titleLabel.backgroundColor = .clear
        titleLabel.textAlignment = .center
        
        navigationItem.titleView = titleLabel
        
    }

}

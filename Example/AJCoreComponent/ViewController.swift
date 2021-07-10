//
//  ViewController.swift
//  AJCoreComponent
//
//  Created by arun.tell6@gmail.com on 07/10/2021.
//  Copyright (c) 2021 arun.tell6@gmail.com. All rights reserved.
//

import UIKit
import AJCoreComponent
import SnapKit

class ViewController: UIViewController {
    let customField = AJTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        build()
    }

    func build() {
        self.view.addSubview(customField)
        
        customField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leftMargin.rightMargin.equalToSuperview()
            make.height.equalTo(70)
        }
        customField.borderColor = .brown
        customField.cornerRadius = 3.0
        customField.placeholder = "Username"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


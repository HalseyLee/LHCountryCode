//
//  ViewController.swift
//  LHCountryCode
//
//  Created by hope on 2017/12/18.
//  Copyright © 2017年 Halsey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func pushAction(_ sender: UIButton) {
        let countryCodeVC = LHCountryCodeController()
        self.navigationController?.pushViewController(countryCodeVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


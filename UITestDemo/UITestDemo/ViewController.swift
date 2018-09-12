//  ViewController.swift
//  Created on 2018/9/7
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewDetailButton: UIButton!
    
    @IBAction func switchValueChanged(_ sender: Any, forEvent event: UIEvent) {
        viewDetailButton.isEnabled = (sender as! UISwitch).isOn
        viewDetailButton.alpha = (sender as! UISwitch).isOn ? 1 : 0.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


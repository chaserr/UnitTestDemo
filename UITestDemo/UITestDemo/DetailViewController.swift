//  DetailViewController.swift
//  Created on 2018/9/7
//  Description <#文件描述#>

//  Copyright © 2018年 Huami inc. All rights reserved.
//  @author tongxing(tongxing@huami.com)

import UIKit

class DetailViewController: UIViewController {
    var value = 0

    @IBOutlet var valueLabel: UILabel!
    
    @IBAction func incrementTapped(_ sender: Any) {
        value = value + 1
        valueLabel.text = "\(value)"
        valueLabel.accessibilityValue = valueLabel.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

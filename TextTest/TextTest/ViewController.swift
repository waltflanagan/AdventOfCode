//
//  ViewController.swift
//  TextTest
//
//  Created by Michael Simons on 4/4/16.
//  Copyright © 2016 Michael Simons. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textaccessory: UIView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    
    textField.inputAccessoryView = textaccessory
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


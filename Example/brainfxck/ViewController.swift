//
//  ViewController.swift
//  brainfxck
//
//  Created by johnlinvc on 09/28/2016.
//  Copyright (c) 2016 johnlinvc. All rights reserved.
//

import UIKit
import brainfxck


class ViewController: UIViewController {

    @IBOutlet weak var outputText: UITextView!
    @IBOutlet weak var inputField: UITextView!
    @IBOutlet weak var codeField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func runPressed(_ sender: AnyObject) {
        let code = codeField!.text ?? ""
        let brainFxck = Brainfxck(code: code)
        let res = brainFxck.eval(input: inputField.text ?? "")
        outputText.text = res
    }
    
    @IBAction func helloPressed(_ sender: AnyObject) {
        codeField.text = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


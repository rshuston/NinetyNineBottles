//
//  ViewController.swift
//  NinetyNineBottles
//
//  Created by Robert Huston on 8/4/21.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var o_numberComboBox: NSComboBox!
    @IBOutlet weak var o_singButton: NSButton!
    @IBOutlet weak var o_stfuButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        o_numberComboBox.stringValue = "99"
        
        o_singButton.isEnabled = true
        o_stfuButton.isEnabled = false
    }

    @IBAction func singButtonSelected(_ sender: Any) {
        o_singButton.isEnabled = false
        o_stfuButton.isEnabled = true
    }
    
    @IBAction func stfuButtonSelected(_ sender: Any) {
        o_singButton.isEnabled = true
        o_stfuButton.isEnabled = false
    }
    
}


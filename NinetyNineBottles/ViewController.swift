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
    
    let songPlayer = SongPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        o_numberComboBox.stringValue = "99"
        
        o_singButton.isEnabled = true
        o_stfuButton.isEnabled = false
    }
    
    override func viewWillAppear() {
        self.view.window?.center()
    }

    @IBAction func singButtonSelected(_ sender: Any) {
        o_singButton.isEnabled = false
        o_stfuButton.isEnabled = true
        
        songPlayer.Start {
            if let value = Int(self.o_numberComboBox.stringValue.replacingOccurrences(of: ",", with: "")) {
                return value
            }
            return 0
        } dst: { value in
            self.o_numberComboBox.stringValue = String(value)
        } completion: {
            self.o_singButton.isEnabled = true
            self.o_stfuButton.isEnabled = false
        }
    }
    
    @IBAction func stfuButtonSelected(_ sender: Any) {
        o_singButton.isEnabled = true
        o_stfuButton.isEnabled = false
        
        songPlayer.Stop()
    }
    
}

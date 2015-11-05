//
//  LogInViewController.swift
//  CocoaHeadsSwift
//
//  Created by Guilherme Endres on 11/5/15.
//  Copyright © 2015 ArcTouch. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var conferenceTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    let conferenceName : String = "CocoaHeadsFloripa"
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    @IBAction func enterButtonDidClick(sender: UIButton) {
        
        if isConferenceRoomAvailable() {
            self.performSegueWithIdentifier("conferencesSegue", sender: self)
        }
    }
    
    func isConferenceRoomAvailable() -> Bool {
        guard let conferenceText = conferenceTextField.text where conferenceTextField.text == conferenceName else {
            self.errorLabel.text = "Unable to find \(conferenceTextField.text) conference room !"
            self.errorLabel.hidden = false
            return false
        }
        
        print("Entering in Conference room \(conferenceText)")
        return true
    }
}

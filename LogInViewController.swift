//
//  LogInViewController.swift
//  CocoaHeadsSwift
//
//  Created by Guilherme Endres on 11/5/15.
//  Copyright © 2015 ArcTouch. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var conferenceTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    // MARK: Variables
    
    let conferenceName : String = "CocoaHeadsFloripa"
    
    // MARK: Life Cycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
        self.errorLabel.hidden = true
        self.conferenceTextField.text = ""
    }
    
    // MARK: IBAction
    
    @IBAction func enterButtonDidClick(sender: UIButton) {
        
        if isConferenceRoomAvailable(conferenceTextField.text) {
            self.performSegueWithIdentifier("conferencesSegue", sender: self)
        }
    }
    
    // MARK: Methods
    
    func isConferenceRoomAvailable(conferenceName : String!) -> Bool {
        guard let conferenceText = conferenceName where conferenceName == self.conferenceName else {
            self.errorLabel.text = "Unable to find conference room !"
            self.errorLabel.hidden = false
            return false
        }
        
        print("Entering in Conference room \(conferenceText)")
        return true
    }
}

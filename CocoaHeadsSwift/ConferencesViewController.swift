//
//  ConferencesViewController.swift
//  CocoaHeadsSwift
//
//  Created by Guilherme Endres on 11/5/15.
//  Copyright © 2015 ArcTouch. All rights reserved.
//

import UIKit

class ConferencesViewController : UIViewController {
    
    // MARK : IBOutlets
    
    @IBOutlet weak var conferencesTableView: UITableView!
    
    // MARK : Variables
    
    // Tuple example
    var lectures : [(title : String, name : String)]!
    
    // MARK : Life Cycle
    
    override func viewDidLoad() {
        // Array of Tuple
        self.lectures = [("Meu primeiro projeto em Swift 2.0", "Guilherme e Vilson"),
                         ("Design Patterns iOS", "Caio e Carlos"),
                         ("Carregamento otimizado com GDC", "Tarek Abdala"),
                         ("Coffe Break", "Arc Touch")]
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
}

// You can implement delegates using extension
extension ConferencesViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Get cell with identifier.
        // This identifieer has been set on storyboard.
        let cell : ConferenceCell = tableView.dequeueReusableCellWithIdentifier("conferenceIdentifier", forIndexPath: indexPath) as! ConferenceCell
        
        // Set the title and name using the row
        // self.lectures[0].title is equal to "Meu primeiro projeto em Swift 2.0"
        cell.titleLabel.text = self.lectures[indexPath.row].title
        cell.nameLabel.text = self.lectures[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lectures.count
    }
}
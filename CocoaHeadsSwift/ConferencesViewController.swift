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
    
    var lectures : [(title : String, name : String)]!
    
    // MARK : Life Cycle
    
    override func viewDidLoad() {
        self.lectures = [("Meu primeiro projeto em Swift 2.0", "Guilherme e Vilson"),
                         ("Design Patterns iOS", "Caio e Carlos"),
                         ("Carregamento otimizado com GDC", "Tarek Abdala"),
                         ("Coffe Break", "Arc Touch")]
        self.conferencesTableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
}

extension ConferencesViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : ConferenceCell = tableView.dequeueReusableCellWithIdentifier("conferenceIdentifier", forIndexPath: indexPath) as! ConferenceCell
        cell.titleLabel.text = self.lectures[indexPath.row].title
        cell.nameLabel.text = self.lectures[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lectures.count
    }
}
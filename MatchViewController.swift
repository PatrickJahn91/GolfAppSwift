//
//  ViewController.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 01.11.22.
//

import UIKit



class MatchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var ScoreCardTV: UITableView!
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        ScoreCardTV.delegate = self
        ScoreCardTV.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
        //returnwert ist Höhe einer Zeile
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //TODO: Custom Tableview Cell Klasse einrichten
        
        var cell = ScoreCardTV.dequeueReusableCell(withIdentifier: "scorecardLine", for: indexPath)
        return cell
    }

}

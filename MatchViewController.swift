//
//  ViewController.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 01.11.22.
//

import UIKit


class MatchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var ScoreCardTV: UITableView!
    
    @IBOutlet weak var endRoundButton: UIButton!
    
    
    
    @IBOutlet weak var NameP1: UITextField!
    @IBOutlet weak var handicapP1: UITextField!
    @IBOutlet weak var teeP1Button: UIButton!
    
    
    @IBOutlet weak var nameP2: UITextField!
    @IBOutlet weak var handicapP2: UITextField!
    @IBOutlet weak var teeP2Button: UIButton!
    
    
    
    @IBOutlet weak var nameP3: UITextField!
    @IBOutlet weak var handicapP3: UITextField!
    @IBOutlet weak var teeP3Button: UIButton!
    
    
    
    @IBOutlet weak var nameP4: UITextField!
    @IBOutlet weak var handicapP4: UITextField!
    @IBOutlet weak var teeP4Button: UIButton!
    
    
    
    @IBOutlet weak var startRoundButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        print(bahnenSortedbyHCP)
        print("123")
        
        ScoreCardTV.delegate = self
        ScoreCardTV.dataSource = self
        
        let teeOptions = {
        (action: UIAction) in
            print(action.title)
        }
        
        teeP1Button.menu = UIMenu(children: [
            UIAction(title: "H, weiß", state: .on, handler: teeOptions),
            UIAction(title: "H, gelb", state: .on, handler: teeOptions),
            UIAction(title: "H, rot", state: .on, handler: teeOptions),
            UIAction(title: "D, schwarz", state: .on, handler: teeOptions),
            UIAction(title: "D, rot", state: .on, handler: teeOptions),
            UIAction(title: "D, orange", state: .on, handler: teeOptions)
        ]
        )
        
        teeP2Button.menu = UIMenu(children: [
            UIAction(title: "H, weiß", state: .on, handler: teeOptions),
            UIAction(title: "H, gelb", state: .on, handler: teeOptions),
            UIAction(title: "H, rot", state: .on, handler: teeOptions),
            UIAction(title: "D, schwarz", state: .on, handler: teeOptions),
            UIAction(title: "D, rot", state: .on, handler: teeOptions),
            UIAction(title: "D, orange", state: .on, handler: teeOptions)
        ]
        )
        
        teeP3Button.menu = UIMenu(children: [
            UIAction(title: "H, weiß", state: .on, handler: teeOptions),
            UIAction(title: "H, gelb", state: .on, handler: teeOptions),
            UIAction(title: "H, rot", state: .on, handler: teeOptions),
            UIAction(title: "D, schwarz", state: .on, handler: teeOptions),
            UIAction(title: "D, rot", state: .on, handler: teeOptions),
            UIAction(title: "D, orange", state: .on, handler: teeOptions)
        ]
        )
        
        teeP4Button.menu = UIMenu(children: [
            UIAction(title: "H, weiß", state: .on, handler: teeOptions),
            UIAction(title: "H, gelb", state: .on, handler: teeOptions),
            UIAction(title: "H, rot", state: .on, handler: teeOptions),
            UIAction(title: "D, schwarz", state: .on, handler: teeOptions),
            UIAction(title: "D, rot", state: .on, handler: teeOptions),
            UIAction(title: "D, orange", state: .on, handler: teeOptions)
        ]
        )
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
        
        
        //returnwert ist Höhe einer Zeile
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //TODO: Custom Tableview Cell Klasse einrichten
        
        var cell = ScoreCardTV.dequeueReusableCell(withIdentifier: "scorecardLine", for: indexPath) as! ScorecardTVCell
        cell.bahnnummerLabel.text = "Bahn " + clubBahnen[indexPath.row].bahnnummer.description
        cell.parLabel.text = "Par " + clubBahnen[indexPath.row].bahnPar.description
        cell.hcpLabel.text = "HCP " + clubBahnen[indexPath.row].bahnHcp.description
        cell.distanceWhiteLabel.text = clubBahnen[indexPath.row].distanceWeiss.description
        cell.distanceYellowLabel.text = clubBahnen[indexPath.row].distanceGelb.description
        cell.distanceRedLabel.text = clubBahnen[indexPath.row].distanceRot.description
        cell.distanceBlackLabel.text = clubBahnen[indexPath.row].distanceSchwarz.description
        cell.distanceOrangeLabel.text = clubBahnen[indexPath.row].distanceOrange.description
        return cell
    }

}

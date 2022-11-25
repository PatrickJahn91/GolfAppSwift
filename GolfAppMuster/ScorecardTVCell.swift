//
//  ScorecardTVCell.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 15.11.22.
//

import UIKit

class ScorecardTVCell: UITableViewCell {
    
    @IBOutlet weak var bahnnummerLabel: UILabel!
    @IBOutlet weak var parLabel: UILabel!
    @IBOutlet weak var hcpLabel: UILabel!
    @IBOutlet weak var vorgabeHeaderLabel: UILabel!
    @IBOutlet weak var shotsHeaderLabel: UILabel!
    @IBOutlet weak var distanceWhiteLabel: UILabel!
    @IBOutlet weak var distanceYellowLabel: UILabel!
    @IBOutlet weak var distanceRedLabel: UILabel!
    @IBOutlet weak var distanceBlackLabel: UILabel!
    @IBOutlet weak var distanceOrangeLabel: UILabel!
    @IBOutlet weak var finishHoleButton: UIButton!
    
    @IBOutlet weak var vorgabeP1Label: UILabel!
    @IBOutlet weak var shotsP1Textfield: UITextField!
    @IBOutlet weak var bruttoP1: UILabel!
    @IBOutlet weak var nettoP1: UILabel!
    
    
    @IBOutlet weak var vorgabeP2Label: UILabel!
    @IBOutlet weak var shotsP2Textfield: UITextField!
    @IBOutlet weak var bruttoP2: UILabel!
    @IBOutlet weak var nettoP2: UILabel!
    
    
    @IBOutlet weak var vorgabeP3Label: UILabel!
    @IBOutlet weak var shotsP3Textfield: UITextField!
    @IBOutlet weak var bruttoP3: UILabel!
    @IBOutlet weak var nettoP3: UILabel!
    
    
    @IBOutlet weak var vorgabeP4Label: UILabel!
    @IBOutlet weak var shotsP4Textfield: UITextField!
    @IBOutlet weak var bruttoP4: UILabel!
    @IBOutlet weak var nettoP4: UILabel!
    
    
    @IBAction func finishBahnButton(_ sender: UIButton) {
        let vc = parentViewController as? MatchViewController
        vc?.calculateBrutto(bahnIndex: sender.tag, currentShots: [Int(shotsP1Textfield.text!) ?? 0, Int(shotsP2Textfield.text!) ?? 0, Int(shotsP3Textfield.text!) ?? 0, Int(shotsP4Textfield.text!) ?? 0])
        vc?.calculateNetto(bahnIndex: sender.tag, currentShots: [Int(shotsP1Textfield.text!) ?? 0, Int(shotsP2Textfield.text!) ?? 0, Int(shotsP3Textfield.text!) ?? 0, Int(shotsP4Textfield.text!) ?? 0])
        vc?.ScoreCardTV.reloadData()
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

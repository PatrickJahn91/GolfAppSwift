//
//  ViewController.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 01.11.22.
//

import UIKit


class MatchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 18
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
        
        
        //returnwert ist Höhe einer Zeile
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = ScoreCardTV.dequeueReusableCell(withIdentifier: "scorecardLine", for: indexPath) as! ScorecardTVCell
        cell.bahnnummerLabel.text = "Bahn " + clubBahnen[indexPath.row].bahnnummer.description
        cell.parLabel.text = "Par " + clubBahnen[indexPath.row].bahnPar.description
        cell.hcpLabel.text = "HCP " + clubBahnen[indexPath.row].bahnHcp.description
        cell.distanceWhiteLabel.text = clubBahnen[indexPath.row].distanceWeiss.description
        cell.distanceYellowLabel.text = clubBahnen[indexPath.row].distanceGelb.description
        cell.distanceRedLabel.text = clubBahnen[indexPath.row].distanceRot.description
        cell.distanceBlackLabel.text = clubBahnen[indexPath.row].distanceSchwarz.description
        cell.distanceOrangeLabel.text = clubBahnen[indexPath.row].distanceOrange.description
        cell.vorgabeP1Label.text = rundenInfos[indexPath.row].bahnVorgabe[0].description
        cell.vorgabeP2Label.text = rundenInfos[indexPath.row].bahnVorgabe[1].description
        cell.vorgabeP3Label.text = rundenInfos[indexPath.row].bahnVorgabe[2].description
        cell.vorgabeP4Label.text = rundenInfos[indexPath.row].bahnVorgabe[3].description
        return cell
    }
    
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
    
       
    @IBAction func startRoundButton(_ sender: Any) {
        createPlayers()
        calculateVorgaben()
        print(rundenvorgabeP1,rundenvorgabeP2,rundenvorgabeP3,rundenvorgabeP4)
        setVorgaben()
        ScoreCardTV.reloadData()
    }
    var slopeP1: Float = 140.0
    var courseRatingP1: Float = 73.0
    var parP1: Float = 72.0
    
    var slopeP2: Float = 140.0
    var courseRatingP2: Float = 73.0
    var parP2: Float = 72.0
    
    var slopeP3: Float = 140.0
    var courseRatingP3: Float = 73.0
    var parP3: Float = 72.0
    
    var slopeP4: Float = 140.0
    var courseRatingP4: Float = 73.0
    var parP4: Float = 72.0
    
    var rundenInfos = [Runde]()
    
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
        
        for b in 1...clubBahnen.count{
            rundenInfos.append(Runde(gespielteBahn: clubBahnen[b-1], bahnVorgabe: [0,0,0,0], bahnSchläge: [0,0,0,0], bahnBrutto: [0,0,0,0], bahnNetto: [0,0,0,0]))
        }
        
        
        teeP1Button.menu = UIMenu(children: [
            UIAction(title: "H, weiß", state: .on){action in
                self.slopeP1 = 140.0
                self.courseRatingP1 = 73.0
                self.parP1 = 72.0
            },
            UIAction(title: "H, gelb", state: .on){action in
                self.slopeP1 = 139.0
                self.courseRatingP1 = 71.3
                self.parP1 = 72.0
            },
            UIAction(title: "H, rot", state: .on){action in
                self.slopeP1 = 122.0
                self.courseRatingP1 = 68.4
                self.parP1 = 69.0
            },
            UIAction(title: "D, schwarz", state: .on){action in
                self.slopeP1 = 140.0
                self.courseRatingP1 = 77.7
                self.parP1 = 72.0
            },
            UIAction(title: "D, rot", state: .on){action in
                self.slopeP1 = 129.0
                self.courseRatingP1 = 74.0
                self.parP1 = 72.0
            },
            UIAction(title: "D, orange", state: .on){action in
                self.slopeP1 = 126.0
                self.courseRatingP1 = 72.5
                self.parP1 = 72.0
            }
        ]
        )
        
        
        
        
        teeP2Button.menu = UIMenu(children: [
            UIAction(title: "H, weiß", state: .on){action in
                self.slopeP2 = 140.0
                self.courseRatingP2 = 73.0
                self.parP2 = 72.0
            },
            UIAction(title: "H, gelb", state: .on){action in
                self.slopeP2 = 139.0
                self.courseRatingP2 = 71.3
                self.parP2 = 72.0
            },
            UIAction(title: "H, rot", state: .on){action in
                self.slopeP2 = 122.0
                self.courseRatingP2 = 68.4
                self.parP2 = 69.0
            },
            UIAction(title: "D, schwarz", state: .on){action in
                self.slopeP2 = 140.0
                self.courseRatingP2 = 77.7
                self.parP2 = 72.0
            },
            UIAction(title: "D, rot", state: .on){action in
                self.slopeP2 = 129.0
                self.courseRatingP2 = 74.0
                self.parP2 = 72.0
            },
            UIAction(title: "D, orange", state: .on){action in
                self.slopeP2 = 126.0
                self.courseRatingP2 = 72.5
                self.parP2 = 72.0
            }
        ]
        )
        
       
        
        teeP3Button.menu = UIMenu(children: [
            UIAction(title: "H, weiß", state: .on){action in
                self.slopeP3 = 140.0
                self.courseRatingP3 = 73.0
                self.parP3 = 72.0
            },
            UIAction(title: "H, gelb", state: .on){action in
                self.slopeP3 = 139.0
                self.courseRatingP3 = 71.3
                self.parP3 = 72.0
            },
            UIAction(title: "H, rot", state: .on){action in
                self.slopeP3 = 122.0
                self.courseRatingP3 = 68.4
                self.parP3 = 69.0
            },
            UIAction(title: "D, schwarz", state: .on){action in
                self.slopeP3 = 140.0
                self.courseRatingP3 = 77.7
                self.parP3 = 72.0
            },
            UIAction(title: "D, rot", state: .on){action in
                self.slopeP3 = 129.0
                self.courseRatingP3 = 74.0
                self.parP3 = 72.0
            },
            UIAction(title: "D, orange", state: .on){action in
                self.slopeP3 = 126.0
                self.courseRatingP3 = 72.5
                self.parP3 = 72.0
            }
        ]
        )
        
        
        
        teeP4Button.menu = UIMenu(children: [
            UIAction(title: "H, weiß", state: .on){action in
                self.slopeP4 = 140.0
                self.courseRatingP4 = 73.0
                self.parP4 = 72.0
            },
            UIAction(title: "H, gelb", state: .on){action in
                self.slopeP4 = 139.0
                self.courseRatingP4 = 71.3
                self.parP4 = 72.0
            },
            UIAction(title: "H, rot", state: .on){action in
                self.slopeP4 = 122.0
                self.courseRatingP4 = 68.4
                self.parP4 = 69.0
            },
            UIAction(title: "D, schwarz", state: .on){action in
                self.slopeP4 = 140.0
                self.courseRatingP4 = 77.7
                self.parP4 = 72.0
            },
            UIAction(title: "D, rot", state: .on){action in
                self.slopeP4 = 129.0
                self.courseRatingP4 = 74.0
                self.parP4 = 72.0
            },
            UIAction(title: "D, orange", state: .on){action in
                self.slopeP4 = 126.0
                self.courseRatingP4 = 72.5
                self.parP4 = 72.0
            }
        ]
        )
        
    }
    
    func createPlayers(){
        player1.name = NameP1.description
        player1.handicap = (handicapP1.text! as NSString).floatValue
        player1.tee = teeP1Button.menu!.description
        
        player2.name = nameP2.description
        player2.handicap = (handicapP2.text! as NSString).floatValue
        player2.tee = teeP2Button.menu!.description
        
        player3.name = nameP3.description
        player3.handicap = (handicapP3.text! as NSString).floatValue
        player3.tee = teeP3Button.menu!.description
        
        player4.name = nameP4.description
        player4.handicap = (handicapP4.text! as NSString).floatValue
        player4.tee = teeP4Button.menu!.description
    }
    
    var rundenvorgabeP1: Float = 0.0
    var rundenvorgabeP2: Float = 0.0
    var rundenvorgabeP3: Float = 0.0
    var rundenvorgabeP4: Float = 0.0
    func calculateVorgaben(){
        print("Player 1 Stats:" )
        print("Player1 Handicap:\(player1.handicap)")
        print("Player1 Slope: \(slopeP1)")
        print("Player1 CR: \(courseRatingP1)")
        print("Player1 CR: \(parP1)")
        rundenvorgabeP1 = player1.handicap * (slopeP1/113)-courseRatingP1+parP1
        rundenvorgabeP2 = player2.handicap * (slopeP2/113)-courseRatingP2+parP2
        rundenvorgabeP3 = player3.handicap * (slopeP3/113)-courseRatingP3+parP3
        rundenvorgabeP4 = player4.handicap * (slopeP4/113)-courseRatingP4+parP4
    }
    
   //var bahnVorgabeP1: Int = 0
    func setVorgaben(){
        for index in 0...rundenInfos.count - 1{
            var currentRound = rundenInfos[index]
            currentRound.bahnVorgabe[0] = Int(rundenvorgabeP1.rounded())/18
            currentRound.bahnVorgabe[1] = Int(rundenvorgabeP2.rounded())/18
            currentRound.bahnVorgabe[2] = Int(rundenvorgabeP3.rounded())/18
            currentRound.bahnVorgabe[3] = Int(rundenvorgabeP4.rounded())/18
            
            var restVorgabeP1 = Int(rundenvorgabeP1.rounded())%18
            var restVorgabeP2 = Int(rundenvorgabeP2.rounded())%18
            var restVorgabeP3 = Int(rundenvorgabeP3.rounded())%18
            var restVorgabeP4 = Int(rundenvorgabeP4.rounded())%18
            
            if restVorgabeP1 >= currentRound.gespielteBahn.bahnHcp {
                currentRound.bahnVorgabe[0] = currentRound.bahnVorgabe[0] + 1
            }
            
            if restVorgabeP2 >= currentRound.gespielteBahn.bahnHcp {
                currentRound.bahnVorgabe[1] = currentRound.bahnVorgabe[1] + 1
            }
            
            if restVorgabeP3 >= currentRound.gespielteBahn.bahnHcp {
                currentRound.bahnVorgabe[2] = currentRound.bahnVorgabe[2] + 1
            }
            
            if restVorgabeP4 >= currentRound.gespielteBahn.bahnHcp {
                currentRound.bahnVorgabe[3] = currentRound.bahnVorgabe[3] + 1
            }
            print("Rundenvorgabe P1 : \(currentRound.bahnVorgabe)")
        }
        
        
        
    }
}


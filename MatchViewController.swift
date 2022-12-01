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
        
        cell.bruttoP1.text = rundenInfos[indexPath.row].bahnBrutto[0].description
        cell.bruttoP2.text = rundenInfos[indexPath.row].bahnBrutto[1].description
        cell.bruttoP3.text = rundenInfos[indexPath.row].bahnBrutto[2].description
        cell.bruttoP4.text = rundenInfos[indexPath.row].bahnBrutto[3].description
        
        cell.nettoP1.text = rundenInfos[indexPath.row].bahnNetto[0].description
        cell.nettoP2.text = rundenInfos[indexPath.row].bahnNetto[1].description
        cell.nettoP3.text = rundenInfos[indexPath.row].bahnNetto[2].description
        cell.nettoP4.text = rundenInfos[indexPath.row].bahnNetto[3].description
        
        cell.shotsP1Textfield.text = rundenInfos[indexPath.row].bahnSchläge[0].description
        cell.shotsP2Textfield.text = rundenInfos[indexPath.row].bahnSchläge[1].description
        cell.shotsP3Textfield.text = rundenInfos[indexPath.row].bahnSchläge[2].description
        cell.shotsP4Textfield.text = rundenInfos[indexPath.row].bahnSchläge[3].description
        cell.finishHoleButton.tag = indexPath.row
        return cell
    }
    
    @IBOutlet weak var ScoreCardTV: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "endRound"{
            let targetVC = segue.destination as! ResultListsViewController
            targetVC.player1Bahnen = rundenInfos
            targetVC.player1Name = player1.name
            targetVC.player2Name = player2.name
            targetVC.player3Name = player3.name
            targetVC.player4Name = player4.name
            
        }
    }
    @IBAction func endRoundButton(_ sender: Any) {
    }
    
    
    
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
        player1.name = NameP1.text!
        player1.handicap = (handicapP1.text! as NSString).floatValue
        player1.tee = teeP1Button.menu!.description
        
        player2.name = nameP2.text!
        player2.handicap = (handicapP2.text! as NSString).floatValue
        player2.tee = teeP2Button.menu!.description
        
        player3.name = nameP3.text!
        player3.handicap = (handicapP3.text! as NSString).floatValue
        player3.tee = teeP3Button.menu!.description
        
        player4.name = nameP4.text!
        player4.handicap = (handicapP4.text! as NSString).floatValue
        player4.tee = teeP4Button.menu!.description
    }
    
    
    var rundenvorgabeP1: Float = 0.0
    var rundenvorgabeP2: Float = 0.0
    var rundenvorgabeP3: Float = 0.0
    var rundenvorgabeP4: Float = 0.0
    func calculateVorgaben(){
        rundenvorgabeP1 = player1.handicap * (slopeP1/113)-courseRatingP1+parP1
        rundenvorgabeP2 = player2.handicap * (slopeP2/113)-courseRatingP2+parP2
        rundenvorgabeP3 = player3.handicap * (slopeP3/113)-courseRatingP3+parP3
        rundenvorgabeP4 = player4.handicap * (slopeP4/113)-courseRatingP4+parP4
    }
    
    
    func setVorgaben(){
        let rundenVorgabenListe = [rundenvorgabeP1, rundenvorgabeP2, rundenvorgabeP3, rundenvorgabeP4]
        for index in 0...rundenInfos.count - 1{
            for playerIndex in 0...3{
                rundenInfos[index].bahnVorgabe[playerIndex] = Int(rundenVorgabenListe[playerIndex].rounded())/18;
                if Int(rundenVorgabenListe[playerIndex].rounded())%18 >= rundenInfos[index].gespielteBahn.bahnHcp{
                    rundenInfos[index].bahnVorgabe[playerIndex] = rundenInfos[index].bahnVorgabe[playerIndex] + 1
                }
            }
        }
    }
    
    func calculateBrutto(bahnIndex: Int, currentShots: [Int]){
       
        for playerIndex in 0...3{
            rundenInfos[bahnIndex].bahnSchläge[playerIndex] = currentShots[playerIndex]
            rundenInfos[bahnIndex].bahnBrutto[playerIndex] = clubBahnen[bahnIndex].bahnPar + 2 - rundenInfos[bahnIndex].bahnSchläge[playerIndex]
            if (rundenInfos[bahnIndex].bahnBrutto[playerIndex] < 0) {
                rundenInfos[bahnIndex].bahnBrutto[playerIndex] = 0
            }
        }
    }
    
    func calculateNetto(bahnIndex: Int, currentShots: [Int]){
       
        for playerIndex in 0...3{
            rundenInfos[bahnIndex].bahnSchläge[playerIndex] = currentShots[playerIndex]
            rundenInfos[bahnIndex].bahnNetto[playerIndex] = clubBahnen[bahnIndex].bahnPar + rundenInfos[bahnIndex].bahnVorgabe[playerIndex] + 2 - rundenInfos[bahnIndex].bahnSchläge[playerIndex]
            if (rundenInfos[bahnIndex].bahnNetto[playerIndex] < 0) {
                rundenInfos[bahnIndex].bahnNetto[playerIndex] = 0
            }
        }
    }
}


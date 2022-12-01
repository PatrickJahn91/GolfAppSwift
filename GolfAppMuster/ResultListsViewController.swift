//
//  ResultListsViewController.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 23.11.22.
//

import UIKit


class ResultListsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 18
        }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        
    @IBAction func SaveMatchButton(_ sender: Any) {
        
        var matchSaveState = Matches(context: context)
        if playerIndexN == 0 {matchSaveState.player = player1Name}
        if playerIndexN == 1 {matchSaveState.player = player2Name}
        if playerIndexN == 2 {matchSaveState.player = player3Name}
        if playerIndexN == 3 {matchSaveState.player = player4Name}
        var saveList : [Bahnen] = []
        for bahn in player1Bahnen!{
            var saveState = Bahnen(context: context)
            saveState.shots = Int16(bahn.bahnSchläge[playerIndexN])
            saveState.netto = Int16(bahn.bahnNetto[playerIndexN])
            saveState.brutto = Int16(bahn.bahnBrutto[playerIndexN])
            
            saveList.append(saveState)
            
            print("test \(bahn.bahnSchläge[playerIndexN])")
        }
        
        matchSaveState.bahnenRelation = NSSet(array: saveList)
        do {
            try self.context.save()
        } catch {
            print("Speichern nicht möglich")
        }
        
        print("MSS \(matchSaveState) ; SS \(NSSet(array: saveList))")
    }
    @IBAction func switchPlayerLeftButton(_ sender: Any) {
        playerIndexN = playerIndexN - 1
        if playerIndexN == 0-1{
            playerIndexN = 3
        }
        if playerIndexN == 0 {
            showedPlayerName.text = player1Name
            shotsLabel.text = player1GesamtSchläge.description
            bruttoLabel.text = player1GesamtBrutto.description
            nettoLabel.text = player1GesamtNetto.description
        }
        if playerIndexN == 1 {
            showedPlayerName.text = player2Name.description
            shotsLabel.text = player2GesamtSchläge.description
            bruttoLabel.text = player2GesamtBrutto.description
            nettoLabel.text = player2GesamtNetto.description
        }
        if playerIndexN == 2 {
            showedPlayerName.text = player3Name.description
            shotsLabel.text = player3GesamtSchläge.description
            bruttoLabel.text = player3GesamtBrutto.description
            nettoLabel.text = player3GesamtNetto.description
        }
        if playerIndexN == 3 {
            showedPlayerName.text = player4Name.description
            shotsLabel.text = player4GesamtSchläge.description
            bruttoLabel.text = player4GesamtBrutto.description
            nettoLabel.text = player4GesamtNetto.description
        }
        resultTV.reloadData()
    }
    @IBAction func switchPlayerRightButton(_ sender: Any) {
        playerIndexN = playerIndexN + 1
        if playerIndexN == 4{
            playerIndexN = 0
        }
        if playerIndexN == 0 {
            showedPlayerName.text = player1Name
            shotsLabel.text = player1GesamtSchläge.description
            bruttoLabel.text = player1GesamtBrutto.description
            nettoLabel.text = player1GesamtNetto.description
        }
        if playerIndexN == 1 {
            showedPlayerName.text = player2Name.description
            shotsLabel.text = player2GesamtSchläge.description
            bruttoLabel.text = player2GesamtBrutto.description
            nettoLabel.text = player2GesamtNetto.description
        }
        if playerIndexN == 2 {
            showedPlayerName.text = player3Name.description
            shotsLabel.text = player3GesamtSchläge.description
            bruttoLabel.text = player3GesamtBrutto.description
            nettoLabel.text = player3GesamtNetto.description
        }
        if playerIndexN == 3 {
            showedPlayerName.text = player4Name.description
            shotsLabel.text = player4GesamtSchläge.description
            bruttoLabel.text = player4GesamtBrutto.description
            nettoLabel.text = player4GesamtNetto.description
        }
        resultTV.reloadData()
            }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 31
            //returnwert ist Höhe einer Zeile
        }
    
    var playerIndexN: Int = 0
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTV.dequeueReusableCell(withIdentifier: "MatchResultTableViewCell") as! MatchResultTableViewCell
        cell.bahnNummer.text = player1Bahnen?[indexPath.row].gespielteBahn.bahnnummer.description
        cell.shots.text = player1Bahnen?[indexPath.row].bahnSchläge[playerIndexN].description
        cell.brutto.text = player1Bahnen?[indexPath.row].bahnBrutto[playerIndexN].description
        cell.netto.text = player1Bahnen?[indexPath.row].bahnNetto[playerIndexN].description
        return cell
    }
    
    @IBOutlet weak var resultTV: UITableView!
    @IBOutlet weak var showedPlayerName: UILabel!
    struct showedPlayer{
        var playerIndex : Int
        var playerName: String
        var bahnen: [Runde]?
        var gesamtSchlaege: Int
        var gesamtBrutto: Int
        var gesamtNetto: Int
    }
    var player1 : showedPlayer?
    var player1Name : String = ""
    var player2Name : String = ""
    var player3Name : String = ""
    var player4Name : String = ""
    var player1Bahnen: [Runde]?
    var player1GesamtSchläge : Int = 0
    var player2GesamtSchläge : Int = 0
    var player3GesamtSchläge : Int = 0
    var player4GesamtSchläge : Int = 0
    var player1GesamtBrutto : Int = 0
    var player2GesamtBrutto : Int = 0
    var player3GesamtBrutto : Int = 0
    var player4GesamtBrutto : Int = 0
    var player1GesamtNetto : Int = 0
    var player2GesamtNetto : Int = 0
    var player3GesamtNetto : Int = 0
    var player4GesamtNetto : Int = 0
    
    @IBOutlet weak var shotsLabel: UILabel!
    
    @IBOutlet weak var bruttoLabel: UILabel!
    
    @IBOutlet weak var nettoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for bahn in player1Bahnen! {
            player1GesamtSchläge = player1GesamtSchläge + bahn.bahnSchläge[0]
            player2GesamtSchläge = player2GesamtSchläge + bahn.bahnSchläge[1]
            player3GesamtSchläge = player3GesamtSchläge + bahn.bahnSchläge[2]
            player4GesamtSchläge = player4GesamtSchläge + bahn.bahnSchläge[3]
           

            player1GesamtNetto = player1GesamtNetto + bahn.bahnNetto[0]
            player2GesamtNetto = player2GesamtNetto + bahn.bahnNetto[1]
            player3GesamtNetto = player3GesamtNetto + bahn.bahnNetto[2]
            player4GesamtNetto = player4GesamtNetto + bahn.bahnNetto[3]
        
            
            player1GesamtBrutto = player1GesamtBrutto + bahn.bahnBrutto[0]
            player2GesamtBrutto = player2GesamtBrutto + bahn.bahnBrutto[1]
            player3GesamtBrutto = player3GesamtBrutto + bahn.bahnBrutto[2]
            player4GesamtBrutto = player4GesamtBrutto + bahn.bahnBrutto[3]
        }

        shotsLabel.text = player1GesamtSchläge.description
        bruttoLabel.text = player1GesamtBrutto.description
        nettoLabel.text = player1GesamtNetto.description
        
        resultTV.delegate = self
        resultTV.dataSource = self
        
        showedPlayerName.text = player1Name
    }
}

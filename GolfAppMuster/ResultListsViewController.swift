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
        
    @IBAction func switchPlayerRightButton(_ sender: Any) {
        playerIndexN = playerIndexN + 1
        if playerIndexN == 4{
            playerIndexN = 0
        }
        if playerIndexN == 0 {
            showedPlayerName.text = player1Name
        }
        if playerIndexN == 1 {
            showedPlayerName.text = player2Name.description
        }
        if playerIndexN == 2 {
            showedPlayerName.text = player3Name.description
        }
        if playerIndexN == 3 {
            showedPlayerName.text = player4Name.description
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
    var player1GesamtBrutto : Int = 0
    var player1GesamtNetto : Int = 0
    
    @IBOutlet weak var shotsLabel: UILabel!
    
    @IBOutlet weak var bruttoLabel: UILabel!
    
    @IBOutlet weak var nettoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shotsLabel.text = player1GesamtSchläge.description
        bruttoLabel.text = player1GesamtBrutto.description
        nettoLabel.text = player1GesamtNetto.description
        
        resultTV.delegate = self
        resultTV.dataSource = self
        
        showedPlayerName.text = player1Name
        print("Name: \(player1Name.description)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

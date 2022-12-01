//
//  ViewController.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 07.10.22.
//

import UIKit

class ViewController: UIViewController {
    
    let tournamentAPIClient : TournamentAPIClient = TournamentAPIClient()
    
    var tournamentList : [TournamentInfo]?

    @IBOutlet weak var TournamentsTV: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tournamentAPIClient.getTournaments{
            tournamentList in
            self.tournamentList = tournamentList
            DispatchQueue.main.async {self.TournamentsTV.reloadData()}
        }
        
        
        //TournamentsTV.delegate = self
        TournamentsTV.dataSource = self
    
    }
}

extension ViewController: UITableViewDataSource {
    
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 17        } else {
            return tournamentList?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "TournamentCell") as! TournamentsTableViewCell
            guard let tournament = tournamentList?[indexPath.row] else {return cell}
            cell.headerLabel.text = tournament.Tournament
            cell.descriptionLabel.text = tournament.Description
           
            return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
            //returnwert ist Höhe einer Zeile
        }
}

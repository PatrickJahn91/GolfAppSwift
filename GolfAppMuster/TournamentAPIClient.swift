//
//  TournamentAPIClient.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 29.11.22.
//

import Foundation
import UIKit


struct TournamentAPIClient {
    
   
    
    func getTournaments(completion: @escaping([TournamentInfo]) -> Void) {
        
        //MARK: 1. URL formen
        let urlString = "https://public.syntax-institut.de/apps/batch1/PatrickJahn/data.json"
        let url = URL(string: urlString)
        
        guard url != nil else { return }
        
        //MARK: 2. URL Session
        let session = URLSession.shared
        
        //MARK: 3. DataTask erstellen
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            // Error handling
            if error == nil && data != nil {
                
                // JSON Decoder
                let decoder = JSONDecoder()
                var newsFeed: [TournamentInfo] = [TournamentInfo]()
                do {
                    
                    newsFeed = try decoder.decode([TournamentInfo].self, from: data!)
                    print("blabla: \(newsFeed.randomElement()?.Tournament)")
                    completion(newsFeed)
                    
                } catch {
                    print("Error parsing JSON")
                }
                
            }
        }
        //MARK: 4. API Call starten / fortsetzen
        dataTask.resume()
    }
    
    
    
}

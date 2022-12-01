//
//  TournamentFeed.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 29.11.22.
//

import Foundation


struct TournamentFeed: Codable {
    
    //var status: String?
    //var totalResults: Int?
    var tournamentInfos: [TournamentInfo]?
    
}

struct TournamentInfo: Codable {
    
    var Tournament: String?
    var Description: String?
    
}

//
//  RoundModel.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 16.11.22.
//

import Foundation

// eine Runde ist eine Bahn

struct Runde {
    var gespielteBahn : Bahn
    var bahnVorgabe : [Int?]
    var bahnSchläge : [Int?]
    var bahnBrutto : [Int?]
    var bahnNetto : [Int?]
}

//
//  SampleData.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 16.11.22.
//

import Foundation
import UIKit

var bahn1  = Bahn(bahnnummer: 1,  bahnPar: 5, bahnHcp: 3,  distanceWeiss: 480, distanceGelb: 454, distanceSchwarz: 454, distanceRot: 406, distanceOrange: 388)
var bahn2  = Bahn(bahnnummer: 2,  bahnPar: 4, bahnHcp: 17, distanceWeiss: 328, distanceGelb: 312, distanceSchwarz: 312, distanceRot: 285, distanceOrange: 268)
var bahn3  = Bahn(bahnnummer: 3,  bahnPar: 3, bahnHcp: 15, distanceWeiss: 177, distanceGelb: 159, distanceSchwarz: 159, distanceRot: 158, distanceOrange: 144)
var bahn4  = Bahn(bahnnummer: 4,  bahnPar: 4, bahnHcp: 11, distanceWeiss: 357, distanceGelb: 335, distanceSchwarz: 335, distanceRot: 294, distanceOrange: 276)
var bahn5  = Bahn(bahnnummer: 5,  bahnPar: 3, bahnHcp: 5,  distanceWeiss: 174, distanceGelb: 167, distanceSchwarz: 167, distanceRot: 143, distanceOrange: 134)
var bahn6  = Bahn(bahnnummer: 6,  bahnPar: 5, bahnHcp: 7,  distanceWeiss: 497, distanceGelb: 482, distanceSchwarz: 482, distanceRot: 395, distanceOrange: 376)
var bahn7  = Bahn(bahnnummer: 7,  bahnPar: 4, bahnHcp: 9,  distanceWeiss: 322, distanceGelb: 306, distanceSchwarz: 306, distanceRot: 271, distanceOrange: 254)
var bahn8  = Bahn(bahnnummer: 8,  bahnPar: 5, bahnHcp: 13, distanceWeiss: 466, distanceGelb: 442, distanceSchwarz: 442, distanceRot: 395, distanceOrange: 376)
var bahn9  = Bahn(bahnnummer: 9,  bahnPar: 3, bahnHcp: 1,  distanceWeiss: 189, distanceGelb: 183, distanceSchwarz: 183, distanceRot: 172, distanceOrange: 168)
var bahn10 = Bahn(bahnnummer: 10, bahnPar: 5, bahnHcp: 8,  distanceWeiss: 201, distanceGelb: 472, distanceSchwarz: 472, distanceRot: 438, distanceOrange: 421)
var bahn11 = Bahn(bahnnummer: 11, bahnPar: 4, bahnHcp: 12, distanceWeiss: 325, distanceGelb: 310, distanceSchwarz: 310, distanceRot: 300, distanceOrange: 282)
var bahn12 = Bahn(bahnnummer: 12, bahnPar: 4, bahnHcp: 6,  distanceWeiss: 357, distanceGelb: 330, distanceSchwarz: 330, distanceRot: 297, distanceOrange: 278)
var bahn13 = Bahn(bahnnummer: 13, bahnPar: 3, bahnHcp: 18, distanceWeiss: 158, distanceGelb: 148, distanceSchwarz: 148, distanceRot: 132, distanceOrange: 119)
var bahn14 = Bahn(bahnnummer: 14, bahnPar: 4, bahnHcp: 2,  distanceWeiss: 369, distanceGelb: 352, distanceSchwarz: 352, distanceRot: 308, distanceOrange: 298)
var bahn15 = Bahn(bahnnummer: 15, bahnPar: 4, bahnHcp: 10, distanceWeiss: 354, distanceGelb: 344, distanceSchwarz: 344, distanceRot: 329, distanceOrange: 314)
var bahn16 = Bahn(bahnnummer: 16, bahnPar: 4, bahnHcp: 14, distanceWeiss: 361, distanceGelb: 335, distanceSchwarz: 335, distanceRot: 287, distanceOrange: 266)
var bahn17 = Bahn(bahnnummer: 17, bahnPar: 3, bahnHcp: 16, distanceWeiss: 146, distanceGelb: 141, distanceSchwarz: 141, distanceRot: 126, distanceOrange: 121)
var bahn18 = Bahn(bahnnummer: 18, bahnPar: 5, bahnHcp: 4,  distanceWeiss: 472, distanceGelb: 455, distanceSchwarz: 455, distanceRot: 394, distanceOrange: 379)

var clubBahnen = [bahn1, bahn2, bahn3, bahn4, bahn5, bahn6, bahn7, bahn8, bahn9, bahn10, bahn11, bahn12, bahn13, bahn14, bahn15, bahn16, bahn17, bahn18]


var bahnenSortedbyHCP = clubBahnen.sorted(by: { $0.bahnHcp < $1.bahnHcp })




var club = Club(name: "Golfclub Rügen", image: UIImage(systemName: "figure.golf")!, bahnen: clubBahnen, platzParRegular: 72, platzParSpecial: 69, slopeWhite: 140, slopeYellow: 139, slopeRedMen: 122, slopeBlack: 140, slopeRedWomen: 129, slopeOrange: 126, courseRatingWhite: 73.0, courseRatingYellow: 71.3, courseRatingRedMen: 68.4, courseRatingBlack: 77.7, courseRatingRedWomen: 74.0, courseRatingOrange: 72.5)


var player1 = Player(name: "Fabian", handicap: 0.0, tee: 1)
var player2 = Player(name: "Patrick", handicap: 34.8, tee: 2)
var player3 = Player(name: "Marvin", handicap: 0.0, tee: 1)
var player4 = Player(name: "Felix", handicap: 54.0, tee: 2)

//var players = [player1, player2, player3, player4]

//var round1 = Runde(gespielteBahn: bahn1, bahnVorgabe: [0, 3, 0, 4], bahnSchläge: [5, 6, 4, 8], bahnBrutto: [2, 1, 3, 0], bahnNetto: <#T##[Int?]#>)



//var match = Match(players: <#T##[Player]#>, runden: <#T##[Runde]#>)

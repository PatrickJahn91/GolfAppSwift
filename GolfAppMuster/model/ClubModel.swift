//
//  ClubModel.swift
//  GolfAppMuster
//
//  Created by Patrick Jahn on 16.11.22.
//

import Foundation
import UIKit

struct Club{
    var name : String
    var image : UIImage
    var bahnen : [Bahn]
    
    var platzParRegular : Int
    var platzParSpecial : Int
    
    var slopeWhite : Int
    var slopeYellow : Int
    var slopeRedMen : Int
    
    var slopeBlack : Int
    var slopeRedWomen : Int
    var slopeOrange : Int
    
    var courseRatingWhite : Float
    var courseRatingYellow : Float
    var courseRatingRedMen : Float
    
    var courseRatingBlack : Float
    var courseRatingRedWomen : Float
    var courseRatingOrange : Float
}

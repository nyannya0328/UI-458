//
//  BodingScreen.swift
//  UI-458
//
//  Created by nyannyan0328 on 2022/02/10.
//

import SwiftUI

struct BodingScreen: Identifiable {
    
    var id = UUID().uuidString
    var image : String
    var title : String
    var description : String
  
}

let title = "Easy Payments with \nWallestroy"
let description = "Small business can recive device \npayment super fast and super easy"


var bordingScreens : [BodingScreen] = [



    BodingScreen(image: "screen1", title: title, description: description),
    BodingScreen(image: "screen2", title: title, description: description),
    BodingScreen(image: "screen3", title: title, description: description),
    BodingScreen(image: "screen4", title: title, description: description),




]





//
//  ItemCardModel.swift
//  OpeninAppAssignment
//
//  Created by Praval Gautam on 15/04/24.
//

import Foundation


struct ItemCardModel{
    var id = UUID()
    var image : String
    var heading : String
    var subHeading : String
    

}


var CardData: [ItemCardModel] = [
    ItemCardModel(image: "Avatar", heading: "123", subHeading: "Today`s clicks"),
    ItemCardModel(image: "Avatar-2", heading: "Ahamedabad", subHeading: "Top Location"),
    ItemCardModel(image: "Avatar-3", heading: "Instagram", subHeading: "Top source"),
    ItemCardModel(image: "Avatar-5", heading: "11:00 - 12:00", subHeading: "Best Time"),
]

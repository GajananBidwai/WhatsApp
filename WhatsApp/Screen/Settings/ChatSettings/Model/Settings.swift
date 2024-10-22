//
//  Settings.swift
//  WhatsApp
//
//  Created by abcd on 21/10/24.
//


import UIKit

enum RightAccessoryType{
    case rightArrowButton
    case switchbutton
    case none
    case buttonTitles
    
    enum buttonTitle: String{
        case note
        case wifi
        case wifiAndCellular
        case none
    }
}
struct Settings{
    var title: String
    var rightAccessory: RightAccessoryType
    var buttonTitle: RightAccessoryType.buttonTitle?
    var textColor: UIColor
}

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
    
}
struct Settings{
    var title: String
    var rightAccessory: RightAccessoryType
    var textColor: UIColor
}

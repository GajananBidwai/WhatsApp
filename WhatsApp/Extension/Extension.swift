//
//  Extension + Label.swift
//  WhatsApp
//
//  Created by abcd on 23/10/24.
//

import UIKit

class labelText{
    
    static func labelText(labelText: UILabel, textForHeaderFooterView: String, headerViewAndFooterView: UIView) {
        labelText.text = textForHeaderFooterView
        labelText.numberOfLines = 2
        labelText.font = UIFont.systemFont(ofSize: 14, weight: .light)
        labelText.textColor = UIColor(named: "lightgrey") ?? .black
        labelText.textAlignment = .left
        
        headerViewAndFooterView.addSubview(labelText)
    }
}

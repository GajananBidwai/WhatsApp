//
//  UIColor + Extension.swift
//  WhatsApp
//
//  Created by abcd on 08/11/24.
//

import UIKit
extension UIColor {
    func isLight() -> Bool {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > 0.7
    }
}

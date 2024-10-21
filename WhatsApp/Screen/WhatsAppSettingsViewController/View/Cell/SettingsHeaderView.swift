//
//  SettingsHeaderView.swift
//  WhatsApp
//
//  Created by abcd on 21/10/24.
//

import Foundation
import UIKit

class SettingsHeaderView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerNIB()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        registerNIB()
    }
    
    func registerNIB(){
        if let settingsHeaderView = Bundle.main.loadNibNamed(CellConstant.CellIdentifier.SettingsHeaderView, owner: self)?.first as? UIView{
            settingsHeaderView.frame = self.bounds
            settingsHeaderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(settingsHeaderView)
            
        }
    }
}

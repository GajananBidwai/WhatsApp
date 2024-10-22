//
//  SettingsTableViewCell.swift
//  WhatsApp
//
//  Created by abcd on 22/10/24.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var rightArrowButton: UIButton!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var titleTrailingContarints: NSLayoutConstraint!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: Settings){
        titleLabel.text = model.title
        rightArrowButton.isHidden = true
        switchButton.isHidden = true
        titleTrailingContarints.constant = 15
        
        switch model.rightAccessory {
            
        case .rightArrowButton:
            rightArrowButton.isHidden = false
            titleTrailingContarints.constant = 10
            
        case .switchbutton:
            switchButton.isHidden = false
            titleTrailingContarints.constant = 10
            
        case .none:
            rightArrowButton.isHidden = true
            switchButton.isHidden = true
            titleTrailingContarints.constant = 20
            break
        }
        
    }
    
    
}

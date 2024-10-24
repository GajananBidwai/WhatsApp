//
//  EditProfileTableViewCell.swift
//  WhatsApp
//
//  Created by abcd on 24/10/24.
//

import UIKit

class EditProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureData(editProfile: EditProfile){
        detailLabel.text = editProfile.titleValue
    }

    
    
}

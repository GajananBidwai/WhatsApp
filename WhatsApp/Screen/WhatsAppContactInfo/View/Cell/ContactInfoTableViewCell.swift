//
//  ContactInfoTableViewCell.swift
//  WhatsApp
//
//  Created by abcd on 18/10/24.
//

import UIKit

class ContactInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var functionalityIcon: UIImageView!
    @IBOutlet weak var functionalityNameLabel: UILabel!
    @IBOutlet weak var funtionalityStatusLabel: UILabel!
    
    var contactInfo: ContactInfo?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureData(){
        functionalityIcon.image = contactInfo?.image
        functionalityNameLabel.text = contactInfo?.title
        funtionalityStatusLabel.text = contactInfo?.subtitle
    }

    
    
}

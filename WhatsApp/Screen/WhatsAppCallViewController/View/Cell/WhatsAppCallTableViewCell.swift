//
//  WhatsAppCallTableViewCell.swift
//  WhatsApp
//
//  Created by abcd on 16/10/24.
//

import UIKit

class WhatsAppCallTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var whatsAppCall: WhatsAppCall?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
    func configureData(){
        nameLabel.text = whatsAppCall?.name
        callLabel.text = whatsAppCall?.callTitle
        dateLabel.text = whatsAppCall?.date
    }
    
}

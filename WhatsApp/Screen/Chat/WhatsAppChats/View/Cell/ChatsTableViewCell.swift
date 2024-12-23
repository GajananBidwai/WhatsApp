//
//  ChatsTableViewCell.swift
//  WhatsApp
//
//  Created by abcd on 15/10/24.
//

import UIKit

class ChatsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userDescription: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var selectionIndicatorImageView: UIImageView!
    @IBOutlet weak var userProfileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func updateSelectionIndicator(isSelected: Bool) {
        selectionIndicatorImageView.isHidden = false // Show the image when editing mode is active
        
        if isSelected {
            selectionIndicatorImageView.image = UIImage(systemName: "circle")
        } else {
            selectionIndicatorImageView.image = UIImage(systemName: "checkmark.circle.fill")
        }
    }
    
    // Method to hide the selection indicator when not in edit mode
    func hideSelectionIndicator() {
        selectionIndicatorImageView.isHidden = true
    }
    
    func configureData(chat: Chats?){
        userNameLabel.text = chat?.name
        userDescription.text = chat?.description
        dateLabel.text = chat?.date
        userProfileImage.image = chat?.profileImage
        
    }
    
}


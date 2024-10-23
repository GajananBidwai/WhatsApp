//
//  EditContactTableViewCell.swift
//  WhatsApp
//
//  Created by abcd on 23/10/24.
//

import UIKit

class EditContactTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonWithRightArrow: UIButton!
    @IBOutlet weak var moreFieldsButton: UIButton!
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var textFieldLeading: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.text = "Name"
    }
    
    func configureData(editContact: EditContact){
        titleLabel.text = editContact.title
        titleLabel.isHidden = true
        textField.isHidden = true
        buttonWithRightArrow.isHidden = true
        moreFieldsButton.isHidden = true
        arrowButton.isHidden = true
        deleteButton.isHidden = true
        textField.borderStyle = .none
        
        switch editContact.rowType{
            
        case .name:
            titleLabel.isHidden = false
            textField.isHidden = false
            textFieldLeading.constant = 70
        case .sirName:
            textField.isHidden = false
            textFieldLeading.constant = 114
        case .Phone:
            textField.isHidden = false
            arrowButton.isHidden = false
            titleLabel.isHidden = false
            textFieldLeading.constant = 67
        case .mobileNumber:
            buttonWithRightArrow.isHidden = false
            textField.isHidden = false
            textFieldLeading.constant = 115
        case .moreField:
            moreFieldsButton.isHidden = false
        case .DeleteNumber:
            deleteButton.isHidden = false
        }
        
        
        
//        switch editContact.title {
//            
//        case .textTitle:
//            titleLabel.isHidden = false
//            subtitleLabel.isHidden = false
//            
//        case .button:
//            moreFieldsButton.isHidden = false
//            
//        case .buttonWithRightArrow:
//            buttonWithRightArrow.isHidden = false
//            subtitleLabel.isHidden = false
//            
//        case nil:
//            titleLabel.isHidden = true
//            subtitleLabel.isHidden = true
//            buttonWithRightArrow.isHidden = true
//            moreFieldsButton.isHidden = true
//            arrowButton.isHidden = true
//        
//        case .some(.none):
//            titleLabel.isHidden = true
//            subtitleLabel.isHidden = true
//            buttonWithRightArrow.isHidden = true
//            moreFieldsButton.isHidden = true
//            arrowButton.isHidden = true
//        }
//        
//        switch editContact.subtitle {
//        case .rightArrowButton:
//            arrowButton.isHidden = false
//        case nil:
//            <#code#>
//        case .some(.none):
//            <#code#>
//        }
        
    }

    
    
}

//
//  EditProfileHeaderView.swift
//  WhatsApp
//
//  Created by abcd on 24/10/24.
//


import UIKit

class EditProfileHeaderView: UIView{
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        registerNIB()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerNIB()
    }
    func registerNIB(){
        if let editProfileHeaderView = Bundle.main.loadNibNamed(CellConstant.CellIdentifier.EditProfileHeaderView, owner: self)?.first as? UIView{
            editProfileHeaderView.frame = self.bounds
            editProfileHeaderView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(editProfileHeaderView)
            
        }
    }
    
}

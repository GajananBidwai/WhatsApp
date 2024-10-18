//
//  HeaderView.swift
//  WhatsApp
//
//  Created by abcd on 18/10/24.
//

import UIKit

class HeaderView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadNib(){
        loadNib()
        Bundle.main.loadNibNamed("HeaderView", owner: self)
    }

}

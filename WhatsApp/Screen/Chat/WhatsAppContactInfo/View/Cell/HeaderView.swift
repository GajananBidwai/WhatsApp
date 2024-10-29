//
//  HeaderView.swift
//  WhatsApp
//
//  Created by abcd on 18/10/24.
//

import UIKit

class HeaderView: UIView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
    }
    func loadNib() {
        if let view = Bundle.main.loadNibNamed(CellConstant.CellIdentifier.HeaderView, owner: self)?.first as? UIView {
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            addSubview(view)
        }
    }
}

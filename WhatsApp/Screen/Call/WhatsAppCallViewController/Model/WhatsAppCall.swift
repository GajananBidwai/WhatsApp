//
//  WhatsAppCall.swift
//  WhatsApp
//
//  Created by abcd on 16/10/24.
//

import UIKit
class WhatsAppCall {
    var name: String
    var callTitle: String
    var date: String
    var userProfileImage: UIImage
    
    init(name: String, callTitle: String, date: String, userProfileImage: UIImage) {
        self.name = name
        self.callTitle = callTitle
        self.date = date
        self.userProfileImage = userProfileImage
    }
}

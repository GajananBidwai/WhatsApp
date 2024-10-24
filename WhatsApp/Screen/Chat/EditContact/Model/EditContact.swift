//
//  EditContact.swift
//  WhatsApp
//
//  Created by abcd on 23/10/24.
//

import UIKit

enum RowType{
    case name
    case sirName
    case Phone
    case mobileNumber
    case moreField
    case DeleteNumber
}

struct EditContact{
    var title: String
    var rowType: RowType
    
}

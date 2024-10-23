//
//  EditProfileViewController.swift
//  WhatsApp
//
//  Created by abcd on 23/10/24.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var editProfileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func backButtonTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    

}

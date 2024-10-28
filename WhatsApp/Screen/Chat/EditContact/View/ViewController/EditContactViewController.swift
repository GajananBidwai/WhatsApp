//
//  EditContactViewController.swift
//  WhatsApp
//
//  Created by abcd on 23/10/24.
//

import UIKit

class EditContactViewController: UIViewController {

    @IBOutlet weak var editContactTableView: UITableView!{
        didSet{
            editContactTableView.register(UINib(nibName: CellConstant.CellIdentifier.EditContactTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.EditContactTableViewCell)
        }
    }
    
    
    var editContact = [EditContact(title: "Name", rowType: .name),
                       EditContact(title: "", rowType: .sirName),
                       EditContact(title: "Phone", rowType: .Phone),
                       EditContact(title: "", rowType: .mobileNumber),
                       EditContact(title: "", rowType: .moreField),
                       EditContact(title: "", rowType: .DeleteNumber)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editContactTableView.allowsSelection = false
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
extension EditContactViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}
extension EditContactViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        editContact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let editContactTableViewCell = self.editContactTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.EditContactTableViewCell) as! EditContactTableViewCell
        
        let model = editContact[indexPath.row]
        editContactTableViewCell.configureData(editContact: model)
        editContactTableViewCell.selectionStyle = .none
        
        return editContactTableViewCell
        
    }
}

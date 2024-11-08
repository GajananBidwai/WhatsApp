//
//  EditProfileViewController.swift
//  WhatsApp
//
//  Created by abcd on 23/10/24.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var editProfileTableView: UITableView!{
        didSet{
            editProfileTableView.register(UINib(nibName: CellConstant.CellIdentifier.EditProfileTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.EditProfileTableViewCell)
        }
    }
    
    var editProfile = 
    [
        [EditProfile(titleValue: "9090909090")],
        [EditProfile(titleValue: "Digital goodies designer - Pixsellz")]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let editProfileHeaderView = EditProfileHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 280))
        title = "Edit Profile"
        editProfileTableView.tableHeaderView = editProfileHeaderView
        editProfileTableView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension EditProfileViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        editProfile.count
    }
}
extension EditProfileViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editProfile[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let editProfileTableViewCell = self.editProfileTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.EditProfileTableViewCell) as! EditProfileTableViewCell
        
        let model = editProfile[indexPath.section][indexPath.row]
        editProfileTableViewCell.configureData(editProfile: model)
        editProfileTableViewCell.selectionStyle = .none
        
        
        return editProfileTableViewCell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        let headerLabel = UILabel(frame: CGRect(x: 20, y: 8, width: self.view.frame.width, height: 20))
        
        
        if section == 0{
            labelText.labelText(labelText: headerLabel, textForHeaderFooterView: "PHONE NUMBER", headerViewAndFooterView: headerView)
        }else{
            labelText.labelText(labelText: headerLabel, textForHeaderFooterView: "ABOUT", headerViewAndFooterView: headerView)
        }
        
        headerView.backgroundColor = .clear
        return headerView
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
}

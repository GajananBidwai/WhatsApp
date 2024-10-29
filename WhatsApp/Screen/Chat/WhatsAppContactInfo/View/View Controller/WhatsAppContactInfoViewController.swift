//
//  WhatsAppContactInfoViewController.swift
//  WhatsApp
//
//  Created by abcd on 18/10/24.
//

import UIKit

class WhatsAppContactInfoViewController: UIViewController {

    
    @IBOutlet weak var contactInfoTableView: UITableView!{
        didSet{
            contactInfoTableView.register(UINib(nibName: CellConstant.CellIdentifier.ContactInfoTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.ContactInfoTableViewCell)
        }
    }
    var chats: Chats?
    var contactInfo = 
    [
        [ContactInfo(image: UIImage(named: "Media")!, title: "Media, links and Docs", subtitle: "12"),
         ContactInfo(image: UIImage(named: "StarredMassage")!, title: "Starred Messages", subtitle: "none"),
         ContactInfo(image: UIImage(named: "ChatSearch")!, title: "Chat Search", subtitle: "")],
    
        [ContactInfo(image: UIImage(named: "Mute")!, title: "Mute", subtitle: "No")]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 480))
        headerView.nameLabel.text = chats?.name
        headerView.profileImageView.image = chats?.profileImage
        headerView.contactLabel.text = chats?.contactNumber
        contactInfoTableView.tableHeaderView = headerView
        contactInfoTableView.showsVerticalScrollIndicator = false
    }
    

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func editButtonTap(_ sender: Any) {
        let editContactViewController = self.storyboard?.instantiateViewController(withIdentifier: "EditContactViewController") as! EditContactViewController
        
        self.navigationController?.pushViewController(editContactViewController, animated: true)
    }
    
}
extension WhatsAppContactInfoViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
extension WhatsAppContactInfoViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactInfo[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactInfoTableViewCell = self.contactInfoTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.ContactInfoTableViewCell) as! ContactInfoTableViewCell
    
        contactInfoTableViewCell.configureData(contactInfo: contactInfo[indexPath.section][indexPath.row])
        contactInfoTableViewCell.selectionStyle = .none
        
        return contactInfoTableViewCell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactInfo.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        footerView.backgroundColor = .clear
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 0 ? 25 : 0
    }
    
}

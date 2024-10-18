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
    var contactInfo = [ContactInfo(image: UIImage(named: "Media")!, title: "Media, links and Docs", subtitle: "12"),
    ContactInfo(image: UIImage(named: "StarredMassage")!, title: "Starred Messages", subtitle: "none"),
    ContactInfo(image: UIImage(named: "ChatSearch")!, title: "Chat Search", subtitle: ""),
    ContactInfo(image: UIImage(named: "Mute")!, title: "Mute", subtitle: "No")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 400))
        headerView.nameLabel.text = chats?.name
        
        contactInfoTableView.tableHeaderView = headerView
    }
    

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
extension WhatsAppContactInfoViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
extension WhatsAppContactInfoViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactInfoTableViewCell = self.contactInfoTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.ContactInfoTableViewCell) as! ContactInfoTableViewCell
        
        contactInfoTableViewCell.contactInfo = contactInfo[indexPath.row]
        contactInfoTableViewCell.configureData()
        return contactInfoTableViewCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
}

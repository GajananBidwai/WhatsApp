//
//  WhatsAppSettingsViewController.swift
//  WhatsApp
//
//  Created by abcd on 21/10/24.
//

import UIKit

class WhatsAppSettingsViewController: UIViewController {

    
    @IBOutlet weak var WhatsAppSettingsTableView: UITableView!{
        didSet{
            WhatsAppSettingsTableView.register(UINib(nibName: CellConstant.CellIdentifier.WhatsAppSettingsTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.WhatsAppSettingsTableViewCell)
        }
    }
    let WhatsAppSettings = 
    [
        [
        WhatsAppSetting(image: UIImage(named: "StarredMassage")!, title: "Starred Messages"),
        WhatsAppSetting(image: UIImage(named: "WhatsAppWeb")!, title: "WhatsApp Web/ Desktop")],
        [
        WhatsAppSetting(image: UIImage(named: "Account")!, title: "Account"),
        WhatsAppSetting(image: UIImage(named: "Chats")!, title: "Chats"),
        WhatsAppSetting(image: UIImage(named: "Notification")!, title: "Notications"),
        WhatsAppSetting(image: UIImage(named: "DataAndStoarageUsage")!, title: "Data and Storage Usage")],
        [
        WhatsAppSetting(image: UIImage(named: "Help")!, title: "Help"),
        WhatsAppSetting(image: UIImage(named: "TellAFriend")!, title: "Tell a Friend")]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let settingsHeaderView = SettingsHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 125))
        WhatsAppSettingsTableView.tableHeaderView = settingsHeaderView
        self.navigationController?.navigationBar.isHidden = true
        
        
    }
    
}
extension WhatsAppSettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return WhatsAppSettings.count
    }
}
extension WhatsAppSettingsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        WhatsAppSettings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let whatsAppSettingsTableViewCell = self.WhatsAppSettingsTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.WhatsAppSettingsTableViewCell) as! WhatsAppSettingsTableViewCell
        
        whatsAppSettingsTableViewCell.settingsIcon.image = WhatsAppSettings[indexPath.section][indexPath.row].image
        whatsAppSettingsTableViewCell.settingsTitle.text = WhatsAppSettings[indexPath.section][indexPath.row].title
        
        return whatsAppSettingsTableViewCell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        view.backgroundColor = .clear
        return view

    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 2 ? 0 : 30
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            if indexPath.row == 0{
                let whatsAppAccountViewController = self.storyboard?.instantiateViewController(identifier: "WhatsAppAccountViewController") as! WhatsAppAccountViewController
                
                self.navigationController?.pushViewController(whatsAppAccountViewController, animated: true)
                
            } else if indexPath.row == 1{
                let chatSettingsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChatSettingsViewController") as! ChatSettingsViewController
                
                self.navigationController?.pushViewController(chatSettingsViewController, animated: true)
            }
        }
    }
    
    
    
}

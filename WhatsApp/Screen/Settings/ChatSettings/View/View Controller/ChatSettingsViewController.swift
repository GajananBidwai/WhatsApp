//
//  ChatSettingsViewController.swift
//  WhatsApp
//
//  Created by abcd on 21/10/24.
//

import UIKit
class ChatSettingsViewController: UIViewController {

    
    @IBOutlet weak var chatSettingsTableView: UITableView!{
        didSet{
            chatSettingsTableView.register(UINib(nibName: CellConstant.CellIdentifier.SettingsTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.SettingsTableViewCell)
        }
    }
    
    var settings = 
    [
        [Settings(title: "Change Wallpaper", rightAccessory: .rightArrowButton, textColor: .black)],
        [Settings(title: "Save to Camera Roll", rightAccessory: .switchbutton, textColor: .black)],
        [Settings(title: "Chat Backup", rightAccessory: .rightArrowButton, textColor: .black)],
        [
            Settings(title: "Archive All Chats", rightAccessory: .none, textColor: .blue),
            Settings(title: "Clear All Chats", rightAccessory: .none, textColor: .red),
            Settings(title: "Delete All Chats", rightAccessory: .none, textColor: .red)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    
    }
}
extension ChatSettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        settings.count
    }
}
extension ChatSettingsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsTableViewCell = self.chatSettingsTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.SettingsTableViewCell) as! SettingsTableViewCell
        
        let model = settings[indexPath.section][indexPath.row]
        settingsTableViewCell.configure(with: model)
        settingsTableViewCell.titleLabel.textColor = settings[indexPath.section][indexPath.row].textColor
        
        return settingsTableViewCell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 25))
        headerView.backgroundColor = .clear
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 2 ? 20 : 25
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        
        if section == 1{
            let footerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
            
            footerLabel.text = "Automatically save photos and videos you receive to your iPhone’s Camera Roll."
            footerLabel.numberOfLines = 2
            footerLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
            footerLabel.textColor = UIColor(named: "Colors/lightGrey")
            footerLabel.textAlignment = .center
            footerLabel.textColor = .black
            
            footerView.addSubview(footerLabel)
        }
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 1 ? 25 : 0
    }
    
}

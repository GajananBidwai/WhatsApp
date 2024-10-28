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
        [Settings(title: "Change Wallpaper", rightAccessory: .rightArrowButton, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .black)],
        [Settings(title: "Save to Camera Roll", rightAccessory: .switchbutton, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .black)],
        [Settings(title: "Chat Backup", rightAccessory: .rightArrowButton, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .black)],
        [
            Settings(title: "Archive All Chats", rightAccessory: .none, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .blue),
            Settings(title: "Clear All Chats", rightAccessory: .none, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .red),
            Settings(title: "Delete All Chats", rightAccessory: .none, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .red)
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
        settingsTableViewCell.selectionStyle = .none
        
        return settingsTableViewCell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        headerView.backgroundColor = .clear
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 2 ? 20 : 20
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        
        if section == 1{
            let footerLabel = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.width, height: 40))
    
            labelText(labelText: footerLabel, textForHeaderFooterView: "Automatically save photos and videos you receive to your iPhone’s Camera Roll.", headerViewAndFooterView: footerView)
        }
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 1 ? 25 : 0
    }
    
}

extension ChatSettingsViewController {
    func labelText(labelText: UILabel, textForHeaderFooterView: String, headerViewAndFooterView: UIView) {
        labelText.text = textForHeaderFooterView
        labelText.numberOfLines = 2
        labelText.font = UIFont.systemFont(ofSize: 14, weight: .light)
        labelText.textColor = UIColor(named: "lightgrey") ?? .black
        labelText.textAlignment = .left
        headerViewAndFooterView.addSubview(labelText)
    }
}

//
//  NotificationSettingsViewController.swift
//  WhatsApp
//
//  Created by abcd on 22/10/24.
//

import UIKit

class NotificationSettingsViewController: UIViewController {

    var notificationSettings = 
    [
        [Settings(title: "Show Notifications", rightAccessory: .switchbutton, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .black),
         Settings(title: "Sound", rightAccessory: .rightArrowButton, buttonTitle: .note, textColor: .black)],
        [Settings(title: "Show Notifications", rightAccessory: .switchbutton, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .black),
         Settings(title: "Sound", rightAccessory: .rightArrowButton, buttonTitle: .note, textColor: .black)],
        [Settings(title: "In-App Notifications", rightAccessory: .rightArrowButton, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .black)],
        [Settings(title: "Show Preview", rightAccessory: .switchbutton, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .black)],
        [Settings(title: "Reset Notification Settings", rightAccessory: .none, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .red)
        ]
    ]

    @IBOutlet weak var notificationSettingTableView: UITableView!{
        didSet{
            notificationSettingTableView.register(UINib(nibName: CellConstant.CellIdentifier.SettingsTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.SettingsTableViewCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationSettingTableView.showsVerticalScrollIndicator = false
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
extension NotificationSettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        notificationSettings.count
    }
}
extension NotificationSettingsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notificationSettings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsTableViewCell = self.notificationSettingTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.SettingsTableViewCell) as! SettingsTableViewCell
        
        let model = notificationSettings[indexPath.section][indexPath.row]
        settingsTableViewCell.configure(with: model)
        settingsTableViewCell.buttonTitle.backgroundColor = .red
        settingsTableViewCell.selectionStyle = .none
        
        return settingsTableViewCell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        headerView.backgroundColor = .clear
        
        if section == 0{
            let headerLabel = UILabel(frame: CGRect(x: 12, y: headerView.frame.height - 20, width: self.view.frame.width, height: 20))
            
            labelText.labelText(labelText: headerLabel, textForHeaderFooterView: "MESSAGE NOTIFICATIONS", headerViewAndFooterView: headerView)
            
        }else if section == 1{
            let headerLabel = UILabel(frame: CGRect(x: 12, y: headerView.frame.height - 20, width: self.view.frame.width, height: 20))
            
            labelText.labelText(labelText: headerLabel, textForHeaderFooterView: "GROUP NOTIFICATIONS", headerViewAndFooterView: headerView)
        }
       
        
        
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        let footerLabel = UILabel(frame: CGRect(x: 12, y: 0, width: self.view.frame.width, height: 20))
        labelText.labelText(labelText: footerLabel, textForHeaderFooterView: "Preview message text inside new message notifications.", headerViewAndFooterView: footerView)
        
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 3 ? 20 : 0
    }
    
}
//extension NotificationSettingsViewController {
//    func labelText(labelText: UILabel, textForHeaderFooterView: String, headerViewAndFooterView: UIView) {
//        labelText.text = textForHeaderFooterView
//        labelText.numberOfLines = 2
//        labelText.font = UIFont.systemFont(ofSize: 14, weight: .light)
//        labelText.textColor = UIColor(named: "lightgrey") ?? .black
//        labelText.textAlignment = .left
//        
//        headerViewAndFooterView.addSubview(labelText)
//    }
//}

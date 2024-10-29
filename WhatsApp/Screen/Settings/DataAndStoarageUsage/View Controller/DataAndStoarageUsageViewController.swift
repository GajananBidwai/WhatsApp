//
//  DataAndStoarageUsageViewController.swift
//  WhatsApp
//
//  Created by abcd on 23/10/24.
//

import UIKit

class DataAndStoarageUsageViewController: UIViewController {

    
    @IBOutlet weak var dataStoarageTableView: UITableView!{
        didSet{
            dataStoarageTableView.register(UINib(nibName: CellConstant.CellIdentifier.SettingsTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.SettingsTableViewCell)
        }
    }
    
    var dataStoarageSetting =
    [
        [Settings(title: "Photos", rightAccessory: .rightArrowButton, buttonTitle: .wifiAndCellular, textColor: .black),
         Settings(title: "Audio", rightAccessory: .rightArrowButton, buttonTitle: .wifi, textColor: .black),
         Settings(title: "Videos", rightAccessory: .rightArrowButton, buttonTitle: .wifi, textColor: .black),
         Settings(title: "Documents", rightAccessory: .rightArrowButton, buttonTitle: .wifi, textColor: .black),
         Settings(title: "Reset Auto-Download Settings", rightAccessory: .none, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .lightGray)],
        [Settings(title: "Low Data Usage", rightAccessory: .switchbutton, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .black)],
        [Settings(title: "Network Usage", rightAccessory: .rightArrowButton, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .black),
         Settings(title: "Stoarage Usage", rightAccessory: .rightArrowButton, buttonTitle: RightAccessoryType.buttonTitle.none, textColor: .black)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataStoarageTableView.showsVerticalScrollIndicator = false
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
extension DataAndStoarageUsageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataStoarageSetting.count
    }
}
extension DataAndStoarageUsageViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStoarageSetting[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsTableViewCell = self.dataStoarageTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.SettingsTableViewCell) as! SettingsTableViewCell
        
        let model = dataStoarageSetting[indexPath.section][indexPath.row]
        settingsTableViewCell.configure(with: model)
        settingsTableViewCell.selectionStyle = .none
        return settingsTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 2 ? 20 : 30.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        
        let headerLabel = UILabel(frame: CGRect(x: 20, y: headerView.frame.height - 32, width: self.view.frame.width, height: 30))
        
        if section == 0{
            labelText.labelText(labelText: headerLabel, textForHeaderFooterView: "MEDIA AUTO-DOWNLOAD", headerViewAndFooterView: headerView)
        }
        
        if section == 1{
            labelText.labelText(labelText: headerLabel, textForHeaderFooterView: "CALL SETTINGS", headerViewAndFooterView: headerView)
        }
        
        headerView.backgroundColor = .clear
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 20, y: 0, width: self.view.frame.width - 10, height: 40))
        let footerLabel = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.width - 10, height: 40))
        
        footerLabel.textAlignment = .center
        footerLabel.textColor = .lightGray
        
        if section == 0{
            labelText.labelText(labelText: footerLabel, textForHeaderFooterView: "Voice Messages are always automatically downloaded for the best communication experience.", headerViewAndFooterView: footerView)
        }
        if section == 1{
            labelText.labelText(labelText: footerLabel, textForHeaderFooterView: "Lower the amount of data used during a WhatsAoo call on cellular.", headerViewAndFooterView: footerView)
        }
        return footerView
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
}

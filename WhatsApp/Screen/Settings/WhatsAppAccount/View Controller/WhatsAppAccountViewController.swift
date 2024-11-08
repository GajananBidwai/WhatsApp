//
//  WhatsAppAccountViewController.swift
//  WhatsApp
//
//  Created by abcd on 21/10/24.
//

import UIKit

class WhatsAppAccountViewController: UIViewController {
    
    var account = [
        ["Privacy", "Security", "Two-Step Verification", "Change Number"],
        [ "Request Account Info", "Delete My Account"]
    ]
    
    @IBOutlet weak var whatsAppAccountTableView: UITableView!{
        didSet{
            whatsAppAccountTableView.register(UINib(nibName: CellConstant.CellIdentifier.WhatsAppAccountTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.WhatsAppAccountTableViewCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  navigationController?.navigationBar.isHidden = true
      //  navigationController?.navigationItem.backButtonTitle = "Account"
        title = "Account"
        whatsAppAccountTableView.showsVerticalScrollIndicator = false
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension WhatsAppAccountViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        account.count
    }
}
extension WhatsAppAccountViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        account[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let whatsAppAccountTableViewCell = self.whatsAppAccountTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.WhatsAppAccountTableViewCell) as! WhatsAppAccountTableViewCell
        
        whatsAppAccountTableViewCell.accountTitleLabel.text = account[indexPath.section][indexPath.row]
        whatsAppAccountTableViewCell.selectionStyle = .none
        
        return whatsAppAccountTableViewCell
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 25))
        footerView.backgroundColor = .clear
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 1 ? 0 : 25
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 25))
        headerView.backgroundColor = .clear
        
        return headerView
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 25 : 0
    }
    
}

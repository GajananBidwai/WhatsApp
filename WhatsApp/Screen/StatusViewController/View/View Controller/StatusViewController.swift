//
//  StatusViewController.swift
//  WhatsApp
//
//  Created by abcd on 24/10/24.
//

import UIKit

class StatusViewController: UIViewController {

    
    @IBOutlet weak var statusTableView: UITableView!{
        didSet{
            statusTableView.register(UINib(nibName: CellConstant.CellIdentifier.StatusTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.StatusTableViewCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
    }
    

    
}
extension StatusViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension StatusViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statusTableViewCell = self.statusTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.StatusTableViewCell) as! StatusTableViewCell
        
        
        return statusTableViewCell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30))
        
        headerView.backgroundColor = .clear
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        let footerLabel = UILabel(frame: CGRect(x: 0, y: 40, width: self.view.frame.width, height: 50))
        footerLabel.textAlignment = .justified
        footerLabel.text = "No recent updates to show right now."
        footerLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        footerLabel.textColor = UIColor.darkGray
        footerLabel.textAlignment = .center
        footerLabel.backgroundColor = .white
        footerView.addSubview(footerLabel)

        return footerView
        
    }
    
}

//
//  WhatsAppCallViewController.swift
//  WhatsApp
//
//  Created by abcd on 16/10/24.
//

import UIKit

class WhatsAppCallViewController: UIViewController {
    
    var whatsAppCall =
    [
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "missed", date: "16/10/24", userProfileImage:
                        UIImage(named: "Oval(1)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/24", userProfileImage:
                        UIImage(named: "Oval(2)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "missed", date: "16/10/24", userProfileImage:
                        UIImage(named: "Oval(3)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/24", userProfileImage:
                        UIImage(named: "Oval(4)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "missed", date: "16/10/24", userProfileImage:
                        UIImage(named: "Oval(5)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/24", userProfileImage:
                        UIImage(named: "Oval(6)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "missed", date: "16/10/24", userProfileImage:
                        UIImage(named: "Oval(4)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/24", userProfileImage:
                        UIImage(named: "Oval(2)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "incoming", date: "16/10/24", userProfileImage: UIImage(named: "Oval(2)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/24", userProfileImage:
                        UIImage(named: "Oval(3)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "incoming", date: "16/10/24", userProfileImage: UIImage(named: "Oval(4)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/24", userProfileImage:
                        UIImage(named: "Oval(5)")!),
        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "incoming", date: "16/10/24", userProfileImage: UIImage(named: "Oval(6)")!)
    ]
    var filteredWhatsAppCall: [WhatsAppCall] = []
    
    
    @IBOutlet weak var whatsAppCallsTableView: UITableView!{
        didSet{
            whatsAppCallsTableView.register(UINib(nibName: CellConstant.CellIdentifier.WhatsAppCallTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.WhatsAppCallTableViewCell)
        }
    }
    
    @IBOutlet weak var callSegment: UISegmentedControl!{
        didSet{
            callSegment.layer.borderWidth = 1
            callSegment.layer.borderColor = UIColor.systemBlue.cgColor
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentAppearance()
        whatsAppCallsTableView.showsVerticalScrollIndicator = false
        updateFilterCalls()
    }
    
    func segmentAppearance(){
        
        callSegment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        callSegment.setTitleTextAttributes([.foregroundColor: UIColor.systemBlue], for: .normal)
        
    }
    func updateFilterCalls(){
        if callSegment.selectedSegmentIndex == 0{
            filteredWhatsAppCall = whatsAppCall
        }else if callSegment.selectedSegmentIndex == 1{
            filteredWhatsAppCall = whatsAppCall.filter({ $0.callTitle == "missed" })
            
        }
        whatsAppCallsTableView.reloadData()
    }
    
    @IBAction func segmentControlAction(_ sender: Any) {
        updateFilterCalls()
    }
    
    
    
    
    @IBAction func editButtonTap(_ sender: Any) {
        let isEditing = !whatsAppCallsTableView.isEditing
        whatsAppCallsTableView.setEditing(isEditing, animated: true)
        
        if whatsAppCallsTableView.isEditing{
            navigationItem.leftBarButtonItem?.title = "Done"
            whatsAppCallsTableView.reloadData()
        }else{
            navigationItem.leftBarButtonItem?.title = "Edit"
        }
        whatsAppCallsTableView.reloadData()
    }
    
}
extension WhatsAppCallViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
}
extension WhatsAppCallViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredWhatsAppCall.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let whatsAppCallTableViewCell = self.whatsAppCallsTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.WhatsAppCallTableViewCell) as! WhatsAppCallTableViewCell
        
        whatsAppCallTableViewCell.whatsAppCall = filteredWhatsAppCall[indexPath.row]
        whatsAppCallTableViewCell.configureData()
        whatsAppCallTableViewCell.selectionStyle = .none
        return whatsAppCallTableViewCell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let removedCall = filteredWhatsAppCall.remove(at: indexPath.row)
            if let index = whatsAppCall.firstIndex(where: { $0 === removedCall }) {
                whatsAppCall.remove(at: index)
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            let removedCall = self.filteredWhatsAppCall.remove(at: indexPath.row)
            if let index = self.whatsAppCall.firstIndex(where: { $0 === removedCall }) {
                self.whatsAppCall.remove(at: index)
            }
            self.whatsAppCallsTableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

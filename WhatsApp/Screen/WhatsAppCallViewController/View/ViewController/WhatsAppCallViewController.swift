//
//  WhatsAppCallViewController.swift
//  WhatsApp
//
//  Created by abcd on 16/10/24.
//

import UIKit

class WhatsAppCallViewController: UIViewController {

    var whatsAppCall = [WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/20234"),
                        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "incoming", date: "16/10/20234"),
                        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/20234"),
                        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "incoming", date: "16/10/20234"),
                        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/20234"),
                        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "incoming", date: "16/10/20234")]
    
    
    
    @IBOutlet weak var whatsAppCallsTableView: UITableView!{
        didSet{
            whatsAppCallsTableView.register(UINib(nibName: CellConstant.CellIdentifier.WhatsAppCallTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.WhatsAppCallTableViewCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        return whatsAppCall.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let whatsAppCallTableViewCell = self.whatsAppCallsTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.WhatsAppCallTableViewCell) as! WhatsAppCallTableViewCell
        
        whatsAppCallTableViewCell.whatsAppCall = whatsAppCall[indexPath.row]
        whatsAppCallTableViewCell.configureData()
        return whatsAppCallTableViewCell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            whatsAppCall.remove(at: indexPath.row)
            whatsAppCallsTableView.deselectRow(at: indexPath, animated: true)
            print("Delete row at \(indexPath.row)")
        }
    }
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 0.5) {
            cell?.contentView.transform = CGAffineTransform(translationX: 20, y: 0)
        }
    }
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        let cell = tableView.cellForRow(at: indexPath!)
        UIView.animate(withDuration: 0.5) {
            cell?.contentView.transform = CGAffineTransform.identity
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, willEndEditingRowAt indexPath: IndexPath?) {
        if let indexPath = indexPath {
            // Reset all cells back to their original position
            for i in 0..<tableView.numberOfRows(inSection: indexPath.section) {
                if let cell = tableView.cellForRow(at: IndexPath(row: i, section: indexPath.section)) {
                    UIView.animate(withDuration: 0.3) {
                        cell.contentView.transform = .identity
                    }
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            // Handle delete action
            self.whatsAppCall.remove(at: indexPath.row)
            self.whatsAppCallsTableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}

//
//  WhatsAppChatsViewController.swift
//  WhatsApp
//
//  Created by abcd on 15/10/24.
//

import UIKit

class WhatsAppChatsViewController: UIViewController {
    
    @IBOutlet weak var whatsAppChatsTableView: UITableView!{
        didSet{
            whatsAppChatsTableView.register(UINib(nibName: CellConstant.CellIdentifier.chatsTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.chatsTableViewCell)
        }
    }
    
    
    var chats = [Chats(name: "Gajanan Bidwai", description: "Where are you!", date: "15/10/2024"),
                 Chats(name: "Manjeet", description: "Smart guy in the office", date: "15/10/2024"),
                 Chats(name: "Mahesh sir", description: "Creative Devloper", date: "15/10/2024"),
                 Chats(name: "Gajanan Bidwai", description: "Where are you!", date: "15/10/2024"),
                 Chats(name: "Manjeet", description: "Smart guy in the office", date: "15/10/2024"),
                 Chats(name: "Mahesh sir", description: "Creative Devloper", date: "15/10/2024"),
                 Chats(name: "Gajanan Bidwai", description: "Where are you!", date: "15/10/2024"),
                 Chats(name: "Manjeet", description: "Smart guy in the office", date: "15/10/2024"),
                 Chats(name: "Mahesh sir", description: "Creative Devloper", date: "15/10/2024")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func editButton(_ sender: Any) {
        whatsAppChatsTableView.setEditing(!whatsAppChatsTableView.isEditing, animated: true)
        
        if whatsAppChatsTableView.isEditing{
            navigationItem.leftBarButtonItem?.title = "Done"
        }else{
            navigationItem.leftBarButtonItem?.title = "Edit"
        }
        
    }
    
    
    
}
extension WhatsAppChatsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
}
extension WhatsAppChatsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chatsTableViewCell = self.whatsAppChatsTableView.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.chatsTableViewCell) as! ChatsTableViewCell
        
        chatsTableViewCell.userNameLabel.text = chats[indexPath.row].name
        chatsTableViewCell.userDescription.text = chats[indexPath.row].description
        chatsTableViewCell.dateLabel.text = chats[indexPath.row].date
        return chatsTableViewCell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   //  Provide editing style (e.g., delete or custom buttons)
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete // Can be customized to .none if you want custom actions
    }
    
    // Customize editing actions (e.g., delete, archive)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Handle delete action (remove from data source, update table view)
            print("Delete row at \(indexPath.row)")
        }
    }
    
    // Move cell content slightly to the right when editing mode is enabled
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        // Customize the cell appearance when entering edit mode (slightly shift to the right)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.transform = CGAffineTransform(translationX: 20, y: 0)
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        // Reset the cell appearance when editing ends
        let cell = tableView.cellForRow(at: indexPath!)
        cell?.contentView.transform = CGAffineTransform.identity
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let archiveAction = UIContextualAction(style: .normal, title: "Archive") { (action, view, completionHandler) in
            
            completionHandler(true)
        }
        
        archiveAction.image = UIImage(named: "Archive")
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            // Handle delete action
            completionHandler(true)
        }
        deleteAction.image = UIImage(named: "More")
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction, archiveAction])
        return configuration
    }
    
}


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
    
    @IBOutlet weak var editIconButton: UIBarButtonItem!
    @IBOutlet weak var boradCastButton: UIButton!
    @IBOutlet weak var newGroupButton: UIButton!
    
    @IBOutlet weak var activeButtonContainerView: UIView!
    @IBOutlet weak var archiveButton: UIButton!
    @IBOutlet weak var readAllButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    private var selectedIndices = Set<IndexPath>()
    
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
        activeButtonContainerView.isHidden = true
        
    }
    
    @IBAction func editButton(_ sender: Any) {
        //   whatsAppChatsTableView.setEditing(!whatsAppChatsTableView.isEditing, animated: true)
        let isEditing = !whatsAppChatsTableView.isEditing
        whatsAppChatsTableView.setEditing(isEditing, animated: true)
        
        if whatsAppChatsTableView.isEditing{
            if let tabBarFrame = self.tabBarController?.tabBar.frame {
                UIView.animate(withDuration: 0.3) {
                    self.tabBarController?.tabBar.frame = CGRect(x: tabBarFrame.origin.x, y: UIScreen.main.bounds.height, width: tabBarFrame.width, height: tabBarFrame.height)
                }
            }
            activeButtonContainerView.isHidden = false
            navigationItem.leftBarButtonItem?.title = "Done"
            boradCastButton.isEnabled = false
            newGroupButton.isEnabled = false
            editIconButton.isEnabled = false
            whatsAppChatsTableView.reloadData()
        }else{
            if let tabBarFrame = self.tabBarController?.tabBar.frame {
                UIView.animate(withDuration: 0.3) {
                    self.tabBarController?.tabBar.frame = CGRect(x: tabBarFrame.origin.x, y: UIScreen.main.bounds.height - tabBarFrame.height, width: tabBarFrame.width, height: tabBarFrame.height)
                }
            }
            activeButtonContainerView.isHidden = true
            navigationItem.leftBarButtonItem?.title = "Edit"
            boradCastButton.isEnabled = true
            newGroupButton.isEnabled = true
            selectedIndices.removeAll()
            whatsAppChatsTableView.reloadData()
            updateActionButtons()
        }
        
    }
    func updateActionButtons() {
        // Enable or disable the archive and delete buttons based on selection
        let isEnabled = !selectedIndices.isEmpty
        archiveButton.isEnabled = isEnabled
        deleteButton.isEnabled = isEnabled
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
        
        if tableView.isEditing {
            let isSelected = tableView.indexPathsForSelectedRows?.contains(indexPath) ?? false
            chatsTableViewCell.updateSelectionIndicator(isSelected: isSelected)
        } else {
            chatsTableViewCell.hideSelectionIndicator() // Hide the circle when not editing
        }
        
        return chatsTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Toggle selection
            if selectedIndices.contains(indexPath) {
                selectedIndices.remove(indexPath)
            } else {
                selectedIndices.insert(indexPath)
            }
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
            // Update action buttons
            updateActionButtons()
        }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   //  Provide editing style (e.g., delete or custom buttons)
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Customize editing actions (e.g., delete, archive)
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Handle delete action (remove from data source, update table view)
        
            chats.remove(at: indexPath.row)
            whatsAppChatsTableView.deleteRows(at: [indexPath], with: .automatic)
            print("Delete row at \(indexPath.row)")
        }
    }
    
    // Move cell content slightly to the right when editing mode is enabled
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        // Customize the cell appearance when entering edit mode (slightly shift to the right)
        let cell = tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 0.3) {
            cell?.contentView.transform = CGAffineTransform(translationX: 20, y: 0)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        // Reset the cell appearance when editing ends
        let cell = tableView.cellForRow(at: indexPath!)
        UIView.animate(withDuration: 0.3) {
            cell?.contentView.transform = CGAffineTransform.identity
        }
        
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


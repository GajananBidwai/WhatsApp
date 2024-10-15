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
    
    
}


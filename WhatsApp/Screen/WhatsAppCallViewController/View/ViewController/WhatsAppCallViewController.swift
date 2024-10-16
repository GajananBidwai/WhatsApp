//
//  WhatsAppCallViewController.swift
//  WhatsApp
//
//  Created by abcd on 16/10/24.
//

import UIKit

class WhatsAppCallViewController: UIViewController {

    var whatsAppCall = [WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/20234"),
                        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "outgoing", date: "16/10/20234"),
                        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/20234"),
                        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/20234"),
                        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/20234"),
                        WhatsAppCall(name: "Gajanan Bidwai", callTitle: "ongoing", date: "16/10/20234")]
    
    
    @IBOutlet weak var whatsAppCallsTableViewCell: UITableView!{
        didSet{
            whatsAppCallsTableViewCell.register(UINib(nibName: CellConstant.CellIdentifier.WhatsAppCallTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.WhatsAppCallTableViewCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        let whatsAppCallTableViewCell = self.whatsAppCallsTableViewCell.dequeueReusableCell(withIdentifier: CellConstant.CellIdentifier.WhatsAppCallTableViewCell) as! WhatsAppCallTableViewCell
        
        whatsAppCallTableViewCell.whatsAppCall = whatsAppCall[indexPath.row]
        whatsAppCallTableViewCell.configureData()
        return whatsAppCallTableViewCell
    }
    
    
}

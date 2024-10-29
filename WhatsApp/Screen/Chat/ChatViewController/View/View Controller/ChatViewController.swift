//
//  ChatViewController.swift
//  WhatsApp
//
//  Created by abcd on 17/10/24.
//

import UIKit
import IQKeyboardManagerSwift
class ChatViewController: UIViewController {

    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastActiveLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var userInputTextField: UITextField!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    var chats: Chats?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtonInTextField()
        self.navigationItem.setHidesBackButton(true, animated: true)
        nameLabel.text = chats?.name
        userProfileImageView.image = chats?.profileImage
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    deinit {
        // Remove observers when not needed
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
            if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                let keyboardHeight = keyboardFrame.height
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin.y = -keyboardHeight + self.view.safeAreaInsets.bottom
                }
            }
        }

        @objc func keyboardWillHide(notification: NSNotification) {
            UIView.animate(withDuration: 0.3) {
                self.view.frame.origin.y = 0
            }
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            IQKeyboardManager.shared.enable = false
            
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            IQKeyboardManager.shared.enable = true
        }
    

    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func navigateToContactInfo(_ sender: Any) {
        let whatsAppContactInfoViewController = self.storyboard?.instantiateViewController(identifier: "WhatsAppContactInfoViewController") as! WhatsAppContactInfoViewController
        whatsAppContactInfoViewController.chats = chats
        
        self.navigationController?.pushViewController(whatsAppContactInfoViewController, animated: true)
    }
    
    
    @IBAction func plusButtonAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraImage = UIImage(named: "Camera")
        let photosImage = UIImage(named: "Photos")
        let documentImage = UIImage(named: "Documents")
        let locationImage = UIImage(named: "Location")
        let contactImage = UIImage(named: "Contact")
        
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { _ in
            print("Camera Pressed")
        }
        let photosAction = UIAlertAction(title: "Photo & Video Library", style: .default) { _ in
            print("Photo Pressed")
        }
        let documentAction = UIAlertAction(title: "Document", style: .default) { _ in
            print("Document Pressed")
        }
        let locationAction = UIAlertAction(title: "Location", style: .default) { _ in
            print("Location Pressed")
        }
        let contactAction = UIAlertAction(title: "Contact", style: .default) { _ in
            print("Contact Pressed")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel Pressed")
        }
        
        
        cameraAction.setValue(cameraImage?.withRenderingMode(.alwaysOriginal), forKey: "image")
        photosAction.setValue(photosImage?.withRenderingMode(.alwaysOriginal), forKey: "image")
        documentAction.setValue(documentImage?.withRenderingMode(.alwaysOriginal), forKey: "image")
        locationAction.setValue(locationImage?.withRenderingMode(.alwaysOriginal), forKey: "image")
        contactAction.setValue(contactImage?.withRenderingMode(.alwaysOriginal), forKey: "image")
        
        
        alertController.addAction(cameraAction)
        alertController.addAction(photosAction)
        alertController.addAction(documentAction)
        alertController.addAction(locationAction)
        alertController.addAction(contactAction)
        
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
        
        
    }
    func addButtonInTextField(){
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Shape(2)"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(userInputTextField.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
   //     button.addTarget(self, action: #selector(self.refresh), for: .touchUpInside)
        userInputTextField.rightView = button
        userInputTextField.rightViewMode = .always
    }
    
}

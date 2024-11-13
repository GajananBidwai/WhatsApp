//
//  ChatViewController.swift
//  WhatsApp
//
//  Created by abcd on 17/10/24.
//

import UIKit
import IQKeyboardManagerSwift
import ContactsUI
import MapKit
import MobileCoreServices
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
       // self.edgesForExtendedLayout = [.all]
        
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
        
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { [weak self] _ in
            self?.openCamera()
            print("Camera Pressed")
        }
        let photosAction = UIAlertAction(title: "Photo & Video Library", style: .default) {[weak self] _ in
            self?.openGallery()
            print("Photo Pressed")
        }
        let documentAction = UIAlertAction(title: "Document", style: .default) { [weak self] _ in
            self?.openDocument()
            print("Document Pressed")
        }
        let locationAction = UIAlertAction(title: "Location", style: .default) { [weak self] _ in
            self?.openLocation()
            print("Location Pressed")
        }
        let contactAction = UIAlertAction(title: "Contact", style: .default) { [weak self] _ in
            self?.openContact()
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
extension ChatViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func openCamera(){
        if (UIImagePickerController.availableMediaTypes(for: .camera) != nil){
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: true)
        }else{
            let alert = UIAlertController(title: "Camera", message: "Your device doesn't Support Camera", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .cancel)
            alert.addAction(okayAction)
            present(alert, animated: true)
        }
    }
    
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            present(imagePickerController, animated: true)
        }else{
            let alert = UIAlertController(title: "Photos", message: "Your Device doesn't support Gallery ", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .cancel)
            alert.addAction(okayAction)
            present(alert, animated: true)
        }
    }
    func openLocation(){
//        let latitude: CLLocationDegrees = 18.677490
//        let longitude: CLLocationDegrees = 74.116530
//        let regionDistance: CLLocationDistance = 1000
//        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        let placeMark = MKPlacemark(coordinate: coordinates)
//        let mapItem = MKMapItem(placemark: placeMark)
//        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
//        
//        let options = [
//            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
//            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
//        ]
//        mapItem.name = "Neo Soft Pune"
//        mapItem.openInMaps(launchOptions: options)
        
        let mapViewController = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
        
        self.present(mapViewController, animated: true)
        
    }
    
}

extension ChatViewController: CNContactPickerDelegate{
    func openContact(){
        let conactPicker = CNContactPickerViewController()
        conactPicker.delegate = self
        present(conactPicker, animated: true)
    }
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        print("Contact Selected \(contact.givenName),\(contact.familyName)")
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Contact picker was canceled")
    }
}

extension ChatViewController: UIDocumentPickerDelegate{
    
    func openDocument(){
        let documentTypes = ["public.item"]
        let documentPicker = UIDocumentPickerViewController(documentTypes: documentTypes, in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = true
        present(documentPicker, animated: true)
        
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedFiles = urls.first else { return}
        
        print("Selected File Url \(selectedFiles)")
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Document Picker Was Canceled")
    }
    
}

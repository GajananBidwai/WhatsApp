//
//  CameraViewController.swift
//  WhatsApp
//
//  Created by abcd on 24/10/24.
//

import UIKit

class CameraViewController: UIViewController {

    @IBOutlet weak var cameraImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func OpenCamera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            imagePickerController.sourceType = .camera
            self.present(imagePickerController, animated: true)
        }else{
            let alert = UIAlertController(title: "Camera", message: "This device does not have camera", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default)
            alert.addAction(okayAction)
            self.present(alert, animated: true)
        }
    }
    func openGallery(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .photoLibrary
            pickerController.allowsEditing = true
            self.present(pickerController, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let editingImage = info[.editedImage] as? UIImage{
//            profileImageView.image = editingImage
//            saveSelectedImageData()
//        }else if let originalImege = info[.originalImage] as? UIImage{
//            profileImageView.image = originalImege
//            saveSelectedImageData()
//        }
        dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
}

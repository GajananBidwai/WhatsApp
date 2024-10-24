//
//  StatusViewController.swift
//  WhatsApp
//
//  Created by abcd on 24/10/24.
//

import UIKit
import AVFoundation

class StatusViewController: UIViewController {
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    @IBOutlet weak var statusTableView: UITableView!{
        didSet{
            statusTableView.register(UINib(nibName: CellConstant.CellIdentifier.StatusTableViewCell, bundle: nil), forCellReuseIdentifier: CellConstant.CellIdentifier.StatusTableViewCell)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
//        setupCamera()
//        setupUI()
        
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
        
        statusTableViewCell.cameraButton.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        
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
    @objc func openCamera(){
        OpenCamera()
    }
    
}

extension StatusViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func OpenCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.allowsEditing = true
            imagePickerController.sourceType = .camera
            present(imagePickerController, animated: true) {
                self.setupCamera() // Only setup camera and UI once the camera is opened
                self.setupUI()
            }
        } else {
            let alert = UIAlertController(title: "Camera", message: "This device does not have a camera", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Okay", style: .default)
            alert.addAction(okayAction)
            self.present(alert, animated: true)
        }
    }
    
    func setupCamera() {
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = .photo
        
        guard let backCamera = AVCaptureDevice.default(for: .video) else {
            print("Unable to access back camera!")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            captureSession?.addInput(input)
            
            // Set up the preview layer
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = .resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            // Start the camera session
            captureSession?.startRunning()
        } catch {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
    }
    
    func setupUI() {
        // Create shutter button
        let shutterButton = UIButton(frame: CGRect(x: (view.frame.width - 80) / 2, y: view.frame.height - 120, width: 80, height: 80))
        shutterButton.backgroundColor = .red
        shutterButton.layer.cornerRadius = 40
        shutterButton.addTarget(self, action: #selector(capturePhoto), for: .touchUpInside)
        view.addSubview(shutterButton)
        
        // Create gallery button on the left
        let galleryButton = UIButton(frame: CGRect(x: 20, y: view.frame.height - 100, width: 50, height: 50))
        galleryButton.setImage(UIImage(systemName: "photo.on.rectangle"), for: .normal)
        galleryButton.addTarget(self, action: #selector(openGallery), for: .touchUpInside)
        view.addSubview(galleryButton)
        
        // Create camera flip button on the right
        let flipButton = UIButton(frame: CGRect(x: view.frame.width - 70, y: view.frame.height - 100, width: 50, height: 50))
        flipButton.setImage(UIImage(systemName: "arrow.triangle.2.circlepath.camera"), for: .normal)
        flipButton.addTarget(self, action: #selector(flipCamera), for: .touchUpInside)
        view.addSubview(flipButton)
        
        // Create close (cross) button on the top left
        let closeButton = UIButton(frame: CGRect(x: 20, y: 50, width: 40, height: 40))
        closeButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeCamera), for: .touchUpInside)
        view.addSubview(closeButton)
        
        // Create brightness control on the top right
        let brightnessButton = UIButton(frame: CGRect(x: view.frame.width - 60, y: 50, width: 40, height: 40))
        brightnessButton.setImage(UIImage(systemName: "sun.max"), for: .normal)
        brightnessButton.addTarget(self, action: #selector(adjustBrightness), for: .touchUpInside)
        view.addSubview(brightnessButton)
    }
    
    @objc func capturePhoto() {
        // Add functionality to capture the image here
    }
    
    @objc func flipCamera() {
        // Add functionality to flip between front and back cameras
    }
    
    @objc func openGallery() {
        openGallery1()
    }
    
    @objc func closeCamera() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func adjustBrightness() {
        // Add functionality to adjust the brightness
    }
    
    func openGallery1() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .photoLibrary
            pickerController.allowsEditing = true
            present(pickerController, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

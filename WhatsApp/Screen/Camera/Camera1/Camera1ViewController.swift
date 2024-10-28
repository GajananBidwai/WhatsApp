//
//  Camera1ViewController.swift
//  WhatsApp
//
//  Created by abcd on 25/10/24.
//

import UIKit
import AVFoundation

class Camera1ViewController: UIViewController {
    
    var session: AVCaptureSession = AVCaptureSession()
        var output = AVCapturePhotoOutput()
        var previewLayer = AVCaptureVideoPreviewLayer()
    
    
    @IBOutlet weak var cameraView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        #if targetEnvironment(simulator)
       print("Camera functionality is not available in the simulator.")
       #else
       checkCameraPosition()
       #endif
        
    }
    
    @IBAction func btnCancelAction(_ sender: Any) {
        session.stopRunning()
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clickPhotoAction(_ sender: Any) {
        guard session.isRunning == true else {
            print("Session is not running.")
            return
        }
        let photoSettings = AVCapturePhotoSettings()
        output.capturePhoto(with: photoSettings, delegate: self)
        
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            previewLayer.frame = cameraView.bounds
        }
    func checkCameraPosition(){
            switch AVCaptureDevice.authorizationStatus(for: .video){
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                    guard granted else { return }
                    DispatchQueue.main.async {
                        self?.setUpCamera()
                    }
                }
            case .restricted, .denied:
                break
            case .authorized:
                setUpCamera()
            @unknown default:
                break
            }
        }
    func setUpCamera(){
            guard let device = AVCaptureDevice.default(for: .video) else { return }
            
            do {
                let input = try AVCaptureDeviceInput(device: device)
                
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }
                
                previewLayer = AVCaptureVideoPreviewLayer(session: session)
                previewLayer.videoGravity = .resizeAspectFill
                cameraView.layer.addSublayer(previewLayer)
                
                session.startRunning()
            } catch {
                print("Error setting up camera input: \(error)")
            }
        }
}
extension Camera1ViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else { return }
        
        let image = UIImage(data: data)
        
        session.stopRunning()
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        view.addSubview(imageView)
    }
}

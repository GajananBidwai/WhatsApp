//
//  TypeAStatusViewController.swift
//  WhatsApp
//
//  Created by abcd on 08/11/24.
//

import UIKit

class TypeAStatusViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var statusTextView: UITextView!
    
    let backgroundColors: [UIColor] = [.systemRed, .systemBlue, .systemGreen, .systemOrange, .systemPurple]
    var currentColorIndex = 0
    let fontStyles: [UIFont] = [
        UIFont.systemFont(ofSize: 18, weight: .regular),
        UIFont.italicSystemFont(ofSize: 18),
        UIFont.boldSystemFont(ofSize: 18),
        UIFont(name: "Courier", size: 18) ?? UIFont.systemFont(ofSize: 18),
        UIFont(name: "Georgia", size: 18) ?? UIFont.systemFont(ofSize: 18)
    ]
    var currentFontIndex = 0
    
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Type a status"
        label.font = UIFont.systemFont(ofSize: 26)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statusTextView.delegate = self
        statusTextView.layer.cornerRadius = 8
        statusTextView.clipsToBounds = true
        statusTextView.font = fontStyles[currentFontIndex]
        UITextView.appearance().tintColor = UIColor.white
        setupPlaceholder()
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnTextFontStyle(_ sender: Any) {
        currentFontIndex = (currentFontIndex + 1) % fontStyles.count
        statusTextView.font = fontStyles[currentFontIndex]
    }
    
    @IBAction func btnBackgroundColorChange(_ sender: Any) {
        currentColorIndex = (currentColorIndex + 1) % backgroundColors.count
        let selectedColor = backgroundColors[currentColorIndex]
        
        view.backgroundColor = selectedColor
        statusTextView.backgroundColor = selectedColor
      //  statusTextView.backgroundColor = .red
    }
    
    private func setupPlaceholder() {
        statusTextView.addSubview(placeholderLabel)
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    
}

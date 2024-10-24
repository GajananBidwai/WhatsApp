//
//  AuthenticationViewController.swift
//  WhatsApp
//
//  Created by abcd on 14/10/24.
//

import UIKit
class AuthenticationViewController: UIViewController {

    var countryCodes = [[String]]()
    
    @IBOutlet weak var countryCodeTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var countryCodeBtn: UIButton!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryCodes = getAllCountryCodes()
        picker()
        countryCodeBtn.addTarget(self, action: #selector(openCountryPicker), for: .touchUpInside)
        mobileNumberTextField.delegate = self
        doneButton.isEnabled = false
    }
    @objc func openCountryPicker(){
        self.countryCodes = getAllCountryCodes()
        picker()
    }
    @IBAction func countryCodeButton(_ sender: Any) {
//        self.countryCodes = getAllCountryCodes()
//        picker()
    }
    
    
    @IBAction func doneButtonTap(_ sender: Any) {
        let whatsAppTabBarController = self.storyboard?.instantiateViewController(withIdentifier: "WhatsAppTabBarController") as! WhatsAppTabBarController
        
        navigationController?.pushViewController(whatsAppTabBarController, animated: true)
    }
    
  
    open func getAllCountryCodes() -> [[String]] {
        var countrys = [[String]]()
        let countryList = GlobalConstants.Constants.codePrefixes
        for item in countryList {
            countrys.append(item.value)
        }
        let sorted = countrys.sorted(by: {$0[0] < $1[0]})
        return sorted
    }
    
    // MARK: - Create UIPickerView
    
    open func picker(){
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        countryCodeTextField.inputView = picker
        picker.selectRow(0, inComponent: 0, animated: true)
    }
    
    

}
extension AuthenticationViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    // MARK: - UIPickerView Delegate Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCodes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let code = countryCodes[row]
        return "\(code[0]) +\(code[1])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let code = countryCodes[row]
        countryCodeTextField.text = "+\(code[1])"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        if !allowedCharacters.isSuperset(of: characterSet) {
            return false
        }
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        let isValidLength = updatedText.count <= 10
        
        doneButton.isEnabled = updatedText.count == 10
        return updatedText.count <= 10
    }

}



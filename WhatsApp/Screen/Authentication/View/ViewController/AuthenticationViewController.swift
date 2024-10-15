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
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var countryCodeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryCodes = getAllCountryCodes()
        picker()
        countryCodeBtn.addTarget(self, action: #selector(openCountryPicker), for: .touchUpInside)
        
    }
    @objc func openCountryPicker(){
        self.countryCodes = getAllCountryCodes()
        picker()
    }
    @IBAction func countryCodeButton(_ sender: Any) {
//        self.countryCodes = getAllCountryCodes()
//        picker()
    }
    
  
    func getAllCountryCodes() -> [[String]] {
        var countrys = [[String]]()
        let countryList = GlobalConstants.Constants.codePrefixes
        for item in countryList {
            countrys.append(item.value)
        }
        let sorted = countrys.sorted(by: {$0[0] < $1[0]})
        return sorted
    }
    
    // MARK: - Create UIPickerView
    
    func picker(){
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        countryCodeTextField.inputView = picker
        picker.selectRow(0, inComponent: 0, animated: true)
    }
    
    

}
extension AuthenticationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
}



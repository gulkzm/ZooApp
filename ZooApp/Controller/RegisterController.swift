//
//  RegisterController.swift
//  ZooApp
//
//  Created by Gul Kzm on 04.01.25.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet weak var fullname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var imageBg: UIImageView!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    let viewModel = RegisterViewModel()
    var registerCallback: ((User) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getData()
    }
    
    @IBAction func registerButton(_ sender: Any) {
        if let fullname = fullname.text,
           let email = email.text,
           let phonenumber = phoneNumber.text,
           let password = password.text {
            let user: User = .init(fullname: fullname, email: email, phoneNumber: phonenumber, password: password)
            
            viewModel.saveUserData(user: user)
            
            registerCallback?(user)
            
            navigationController?.popViewController(animated: true)
        }
    }
}

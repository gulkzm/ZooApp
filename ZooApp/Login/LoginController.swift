//
//  LoginController.swift
//  ZooApp
//
//  Created by Gul Kzm on 04.01.25.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageBg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func loginButton(_ sender: Any) {
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
        navigationController?.show(controller, sender: nil)
    }
}

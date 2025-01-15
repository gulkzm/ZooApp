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
    
    let viewModel = LoginViewModel()
    let fileManagerAdapter = FileManagerUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readData()

    }
    
    func readData() {
        fileManagerAdapter.readData { userData in
            self.viewModel.users = userData
        }
    }

    @IBAction func loginButton(_ sender: Any) {
        if let email = email.text,
           let password = password.text {
            
            if viewModel.users.contains(where: { $0.email == email && $0.password == password}) {

                let controller = storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                guard let window = windowScene.windows.first else { return }
                window.rootViewController = controller
                window.makeKeyAndVisible()
            } else {
                let alertController = UIAlertController(title: "Error", message: "The info you entered is not correct", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default)
                alertController.addAction(action)
                present(alertController, animated: true)
            }
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
        controller.registerCallback = { user in
            self.email.text = user.email
            self.password.text = user.password
            self.self.readData()
        }
        navigationController?.show(controller, sender: nil)
    }
}

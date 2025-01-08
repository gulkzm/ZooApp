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
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let window = windowScene.windows.first else { return }
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
    
}

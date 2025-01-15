//
//  OnboardingController.swift
//  ZooApp
//
//  Created by Gul Kzm on 04.01.25.
//

import UIKit

class OnboardingController: UIViewController {
let manager = UserDefaultsManager()
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageBg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButton(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "start")
        UserDefaults.standard.setValue(true, forKey: "isOnboarded")
     
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.loginRoot()
                
                manager.setValue(value: true, key: .onboarded)
                manager.setValue(value: true, key: .start)
            }
        }
//        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
//        navigationController?.show(controller, sender: nil)
    } 
}

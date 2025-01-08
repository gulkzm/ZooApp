//
//  OnboardingController.swift
//  ZooApp
//
//  Created by Gul Kzm on 04.01.25.
//

import UIKit

class OnboardingController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageBg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

  
    @IBAction func startButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
    
    
}

//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Александр Шепель on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var greetingsLabel: UILabel!
    
    var user: UserData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greetingsLabel.text = "Welcome, \(user.person.fullName)!"

        
        let color1 = UIColor(red: 89 / 255, green: 153 / 255, blue: 141 / 255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 155 / 255, green: 243 / 255, blue: 99 / 255, alpha: 1.0).cgColor
        let color3 = UIColor(red: 73 / 255, green: 184 / 255, blue: 121 / 255, alpha: 1.0).cgColor
        
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = self.view.bounds
        gradientBackground.colors = [color1, color2, color3]
        gradientBackground.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientBackground.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientBackground, at: 0)
    }
}

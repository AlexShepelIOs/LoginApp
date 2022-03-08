//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Александр Шепель on 08.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var greetingsLabel: UILabel!
    
    var greetings: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingsLabel.text = "Welcome,\(greetings ?? "")!"
    }
    
    @IBAction func logOutActionButton() {
        dismiss(animated: true)
    }
}

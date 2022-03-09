//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Александр Шепель on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    @IBAction func logInButtonTapped() {
        guard userNameTextField.text == "Admin" && passwordTextField.text == "Admin" else {
            showAlert(
                title: "Invalid Login or Password",
                message: "Please, enter correct login and password"
            )
            passwordTextField.text = ""
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.greetings = userNameTextField.text
    }
    
    @IBAction func forgotNameButtonTapped() {
        showAlert(title: "Oops!", message: "Your name is \"Admin\"!")
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(title: "Oops!", message: "Your password is \"Admin\"!")
    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else { return }
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


//
//  LoginViewController.swift
//  LoginApp2
//
//  Created by Александр Шепель on 08.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let user = UserData.getUserData()

    
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
        view.layer.insertSublayer(gradientBackground, at: 0)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                guard let userInfoVC = navigationVC.topViewController as? UserInfoViewController else { return }
                userInfoVC.user = user
            }
        }
    }
    
    
    @IBAction func logInButtonTapped() {
        guard userNameTextField.text == user.login && passwordTextField.text == user.password else {
            showAlert(
                title: "Invalid Login or Password",
                message: "Please, enter correct login and password"
            )
            return
        }
        performSegue(withIdentifier: "openWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotNameButtonTapped() {
        showAlert(title: "Oops!", message: "Your name is \"\(user.login)\"!")
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(title: "Oops!", message: "Your password is \"\(user.password)\"!")
    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonTapped()
        }
        return true
    }
}

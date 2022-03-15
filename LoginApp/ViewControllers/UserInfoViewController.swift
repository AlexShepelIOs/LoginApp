//
//  UserInfoViewController.swift
//  LoginApp2
//
//  Created by Александр Шепель on 15.03.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: UserData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.user = user
    }
}

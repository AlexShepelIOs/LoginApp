//
//  ImageViewController.swift
//  LoginApp2
//
//  Created by Александр Шепель on 15.03.2022.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = imageView.frame.height / 2
        }
    }
    
    var user: UserData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: user.person.image)
    }
}

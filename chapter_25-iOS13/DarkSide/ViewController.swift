//
//  ViewController.swift
//  DarkSide

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginCardView: UIView! {
        didSet {
            loginCardView.layer.cornerRadius = 10
            loginCardView.layer.shadowColor = UIColor.black.cgColor
            loginCardView.layer.shadowRadius = 5
            loginCardView.layer.shadowOpacity = 0.3
            loginCardView.layer.shadowOffset = CGSize(width: 0, height: 3)
        }
    }
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 20
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func toggleDarkMode(_ sender: UISwitch) {
        overrideUserInterfaceStyle = sender.isOn ? .dark : .light
    }
}


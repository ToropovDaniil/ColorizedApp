//
//  MainViewController.swift
//  SliderView
//
//  Created by Торопов Даниил  on 18.10.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        
        settingsVC.delegate = self
        settingsVC.viewColor = view.backgroundColor
    }
}

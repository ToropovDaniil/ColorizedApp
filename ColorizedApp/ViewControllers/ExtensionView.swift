//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Елена Ажимова  on 20.10.2023.
//

import UIKit

extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}

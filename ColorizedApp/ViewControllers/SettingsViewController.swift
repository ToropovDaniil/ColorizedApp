//
//  ViewController.swift
//  SliderView
//
//  Created by Торопов Даниил  on 29.09.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setNewColor(_ color: UIColor)
}

final class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var valueRedLabel: UILabel!
    @IBOutlet weak var valueGreenLabel: UILabel!
    @IBOutlet weak var valueBlueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var delegate: SettingsViewControllerDelegate!
    var viewColor: UIColor!

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSliders()
        setupValueOfLabels()
        
        colorView.backgroundColor = viewColor
        colorView.layer.cornerRadius = 10
    }
    
    // MARK: - IB Actions
    @IBAction func sliderAction(_ sender: UISlider) {
        setupColorView()
        switch sender.tag {
        case 0:
            getFormatLabel(valueRedLabel, redSlider)
        case 1:
            getFormatLabel(valueGreenLabel, greenSlider)
        case 2:
            getFormatLabel(valueBlueLabel, blueSlider)
        default:
            break
        }
    }

    @IBAction func pressDoneButton() {
        delegate.setNewColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setupValueOfLabels() {
        
        getFormatLabel(valueRedLabel, redSlider)
        getFormatLabel(valueGreenLabel, greenSlider)
        getFormatLabel(valueBlueLabel, blueSlider)
    }
    
    private func setupSliders() {
        
        let ciColor = CIColor(color: viewColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func getFormatLabel(_ valueLabel: UILabel, _ slider: UISlider) {
        valueLabel.text = String(format: "%.2f", slider.value)
    }
    
    private func setupColorView() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
}

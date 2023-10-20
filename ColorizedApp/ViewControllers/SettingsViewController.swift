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
        setupColorView()
        setupValueOfLabels()
        
        colorView.backgroundColor = viewColor
        colorView.layer.cornerRadius = 10
    }
    
    // MARK: - IB Actions
    @IBAction func sliderAction(_ sender: UISlider) {
        setupColorView()
        if sender.tag == 0 {
            getFormatLabel(valueRedLabel, redSlider)
        } else if sender.tag == 1 {
            getFormatLabel(valueGreenLabel, greenSlider)
        } else if sender.tag == 2 {
            getFormatLabel(valueBlueLabel, blueSlider)
        }
    }

    @IBAction func pressDoneButton() {
        delegate.setNewColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setupValueOfLabels() {
        valueRedLabel.text = redSlider.value.formatted()
        getFormatLabel(valueRedLabel, redSlider)
        
        valueGreenLabel.text = greenSlider.value.formatted()
        getFormatLabel(valueGreenLabel, greenSlider)
        
        valueBlueLabel.text = blueSlider.value.formatted()
        getFormatLabel(valueBlueLabel, blueSlider)
    }
    
    private func setupSliders() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        viewColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
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

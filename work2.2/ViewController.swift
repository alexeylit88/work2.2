//
//  ViewController.swift
//  work2.2
//
//  Created by ALEXEY LITVINOV on 31.10.2024.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLight.alpha = lightIsOff
        yellowLight.alpha = lightIsOff
        greenLight.alpha = lightIsOff
        
        redLight.layer.cornerRadius = redLight.frame.width / 2
        yellowLight.layer.cornerRadius = yellowLight.frame.width / 2
        greenLight.layer.cornerRadius = greenLight.frame.width / 2
        
        startButton.layer.cornerRadius = 10
    }

    @IBAction func startButtonPressed() {
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLight.alpha = lightIsOff
            redLight.alpha = lightIsOn
            currentLight = CurrentLight.yellow
        case .yellow:
            redLight.alpha = lightIsOff
            yellowLight.alpha = lightIsOn
            currentLight = CurrentLight.green
        case .green:
            yellowLight.alpha = lightIsOff
            greenLight.alpha = lightIsOn
            currentLight = CurrentLight.red
        }
    }
    
}

extension ViewController {
    private enum CurrentLight {
        case red, yellow, green
    }
}

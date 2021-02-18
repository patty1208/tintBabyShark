//
//  ViewController.swift
//  tintBabyShark
//
//  Created by 林佩柔 on 2021/2/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var babySharkImageView: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var gradientSwitch: UISwitch!
    
    let gradientLayer = CAGradientLayer()
    let originalRed: Float = 240
    let originalGreen: Float = 173
    let originalBlue: Float = 161
    let originalAlpha: Float = 0.8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 初始值
        redSlider.value = originalRed
        greenSlider.value = originalGreen
        blueSlider.value = originalBlue
        alphaSlider.value = originalAlpha
        gradientSwitch.isOn = false
        
        // 漸層圖層初始設定
        gradientLayer.frame = babySharkImageView.frame
        gradientLayer.colors = [UIColor.white.cgColor,UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value)).cgColor]
        gradientLayer.startPoint = CGPoint(x: -0.1, y: -0.1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.addSublayer(gradientLayer)
        view.addSubview(babySharkImageView)
        gradientLayer.isHidden = true
    }
    
    func colorLabelText(redValue: Float, greenValue: Float, blueValue: Float, alphaValue: Float){
        redLabel.text = String(format: "%.0f", redValue)
        greenLabel.text = String(format: "%.0f", greenValue)
        blueLabel.text = String(format: "%.0f", blueValue)
        alphaLabel.text = String(format: "%.1f", alphaValue)
        
    }
    
    @IBAction func gradientSwitchControl(_ sender: UISwitch) {

        gradientLayer.colors = [UIColor.white.cgColor,UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value)).cgColor]
        
        if gradientSwitch.isOn == true {
            gradientLayer.isHidden = false
            babySharkImageView.backgroundColor = UIColor.clear
        } else {
            babySharkImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value))
            gradientLayer.isHidden = true
        }
    }
    
    @IBAction func colorSliderChage(_ sender: UISlider) {
        
        colorLabelText(redValue: redSlider.value, greenValue: greenSlider.value, blueValue: blueSlider.value, alphaValue: alphaSlider.value)
        
        if gradientSwitch.isOn == false {
            babySharkImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value))
            gradientLayer.isHidden = true
        } else {
            gradientLayer.colors = [UIColor.white.cgColor,UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value)).cgColor]
            babySharkImageView.backgroundColor = UIColor.clear
            gradientLayer.isHidden = false
            
        }
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        babySharkImageView.backgroundColor = UIColor(red: 240/255, green: 173/255, blue: 161/255, alpha: 0.8)
        redSlider.value = originalRed
        greenSlider.value = originalGreen
        blueSlider.value = originalBlue
        alphaSlider.value = originalAlpha
        
        colorLabelText(redValue: redSlider.value, greenValue: greenSlider.value, blueValue: blueSlider.value, alphaValue: alphaSlider.value)
        
        gradientSwitch.isOn = false
        gradientLayer.isHidden = true
        
    }
    
    @IBAction func randomButtomPressed(_ sender: UIButton) {
        
        redSlider.value = Float.random(in: 0...255)
        greenSlider.value = Float.random(in: 0...255)
        blueSlider.value = Float.random(in: 0...255)
        alphaSlider.value = Float.random(in: 0...1)
        
        colorLabelText(redValue: redSlider.value, greenValue: greenSlider.value, blueValue: blueSlider.value, alphaValue: alphaSlider.value)
        
        if gradientSwitch.isOn == false {
            babySharkImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value))
            gradientLayer.isHidden = true
        } else {
            gradientLayer.colors = [UIColor.white.cgColor,UIColor(red: CGFloat(redSlider.value/255), green: CGFloat(greenSlider.value/255), blue: CGFloat(blueSlider.value/255), alpha: CGFloat(alphaSlider.value)).cgColor]
            babySharkImageView.backgroundColor = UIColor.clear
            gradientLayer.isHidden = false
        }
    }
    

}


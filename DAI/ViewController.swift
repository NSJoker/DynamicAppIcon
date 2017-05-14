//
//  ViewController.swift
//  DAI
//
//  Created by Chandrachudh on 14/05/17.
//  Copyright © 2017 NSJoker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var backgroundTask: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = UIButton.init(frame: CGRect(x: view.bounds.width/2 - 80, y: view.bounds.height/2 - 20, width: 160, height: 40))
        button.layer.cornerRadius = 4.0
        button.layer.borderColor = colorFromRGBA(fromHex: 0xe74c3c, alpha: 1.0).cgColor
        button.layer.borderWidth = 1.0
        button.setTitle("Change App Icon", for: .normal)
        button.setTitleColor(colorFromRGBA(fromHex: 0xe74c3c, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(changeAppIcon), for: .touchUpInside)
        
        if UIApplication.shared.supportsAlternateIcons {
            view.addSubview(button)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func colorFromRGBA(fromHex: Int, alpha: CGFloat) -> UIColor {
        let red =   CGFloat((fromHex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((fromHex & 0x00FF00) >> 8) / 0xFF
        let blue =  CGFloat(fromHex & 0x0000FF) / 0xFF
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    func changeAppIcon() {
        
        let appIcons = ["AppIcon-2", "AppIcon-3", "AppIcon-4", "AppIcon-5", "AppIcon-6", "AppIcon-7", "AppIcon-8", nil]
        
        let randomNumber = arc4random_uniform(9)
        
        let selectedIcon = appIcons[Int(randomNumber) % 9]
        
        if UIApplication.shared.alternateIconName != selectedIcon {
            UIApplication.shared.setAlternateIconName(selectedIcon) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Success! icon changed")
                }
            }
        }
        else {
            changeAppIcon()
        }
    }
}


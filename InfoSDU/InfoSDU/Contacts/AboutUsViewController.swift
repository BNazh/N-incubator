//
//  AboutUsViewController.swift
//  InfoSDU
//
//  Created by Babakhanov Nazhmeddin on 24.02.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import Cartography
import GoogleMaps

class AboutUsViewController: UIViewController {
    
    lazy var image: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "map"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var callButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "call"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(AboutUsViewController.callToSDU), for: .touchUpInside)
        return button
    }()
    
    lazy var textArea: UITextView = {
        let text = UITextView()
        text.text = " ул. Абылай хана 1/1 \n\n ☼ Алматинская обл., Карасайский р-н \n\n ☼ г. Каскелен,040900, Казахстан \n\n ☼ Тел: +7 727 307 95 60/65 (220, 231, 455) \n\n ☼ Моб: + 7 702 000 11 33 (whatsapp) \n\n ☼ Факс: +7 727 307 95 58 \n\n ☼ e-mail: info@sdu.edu.kz"
        text.isEditable = false
        text.font = UIFont.boldSystemFont(ofSize: 17)
        text.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
        text.textColor = .white
        
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 47/255, blue: 62/255, alpha: 1)
        
        view.addSubViews([image, textArea, callButton])
        
        addConstraints()
        
//        GMSServices.provideAPIKey("AIzaSyCUatkD1LY9SUBoG0LU8_4Ig7Sjqv28rXg")
//
//        let camera = GMSCameraPosition.camera(withLatitude: 43.208423, longitude: 76.669502, zoom: 10)
//
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//
//        view.addSubview(mapView)
//
//        constrain(view, mapView){ v1, v2 in
//            v2.width == v1.width
//            v2.height == v1.height * 0.5
//            v2.top == v1.top
//            v2.centerX == v1.centerX
//        }
        
        UIView.animate(withDuration: 0.4, delay: 3, options: [.repeat, .autoreverse], animations: {
            let animation = CAKeyframeAnimation()
            animation.keyPath = "position.x"
            
            animation.values = [0, 10, -10, 10, -5, 5, -5, 0 ]
            
            animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
            animation.duration = 0.4
            
            animation.isAdditive = true
            self.callButton.layer.add(animation, forKey: "shake")
        }, completion: nil)
    }
    
    func addConstraints() {
        
        constrain(view, image){ v1, v2 in
            v2.width == v1.width
            v2.height == v1.height*0.5
            v2.top == v1.top
        }
        
        constrain(image, textArea){ v1, v2 in
            v2.width == v1.width
            v2.height == v1.height*0.7
            v2.top == v1.bottom + 20
            v2.left == v1.left + 20
        }
        
        constrain(view, callButton){ v1, v2 in
            v2.width == v1.width/6
            v2.height == v1.width/6
            v2.bottom == v1.bottom - 40
            v2.right == v1.right - 40
        }
    }
    
    @objc func callToSDU() {
        func callForHelp(_ number: String) {
            let url = URL(string: "tel://\(87020001133)")!
            if UIApplication.shared.canOpenURL(url) {
//                UIApplication.shared.openURL(url)
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

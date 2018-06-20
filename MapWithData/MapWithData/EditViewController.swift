//
//  EditViewController.swift
//  MapWithData
//
//  Created by Nazhmeddin Babakhan on 14.03.2018.
//  Copyright © 2018 Nolan. All rights reserved.
//

import UIKit
import MapKit
import Cartography

class EditViewController: UIViewController {
    
    public var delegate: SelectedPlace?
    public var place: Places?
    
    lazy var titleLabel: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .cyan
        return textField
    }()
    
    lazy var subTitleLabel: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .cyan
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Edit"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(acceptChanging))
        titleLabel.text = delegate?.editableAnnotation.title
        subTitleLabel.text = delegate?.editableAnnotation.subtitle
        
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        
        addConstraints()
    }
    
    private func addConstraints() {
        
        constrain(view, titleLabel, subTitleLabel) { v1, v2, v3 in
            v2.centerX == v1.centerX
            v2.centerY == v1.centerY / 2
            v2.width == v1.width * 0.5
            v2.height == 30
            
            v3.top == v2.bottom + 20
            v3.centerX == v2.centerX
            v3.width == v2.width
            v3.height == v2.height
        }
        
        titleLabel.layer.cornerRadius = 7
        titleLabel.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        subTitleLabel.layer.cornerRadius = 7
        subTitleLabel.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
    }
    
    @objc private func acceptChanging() {
        delegate?.editableAnnotation.title = titleLabel.text
        delegate?.editableAnnotation.subtitle = subTitleLabel.text
        delegate?.editablePlace.title = titleLabel.text!
        delegate?.editablePlace.subtitle = subTitleLabel.text!
        navigationController?.popViewController(animated: true)
    }
    
}

//
//  CustomButton.swift
//  MVVM-C
//
//  Created by Massimiliano on 08/05/21.
//

import UIKit

class CustomButton: UIButton {
    private var shadowLayer: CAShapeLayer!
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled == false {
                self.setTitleColor(.gray, for: .disabled)
            }
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 33).cgPath
            
            if self.backgroundColor != nil {
                shadowLayer.fillColor = self.backgroundColor?.cgColor
            }
            else{
                shadowLayer.fillColor = UIColor.white.cgColor
            }
            
            shadowLayer.shadowColor = UIColor.gray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            shadowLayer.shadowOpacity = 0.4
            shadowLayer.shadowRadius = 2

            layer.insertSublayer(shadowLayer, at: 0)

        }

    }
    

}

//
//  UITextFieldExtension.swift
//  TestTechnique
//
//  Created by Mohamed Sadok  Krichen on 19/3/2022.
//

import UIKit

extension UITextField {
    func withImageOnTheLeft(image: String){
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 48))

        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 48))
        view.backgroundColor = .clear
        view.clipsToBounds = true
        mainView.addSubview(view)

        let imageView = UIImageView(image: UIImage(named: image))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 15, y: 15, width: 18, height: 18)
        view.addSubview(imageView)

        self.leftViewMode = .always
        self.leftView = mainView
        
    }
}

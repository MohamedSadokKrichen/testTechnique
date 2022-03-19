//
//  UIViewControllerExtension.swift
//  TestTechnique
//
//  Created by Mohamed Sadok  Krichen on 18/3/2022.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    func showHud() {
        self.hideHUD()
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = MBProgressHUDMode.indeterminate
        hud.backgroundView.style = .solidColor
        hud.show(animated: true)
    }
    
    func hideHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    func showError(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

//
//  UIViewController+Ext.swift
//  Note-App
//
//  Created by Mateusz Zacharski on 27/12/2020.
//

import UIKit

extension UIViewController {
    func presentAlertOnMainThread() {
        DispatchQueue.main.async { [weak self] in
            let ac = UIAlertController(title: "Oops!", message: "The data couldn't be fetched. Are you sure the server is running?", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(ac, animated: true)
        }
    }
}

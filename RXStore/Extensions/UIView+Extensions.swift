//
//  UIView+Extensions.swift
//  MapKitLaba
//
//  Created by Мельник Дмитрий on 26.09.2022.
//

import UIKit


extension UIView {
    
    func addSubviewWithTAMIC(_ view: UIView) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func pinTo(_ view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
    }
    
    func theRightDistanceFromTheTop() -> CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let isIPhoneWithBangs: Bool = { return UIScreen.main.bounds.height >= 812 }()
        let heightStatusBar = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let iphoneMiniSize = CGRect(x: 0, y: 0, width: 375, height: 812)

        if isIPhoneWithBangs && iphoneMiniSize != UIScreen.main.bounds && iphoneMiniSize != UIScreen.main.bounds {
            return heightStatusBar / 1.068
        } else if !isIPhoneWithBangs && iphoneMiniSize == UIScreen.main.bounds {
            return heightStatusBar / 1.136
        } else {
            return heightStatusBar
        }
    }

    func removeAllSubviews() {
        self.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    class var nibName: String {
        return String(describing: self)
    }

    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self),
                                        owner: nil,
                                        options: nil)?
            .first as! T // swiftlint:disable:this force_cast
    }

    func connectNibUI() -> Any? {
        let nibView = Bundle.main.loadNibNamed(String(describing: type(of: self)),
                                               owner: nil,
                                               options: nil)?
            .first as! UIView // swiftlint:disable:this force_cast
        nibView.frame = frame
        self.addSubview(nibView)
        return nibView
    }
}

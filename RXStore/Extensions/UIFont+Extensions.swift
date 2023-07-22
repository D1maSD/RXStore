//
//  UIFont+Extensions.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 21.07.2023.
//

import UIKit

extension UIFont {
    
    static func avenir20() -> UIFont? {
        let font = UIFont(name: "avenir", size: 20)
        return font
    }
    
    static func avenir26() -> UIFont? {
        let font = UIFont(name: "avenir", size: 26)
        return font
    }

    static var titleFont: UIFont {
        return .systemFont(ofSize: 20, weight: .medium)
    }
    
    static var text16ThinFont: UIFont {
        return .systemFont(ofSize: 16, weight: .thin)
    }
    
    
    
    static var text18SemiboldFont: UIFont {
        return .systemFont(ofSize: 18, weight: .semibold)
    }
    
    static var logoTitleFont: UIFont {
        return .systemFont(ofSize: 40, weight: .black)
    }
    
    static var systemFont35Heavy: UIFont {
        return .systemFont(ofSize: 35, weight: .heavy)
    }
    
    static var logoSubtitleFont: UIFont {
        return .systemFont(ofSize: 20, weight: .regular)
    }
    
    static var onboardingTextFont: UIFont {
        return .text16ThinFont.withSize(16)
    }
    

    static var placehodlerFont: UIFont {
        return .logoSubtitleFont.withSize(16)
    }
    
    
    //MARK: systemFont20
    static var systemFont20Semibold: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 20, weight: .semibold)
    }
    
    static var systemFont20Regular: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 20, weight: .regular)
    }
    
    static var systemFont20Medium: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 20, weight: .medium)
    }
    
    static var systemFont20Light: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 20, weight: .light)
    }
    
    static var systemFont20Bold: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 20, weight: .bold)
    }
    
    static var systemFont20Heavy: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 20, weight: .heavy)
    }

    static var subtitleBaseCellFont: UIFont {
        return UIFont(name: "SFCompact-Thin", size: 15) ?? .systemFont(ofSize: 15, weight: .thin)
    }

    static var  subtitleBaseDescriptionFont: UIFont {
        return UIFont(name: "SFCompact-Regular", size: 14) ?? .systemFont(ofSize: 15, weight: .regular)
    }
    
    
    
    //MARK: systemFont25
    static var systemFont25Semibold: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 25, weight: .semibold)
    }
    
    static var systemFont25Regular: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 25, weight: .regular)
    }
    
    static var systemFont25Medium: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 25, weight: .medium)
    }
    
    static var systemFont25Light: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 25, weight: .light)
    }
    
    static var systemFont25Bold: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 25, weight: .bold)
    }
    
    static var systemFont25Heavy: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 25, weight: .heavy)
    }
    
    static var systemFont14Regular: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 14) ?? .systemFont(ofSize: 14, weight: .regular)
    }

    static var systemFont32Black: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 32, weight: .black)
    }
    
    static var systemFont14Semibold: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 14) ?? .systemFont(ofSize: 14, weight: .semibold)
    }
    
    static var systemFont14Medium: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 14) ?? .systemFont(ofSize: 14, weight: .medium)
    }
    
    static var systemFont16Medium: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 16) ?? .systemFont(ofSize: 16, weight: .medium)
    }
    
    
    static var systemFont15Bold: UIFont {
        return UIFont(name: "SFCompact-Medium", size: 20) ?? .systemFont(ofSize: 15, weight: .bold)
    }

    
    //MARK: systemFont40
    static var sf32Font: UIFont {
        return .systemFont(ofSize: 40, weight: .bold)
    }
}

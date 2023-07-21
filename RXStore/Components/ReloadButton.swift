//
//  ReloadButton.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 20.07.2023.
//

import UIKit

final class ReloadButton: UIButton {

    private let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")

    private var rotating = true

    init() {
        super.init(frame: .zero)
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func configure() {
        setImage(UIImage(named: "reloadBlack"), for: .normal)
    }

    func startLoadingAnimation() {
        rotating = true
        rotationAnimation.delegate = self
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi * 2
        rotationAnimation.duration = 1
        rotationAnimation.repeatCount = 1
        layer.add(rotationAnimation, forKey: nil)
    }

    func stopLoadingAnimation() {
        rotating = false
    }
}

extension ReloadButton: CAAnimationDelegate {
    func animationDidStart(_ anim: CAAnimation) {
        isEnabled = false
    }

    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if rotating {
            layer.removeAllAnimations()
            startLoadingAnimation()
        } else {
            isEnabled = true
            layer.removeAllAnimations()
        }
    }
}


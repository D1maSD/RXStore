//
//  CustomButtonState.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 28.07.2023.
//

import UIKit

enum CustomButtonState {
    case applyFilter

    var title: String {
            switch self {
            case .applyFilter:
                return "Применить фильтр"
            }
        }

    var textColor: UIColor {
        switch self {
        default:
            return .white
        }
    }

    var backgroudColor: UIColor {
        switch self {
        default:
            return .yellow
        }
    }

    var borderColor: CGColor {
        switch self {
        default:
            return UIColor.clear.cgColor
        }
    }

    var borderWidth: CGFloat {
        switch self {
        default:
            return 0
        }
    }
}

final class CustomRoundedButton: UIButton {
    private var type: CustomButtonState = .applyFilter
    private var isActive: Bool = false

    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func configure(type: CustomButtonState) {
        self.type = type
        setTitle(type.title, for: .normal)
        layer.cornerRadius = 25
        backgroundColor = type.backgroudColor
        layer.borderColor = type.borderColor
        layer.borderWidth = type.borderWidth
        titleLabel?.font = .systemFont14Semibold
        updateState(isActive: isActive)
        self.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }

    @objc private func tap() {
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveEaseIn) {
            self.alpha = 0.7
        } completion: { _ in
            self.alpha = 1
        }
    }

    func updateState(isActive: Bool) {
        self.isActive = isActive
        isEnabled = true
        switch type {
        default:
            backgroundColor = isActive ? .yellow : .lightGray
        }
    }
}


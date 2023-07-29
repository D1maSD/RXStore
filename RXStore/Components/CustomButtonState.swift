//
//  CustomButtonState.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 28.07.2023.
//

import UIKit

enum CustomButtonState {
    case getCodeFromSms
    case registration
    case confirm
    case next
    case completeRegistration
    case toBegin
    case enterAnotherCode
    case contactUs
    case send
    case okButton
    case createEvent
    case writeToTheOrganizer
    case reloadButton
    case changeSearchCriteria
    case applyFilter
    case publish
    case save
    case yesDelete
    case yes
    case cancellation

    var title: String {
            switch self {
            case .getCodeFromSms:
                return "L10n.Authorization.getCodeBySMS"
            case .registration:
                return "L10n.Authorization.registration"
            case .confirm:
                return "L10n.confirm"
            case .next:
                return "L10n.next"
            case .completeRegistration:
                return "L10n.Onboarding.completeRegistration"
            case .toBegin:
                return "L10n.Onboarding.Alert.toBegin"
            case .enterAnotherCode:
                return "L10n.Onboarding.Alert.enterAnotherCode"
            case .contactUs:
                return "L10n.Main.ContactUsAlert.contactUs"
            case .send:
                return "L10n.send"
            case .okButton:
                return "L10n.ok"
            case .createEvent:
                return "L10n.Plug.createEventButton"
            case .writeToTheOrganizer:
                return "L10n.Event.writeToTheOrganizer"
            case .reloadButton:
                return "L10n.Plug.reloadButton"
            case .changeSearchCriteria:
                return "L10n.Plug.changeSearchCriteriaButton"
            case .applyFilter:
                return "L10n.Filter.applyFilter"
            case .publish:
                return "L10n.Event.createEventButton"
            case .save:
                return "L10n.EditEvent.save"
            case .yesDelete:
                return "L10n.EditEvent.Alert.yesDelete"
            case .yes:
                return "L10n.yes"
            case .cancellation:
                return "L10n.сancellation"
            }
        }

    var textColor: UIColor {
        switch self {
        case .registration:
            return .yellow
        default:
            return .white
        }
    }

    var backgroudColor: UIColor {
        switch self {
        case .registration:
            return .clear
        case .writeToTheOrganizer:
            return .black
        default:
            return .yellow
        }
    }

    var borderColor: CGColor {
        switch self {
        case .registration:
            return UIColor.yellow.cgColor
        default:
            return UIColor.clear.cgColor
        }
    }

    var borderWidth: CGFloat {
        switch self {
        case .registration:
            return 1
        default:
            return 0
        }
    }
}

final class CustomRoundedButton: UIButton {
    private var type: CustomButtonState = .confirm
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
        case .registration:
            backgroundColor = .clear
            layer.borderColor = type.borderColor
            layer.borderWidth = type.borderWidth
            setTitleColor(type.textColor, for: .normal)
        case .writeToTheOrganizer,
                .contactUs:
            backgroundColor = .black
        default:
            backgroundColor = isActive ? .yellow : .lightGray
        }
    }
}


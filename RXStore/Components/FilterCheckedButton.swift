//
//  FilterCheckedButton.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 27.07.2023.
//

import UIKit

enum FilterCheckedButtonType: CaseIterable {

    case jeans
    case tshorts
    case third
    case four
    case five

    var title: String {
        switch self {
        case .jeans:
            return "Джинсы"
        case .tshorts:
            return "Футболки"
        case .third:
            return "Платье"
        case .four:
            return "Красный"
        case .five:
            return "Зеленый"
        }
    }
}

protocol FilterCheckedButtonDelegate: AnyObject {
    func checkedButtonTap(checked: Bool)
}

final class FilterCheckedButton: UIButton {

    weak var delegate: FilterCheckedButtonDelegate?
    private(set) var checked = false
    private var type: FilterCheckedButtonType = .four

    init(delegate: FilterCheckedButtonDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    func updateState(isChecked: Bool) {
        checked = isChecked
        switch checked {
        case true:
            backgroundColor = .lightGray
            setTitleColor(.black, for: .normal)
            layer.borderWidth = 0
        case false:
            backgroundColor = .clear
            setTitleColor(.lightGray, for: .normal)
            layer.borderWidth = 1
            layer.borderColor = UIColor.lightGray.cgColor
        }
        delegate?.checkedButtonTap(checked: checked)
    }

    func configure(type: FilterCheckedButtonType) {
        self.type = type
        setTitle(type.title, for: .normal)
        titleLabel?.font = .systemFont15Bold
        layer.cornerRadius = 22
        setTitleColor(.lightGray, for: .normal)
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        self.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }

    @objc private func tap() {
        updateState(isChecked: !checked)
    }
}

extension FilterCheckedButtonType {
    
    init?(category: CategoriesType) {
        switch category {
        case .first:
            self = .jeans
        case .second:
            self = .tshorts
        case .third:
            self = .third
        case .four:
            self = .four
        case .five:
            self = .five
        }
    }

    public enum CategoriesType: String {
        case first = "jeans"
        case second = "T-shirt"
        case third = "Gu4T2fxnPDUoyM1JT4nd"
        case four = "4"
        case five = "5"
    }
    
    func toCategoriesType() -> CategoriesType? {
        switch self {
        case .jeans:
            return .first
        case .tshorts:
            return .second
        case .third:
            return .third
        case .four:
            return .four
        case .five:
            return .five
        default:
            return nil
        }
    }
}

extension Filters {
    func isEmpty() -> Bool {
        return true
    }

    mutating func clear() {
    }
}


public struct Filters: Equatable {
    public static func == (lhs: Filters, rhs: Filters) -> Bool {
        return true
    }
   

    public init(city: String, country: String, showAllCities: Bool) {
    }
}

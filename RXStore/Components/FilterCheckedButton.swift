//
//  FilterCheckedButton.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 27.07.2023.
//

import UIKit

enum FilterCheckedButtonType: CaseIterable {

    case first
    case second
    case third
    case four
    case five


    var title: String {
        switch self {
        case .first:
            return "Синий"
        case .second:
            return "Голубой"
        case .third:
            return "Темно-синий"
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
            setTitleColor(.yellow, for: .normal)
            layer.borderWidth = 1
            layer.borderColor = UIColor.yellow.cgColor
        }
        delegate?.checkedButtonTap(checked: checked)
    }

    func configure(type: FilterCheckedButtonType) {
        self.type = type
        setTitle(type.title, for: .normal)
        titleLabel?.font = .systemFont15Bold
        layer.cornerRadius = 22
        setTitleColor(.yellow, for: .normal)
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.yellow.cgColor
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
            self = .first
        case .second:
            self = .second
        case .third:
            self = .third
        case .four:
            self = .four
        case .five:
            self = .five
        }
    }

    public enum CategoriesType: Int {
        case first = 1
        case second = 2
        case third = 3
        case four = 4
        case five = 5
    }
    
    func toCategoriesType() -> CategoriesType? {
        switch self {
        case .first:
            return .first
        case .second:
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
//        guard let category = category else { return true }
//        return category.isEmpty
        return true
    }

    mutating func clear() {
//        category = []
    }
}


public struct Filters: Equatable {
    public static func == (lhs: Filters, rhs: Filters) -> Bool {
        return true
    }
    
//    var category: [CategoriesType] = [CategoriesType]()

   

    public init(city: String, country: String, showAllCities: Bool) {
//        self.city = city
//        self.country = country
//        self.showAllCities = showAllCities
    }
}

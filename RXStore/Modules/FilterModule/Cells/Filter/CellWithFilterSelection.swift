//
//  FilterCell.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 27.07.2023.
//

import UIKit

enum CellWithFilterSelectionType {
    case category

    var titleText: String {
        switch self {
        case .category:
            return "Категория"
        }
    }

    var buttonTypes: [FilterCheckedButtonType] {
        switch self {
        case .category:
            return [.tshorts, .third, .jackets, .blouse, .jeans]
        }
    }
}

protocol CellWithFilterSelectionDelegate: AnyObject {
    func filterButtonTapped(filterSection: CellWithFilterSelectionType, filterType: FilterCheckedButtonType, active: Bool)
}

final class CellWithFilterSelection: UITableViewCell {

    weak var delegate: CellWithFilterSelectionDelegate?

    private var cellSizes: [CGSize] = []
    private var configurators: [FilterChooseCellConfigurator] = []
    private var type: CellWithFilterSelectionType?

    private let collectionView = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont14Semibold
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        configureCollectionView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(
        type: CellWithFilterSelectionType,
        buttonsToActivate: [FilterCheckedButtonType]
    ) {
        self.type = type
        titleLabel.text = type.titleText
        selectionStyle = .none
        let configurators = type.buttonTypes.map { FilterChooseCellConfigurator(buttonType: $0) }
        let strings = type.buttonTypes.map { $0.title }
        setupFilterChooseCellsSize(categorysNames: strings)
        self.configurators = configurators
        buttonsToActivate.forEach { item in
            activateFilterButtons(type: item)
        }
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        collectionView.neededSize = { [ weak self] neededSize in
            self?.collectionView.snp.updateConstraints { update in
                update.height.equalTo(162)
            }
        }
        layoutIfNeeded()
    }

    private func activateFilterButtons(type: FilterCheckedButtonType) {
        configurators.forEach {
            if $0.buttonType == type {
                $0.buttonCheck()
            }
        }
    }

    private func configureCollectionView() {
        let customLayout = CustomViewFlowLayout()
        customLayout.minimumLineSpacing = 15
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(cellType: FilterChooseCell.self)
        collectionView.setCollectionViewLayout(customLayout, animated: false)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.reloadData()
    }

    func setupFilterChooseCellsSize(categorysNames: [String]) {
        cellSizes = categorysNames.map { item -> CGSize in
            let width = Double(self.collectionView.bounds.width)
            var size = UIFont.systemFont14Semibold.sizeOfString(string: item, constrainedToWidth: width)
            size.width += 44
            return size
        }
    }

    private func setupUI() {
        setupTitleLabel()
        setupCollection()
    }

    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(11)
            make.height.equalTo(20)
        }
    }

    private func setupCollection() {
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(11)
            make.trailing.equalToSuperview().offset(-11)
            make.height.equalTo(44)
            make.bottom.equalToSuperview()
        }
    }
}

extension CellWithFilterSelection: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return configurators.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let configurator = configurators[indexPath.row]
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: FilterChooseCell.self)
        configurator.setupCell(cell)
        cell.delegate = self
        return cell
    }
}

extension CellWithFilterSelection: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = cellSizes[indexPath.row].width
        return CGSize(width: width, height: 44)
    }
}

extension CellWithFilterSelection: FilterChooseCellDelegate {
    func filterButtonTap(type: FilterCheckedButtonType, active: Bool) {
        delegate?.filterButtonTapped(filterSection: self.type ?? .category, filterType: type, active: active)
    }
}

final class DynamicHeightCollectionView: UICollectionView {
    var neededSize: ((CGSize) -> Void)?

    override func layoutSubviews() {
        super.layoutSubviews()
        if !bounds.size.equalTo(self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        neededSize?(contentSize)
        return contentSize
    }
}

final class CustomViewFlowLayout: UICollectionViewFlowLayout {
    let cellSpacing: CGFloat = 7
    var lineSpacing: CGFloat = 15

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        self.minimumLineSpacing = lineSpacing
        self.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            layoutAttribute.frame.origin.x = leftMargin
            leftMargin += layoutAttribute.frame.width + cellSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
        return attributes
    }
}

extension UIFont {
    func sizeOfString (string: String, constrainedToWidth width: Double) -> CGSize {
        return NSString(string: string).boundingRect(
            with: CGSize(width: width, height: Double.greatestFiniteMagnitude),
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: self],
            context: nil).size
    }
}

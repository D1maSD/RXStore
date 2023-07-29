//
//  FilterViewController.swift
//  RXStore
//
//  Created by Мельник Дмитрий on 27.07.2023.
//

import UIKit

protocol FilterViewControllerInputProtocol: AnyObject {
    func cityChoosed(city: String, country: String?)
}


protocol FilterListManagerDelegate: AnyObject {
    func filterButtonTap(filterSection: CellWithFilterSelectionType, filterType: FilterCheckedButtonType, active: Bool)
}

enum FilterSectionTypes {
    case chooseColor
}

final class FilterViewController: ViewController {

    private var section: [FilterSectionTypes] = [.chooseColor]
    private let viewModel: FilterViewModelProtocol
    private let tableView = TableViewFactory.make()
    private let categoryCellConfigurator = CellWithFilterSelectionConfigurator(type: .category)
    
    private let applyButtonView = ApplyFilterButtonView(applyButtonType: .applyFilter)

    init(viewModel: FilterViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        applyButtonView.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navBarTitle?("Фильтр")
        bindBackTap()
        bindResetButtonTap()
        setupUI()
        updateCheckedFilters()
        updateButtonsStates()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.dismissFilters()
    }

    override func setupUI() {
        setupApplyButton()
        setupTableView()
    }

    private func setupTableView() {
        
        tableView.register(CellWithFilterSelection.self, forCellReuseIdentifier: "\(CellWithFilterSelection.self)")

        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isUserInteractionEnabled = true
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(applyButtonView.snp.top)
        }
    }

    private func setupApplyButton() {
        view.addSubview(applyButtonView)
        applyButtonView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-56)
        }
    }

    private func updateCheckedFilters() {
        updateCheckedFilters(sectionType: .category, buttonTypes: viewModel.filtersChecked(type: .category))
    }
    
    func updateCheckedFilters(sectionType: CellWithFilterSelectionType, buttonTypes: [FilterCheckedButtonType]?) {
        guard let buttonTypes = buttonTypes else { return }
        switch sectionType {
        case .category:
            categoryCellConfigurator.activateFilterButtons(buttons: buttonTypes)
        }
    }

    private func updateButtonsStates() {
        let viewChanges = viewModel.viewChangesToTheFilterModel()
        let viewIsEmpty = viewModel.filterIsEmpty()
        applyButtonView.buttonState(state: viewChanges)
        navigationBar?.rightButtonIsEnabled = !viewIsEmpty
    }

    private func bindBackTap() {
        backTap = { [weak self] in
            self?.viewModel.dismissFilters()
        }
    }

    private func bindResetButtonTap() {
        rightButttonTap = { [weak self] in
            self?.viewModel.clearFilters()
            self?.tableView.reloadData()
        }
    }
    
    func filterButtonTap(filterSection: CellWithFilterSelectionType, filterType: FilterCheckedButtonType, active: Bool) {
        
        viewModel.recordFilterButtonTap(filterSection: filterSection, filterType: filterType, active: active)
        updateButtonsStates()
        updateCheckedFilters()
    }
}

extension FilterViewController: ApplyFilterButtonViewDelegate {
    func buttonTap() {
        viewModel.applyButtonTap()
    }
}

extension FilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}

extension FilterViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch section[indexPath.section] {
        case .chooseColor:
            let cell: CellWithFilterSelection = tableView.dequeueReusableCell(for: indexPath)
            categoryCellConfigurator.setupCell(cell)
            cell.delegate = self
            return cell
        }
    }
}

extension FilterViewController: CellWithFilterSelectionDelegate {
    
    func filterButtonTapped(filterSection: CellWithFilterSelectionType, filterType: FilterCheckedButtonType, active: Bool) {
        filterButtonTap(filterSection: filterSection, filterType: filterType, active: active)
    }
}


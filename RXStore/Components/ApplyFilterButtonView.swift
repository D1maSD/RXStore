import UIKit

protocol ApplyFilterButtonViewDelegate: AnyObject {
    func buttonTap()
}

final class ApplyFilterButtonView: UIView {

    weak var delegate: ApplyFilterButtonViewDelegate?
    private let applyButton = CustomRoundedButton()

    init(applyButtonType: CustomButtonState) {
        super.init(frame: .zero)
        setup(applyButtonType: applyButtonType)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buttonState(state: Bool) {
        print("50 .buttonState \(state))")
        applyButton.updateState(isActive: state)
    }

    private func setup(applyButtonType: CustomButtonState) {
        applyButton.configure(type: applyButtonType)
        applyButton.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        setupNextButton()
    }

    private func setupNextButton() {
        addSubview(applyButton)
        applyButton.snp.makeConstraints { make in
            make.height.equalTo(52)
            make.top.equalToSuperview().offset(29)
            make.leading.equalToSuperview().offset(11)
            make.trailing.equalToSuperview().offset(-11)
            make.bottom.equalToSuperview().offset(-30)
        }
    }

    @objc private func buttonTap() {
        delegate?.buttonTap()
    }
}

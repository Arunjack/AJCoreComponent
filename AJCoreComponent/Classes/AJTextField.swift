//
//  AJTextField.swift
//  Pods
//
//  Created by ArunJack on 07/07/21.
//

import UIKit
import SnapKit


@IBDesignable open class AJTextField: UIView {
     
    
    var ajField = UITextField()
    var sideButton = UIButton()
    public var sideButtonAction:((UIButton)->())?

    @IBInspectable public var borderColor: UIColor = .black {
        didSet {
            ajField.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            ajField.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var placeholder:String? = "" {
        didSet {
            ajField.placeholder = placeholder
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        addSubview(ajField)
        addSubview(sideButton)
    }
    
    func buildConstraints() {
        ajField.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        sideButton.snp.makeConstraints { make in
            make.centerY.equalTo(ajField.snp.centerY)
            make.left.equalTo(ajField.snp.right).offset(5)
            make.right.equalToSuperview().offset(-8)
        }
    }
    
    func buildStyle() {
        sideButton.backgroundColor = #colorLiteral(red: 0.4078193307, green: 0.4078193307, blue: 0.4078193307, alpha: 1)
        let image = UIImage(named: "Arrow")
        sideButton.setImage(image, for: .normal)
        sideButton.addTarget(self, action: #selector(sideButtonTapped), for: .touchUpInside)
    }
    
    @objc private func sideButtonTapped(_ sender:UIButton) {
        sideButtonAction?(sender)
    }
}

//
//  AJTextField.swift
//  Pods
//
//  Created by ArunJack on 07/07/21.
//

import Foundation
import UIKit
import SnapKit


@IBDesignable open class AJTextField: UIView {
     
    var ajField = CustomTextField()
    var sideButton = UIButton()
    public var sideButtonAction:((UIButton)->())?

    @IBInspectable public var borderColor: UIColor = .black {
        didSet {
            ajField.layer.borderColor = borderColor.cgColor
            ajField.layer.borderWidth = 1.0
        }
    }
    private var padding = UIEdgeInsets(top: 16,
                                       left: 17,
                                       bottom: 16,
                                       right: 15)

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
        buildConstraints()
        buildStyle()
    }
    
    func buildConstraints() {
        ajField.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        sideButton.snp.makeConstraints { make in
            make.centerY.equalTo(ajField.snp.centerY)
            make.left.equalTo(ajField.snp.right)
            make.right.equalToSuperview().offset(-8)
            make.top.bottom.equalTo(ajField)
            make.width.equalTo(40)
        }
    }
    
    internal final func resourceBundle() -> Bundle? {
        let frameworkBundle = Bundle(for: AJTextField.self)
        if let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("AJCoreComponent.bundle") {
            return Bundle(url: bundleURL)
        }
        return nil
    }
    
    func buildStyle() {
        sideButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        let image = UIImage(named: "Arrow", in: Bundle(for: type(of: self)), compatibleWith: nil)
        sideButton.setImage(image, for: .normal)
        sideButton.addTarget(self, action: #selector(sideButtonTapped), for: .touchUpInside)
    }
    
    @objc private func sideButtonTapped(_ sender:UIButton) {
        ajField.resignFirstResponder()
        sideButtonAction?(sender)
    }

}

public class CustomTextField: UITextField {
    
    private var padding = UIEdgeInsets(top: 16,
                                       left: 17,
                                       bottom: 16,
                                       right: 15)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setInsets(forBounds bounds: CGRect) -> CGRect {
        
        if leftView != nil  { padding.left = 50 }
        if rightView != nil  { padding.right = 50 }
        return bounds.insetBy(dx: padding.left, dy: padding.right)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return setInsets(forBounds: bounds)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return setInsets(forBounds: bounds)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return setInsets(forBounds: bounds)
    }
    
    override open func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= 16
        
        return rect
    }
    
    override open func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 19
        
        return rect
    }
    
}

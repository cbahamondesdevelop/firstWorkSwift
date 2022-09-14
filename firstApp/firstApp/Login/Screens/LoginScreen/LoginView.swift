//
//  LoginView.swift
//  firstApp
//
//  Created by sebastian.diaz.avila on 13-09-22.
//

import Foundation
import UIKit

protocol loginViewDelegate: UITextFieldDelegate {
    func clickInButton()
}

final class LoginView: UIView {
    
    public weak var delegate: loginViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 34)
        label.text = "TMDB APP"
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "Este usuario es con el cual ingresar en \nTMDB para iniciar sesion. \nsolo utilizaremos esto para consultar \npreferencias"
        return label
    }()
    
    private lazy var userLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Usuario"
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Contraseña"
        return label
    }()
    
    private(set) lazy var textFieldUser: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.delegate = self
        return textField
    }()
    
    private(set) lazy var textFieldPassword: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        return button
    }()
    
    init(delegate: loginViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setupViewConfiguration()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LoginView {
    
    @objc
    private func clickButton() {
        delegate?.clickInButton()
    }
    
    @objc
    private func clickInView() {
        self.textFieldUser.resignFirstResponder()
        self.textFieldPassword.resignFirstResponder()
    }
    
}

extension LoginView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return delegate?.textField?(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing?(textField)
    }

}

extension LoginView: BaseViewConfiguration {
    func buildViewHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(userLabel)
        self.addSubview(textFieldUser)
        self.addSubview(passwordLabel)
        self.addSubview(textFieldPassword)
        self.addSubview(continueButton)
    }
    
    func setupConstraints() {
        
        self.titleLabel.setupConstraints { view -> [NSLayoutConstraint] in [
        
            .top(firstItem: view, secondItem: self, constant: constant60),
            .left(firstItem: view, secondItem: self, constant: constant20),
            .right(firstItem: self, secondItem: view, constant: constant20)
        
        ]
        }
        
        self.descriptionLabel.setupConstraints { view -> [NSLayoutConstraint] in [
        
            .over(topItem: titleLabel, bottomItem: view, constant: constant20),
            .left(firstItem: view, secondItem: self, constant: constant10),
            .right(firstItem: self, secondItem: view, constant: constant10)
        
        ]
        }
        
        self.userLabel.setupConstraints { view -> [NSLayoutConstraint] in [

            .over(topItem: descriptionLabel, bottomItem: view, constant: constant40),
            .left(firstItem: view, secondItem: self, constant: constant10),
            .right(firstItem: self, secondItem: view, constant: constant10)

        ]
        }
        
        self.textFieldUser.setupConstraints { view -> [NSLayoutConstraint] in [
         
            .over(topItem: userLabel, bottomItem: view, constant: constant6),
            .left(firstItem: view, secondItem: self, constant: constant10),
            .right(firstItem: self, secondItem: view, constant: constant10),
            .height(view: view, constant: constant40)
            
        ]
        }
        
        self.passwordLabel.setupConstraints { view -> [NSLayoutConstraint] in [

            .over(topItem: textFieldUser, bottomItem: view, constant: constant20),
            .left(firstItem: view, secondItem: self, constant: constant10),
            .right(firstItem: self, secondItem: view, constant: constant10)

        ]
        }
        
        self.textFieldPassword.setupConstraints { view -> [NSLayoutConstraint] in [
         
            .over(topItem: passwordLabel, bottomItem: view, constant: constant6),
            .left(firstItem: view, secondItem: self, constant: constant10),
            .right(firstItem: self, secondItem: view, constant: constant10),
            .height(view: view, constant: constant40)
        ]
        }
        
        self.continueButton.setupConstraints { view -> [NSLayoutConstraint] in [

            .bottom(firstItem: self, secondItem: view, constant: constant10),
            .left(firstItem: view, secondItem: self, constant: constant60),
            .right(firstItem: self, secondItem: view, constant: constant60),
            .height(view: view, constant: constant48)
        ]
        }
    }
    
    func configureView() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(clickInView))
        self.addGestureRecognizer(gesture)
    }
}

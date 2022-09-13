//
//  loginViewController.swift
//  firstApp
//
//  Created by c.bahamondes.quiroga on 12-09-22.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController, BaseViewConfiguration, UITextFieldDelegate {
    
    // var test1 = 60.0
    
    private lazy var backgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        // view.layer.addroundcorners(radius: 4.0)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        // label.font = .itauRegularFont(withSize: constant16)
        label.font = .boldSystemFont(ofSize: 34)
        // label.text = L10n.temporaryBlockDetailMessage
        label.text = "TMDB APP"
        // label.textColor = .itauN80
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 4
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
        
        let view = inputAccessoryView
        // backgroundView.delegate = self
        // textField.text = "PRUEBA"
        textField.inputAccessoryView = view
        return textField
    }()
    
    private(set) lazy var textFieldPassword: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.black.cgColor
        textField.delegate = self
        
        let view = inputAccessoryView
        // backgroundView.delegate = self
        // textField.text = "PRUEBA PASS"
        textField.inputAccessoryView = view
        return textField
    }()
    
    private lazy var continueButton: UIButton = {

        let button = UIButton()
        button.titleLabel?.text = "Continuar"
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        setupViewConfiguration()
    }
   
   @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        self.backgroundView.setupConstraints { view -> [NSLayoutConstraint] in [
        
            .top(firstItem: view, secondItem: self.view),
            .bottom(firstItem: view, secondItem: self.view),
            .left(firstItem: view, secondItem: self.view),
            .right(firstItem: view, secondItem: self.view)
        ]
        }
        
        self.titleLabel.setupConstraints { view -> [NSLayoutConstraint] in [
        
            .top(firstItem: view, secondItem: backgroundView, constant: constant128),
            .left(firstItem: view, secondItem: backgroundView, constant: constant128),
            .right(firstItem: backgroundView, secondItem: view)
        
        ]
        }
        
        self.descriptionLabel.setupConstraints { view -> [NSLayoutConstraint] in [
        
            .over(topItem: titleLabel, bottomItem: view, constant: constant20),
            .left(firstItem: view, secondItem: backgroundView, constant: constant60),
            .right(firstItem: backgroundView, secondItem: view)
        
        ]
        }
        
        self.userLabel.setupConstraints { view -> [NSLayoutConstraint] in [

            .over(topItem: descriptionLabel, bottomItem: view, constant: constant40),
            .left(firstItem: view, secondItem: backgroundView, constant: constant60),
            .right(firstItem: backgroundView, secondItem: view)

        ]
        }
        
        self.textFieldUser.setupConstraints { view -> [NSLayoutConstraint] in [
         
            .over(topItem: userLabel, bottomItem: view, constant: constant14),
            .left(firstItem: view, secondItem: backgroundView, constant: constant60),
            .width(view: view, constant: constant280)
        ]
        }
        
        self.passwordLabel.setupConstraints { view -> [NSLayoutConstraint] in [

            .over(topItem: textFieldUser, bottomItem: view, constant: constant40),
            .left(firstItem: view, secondItem: backgroundView, constant: constant60),
            .right(firstItem: backgroundView, secondItem: view)

        ]
        }
        
        self.textFieldPassword.setupConstraints { view -> [NSLayoutConstraint] in [
         
            .over(topItem: passwordLabel, bottomItem: view, constant: constant14),
            .left(firstItem: view, secondItem: backgroundView, constant: constant60),
            .width(view: view, constant: constant280)
        ]
        }
        
        self.continueButton.setupConstraints { view -> [NSLayoutConstraint] in [

            .bottom(firstItem: backgroundView, secondItem: view, constant: constant6),
            .left(firstItem: view, secondItem: backgroundView, constant: constant60),
            .right(firstItem: backgroundView, secondItem: view),
            .height(view: view, constant: constant48)
        ]
        }
    }
    
    func buildViewHierarchy() {
        
        view.addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(descriptionLabel)
        backgroundView.addSubview(userLabel)
        backgroundView.addSubview(textFieldUser)
        backgroundView.addSubview(passwordLabel)
        backgroundView.addSubview(textFieldPassword)
        backgroundView.addSubview(continueButton)
    }
    
    func configureView() {
        
    }
    
}

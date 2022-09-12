//
//  loginViewController.swift
//  firstApp
//
//  Created by c.bahamondes.quiroga on 12-09-22.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController, BaseViewConfiguration, UITextFieldDelegate {
    
    // var test1 = 200.0
    
    private lazy var backgroundView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .yellow
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
    
    private(set) lazy var textFieldUser: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        textField.delegate = self
        
        let view = inputAccessoryView
        // backgroundView.delegate = self
        textField.text = "PRUEBA"
        textField.inputAccessoryView = view
        return textField
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
        
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(descriptionLabel)
        backgroundView.addSubview(textFieldUser)
        
        self.titleLabel.setupConstraints { view -> [NSLayoutConstraint] in [
        
            .top(firstItem: view, secondItem: backgroundView, constant: constant128),
            .left(firstItem: view, secondItem: backgroundView, constant: constant128),
            .right(firstItem: backgroundView, secondItem: view)
        
        ]
        }
        
        self.descriptionLabel.setupConstraints { view -> [NSLayoutConstraint] in [
        
            .top(firstItem: view, secondItem: backgroundView, constant: constant200),
            .left(firstItem: view, secondItem: backgroundView, constant: constant60),
            .right(firstItem: backgroundView, secondItem: view)
        
        ]
        }
        
        self.textFieldUser.setupConstraints { view -> [NSLayoutConstraint] in [
         
            .top(firstItem: view, secondItem: backgroundView, constant: constant280),
            .left(firstItem: view, secondItem: backgroundView, constant: constant14),
            .right(firstItem: backgroundView, secondItem: view)
        ]
        }
    }
    
    func buildViewHierarchy() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(descriptionLabel)
    }
    
    func configureView() {
        
    }
    
}

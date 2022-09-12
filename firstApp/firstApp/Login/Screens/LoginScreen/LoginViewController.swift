//
//  loginViewController.swift
//  firstApp
//
//  Created by c.bahamondes.quiroga on 12-09-22.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController, BaseViewConfiguration {
    
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
        // label.text = L10n.temporaryBlockDetailMessage
        label.text = "TMDB APP"
        // label.textColor = .itauN80
        return label
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        // self.view.backgroundColor = .brown
    }
   
   @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        backgroundView.addSubview(titleLabel)
        
        self.titleLabel.setupConstraints { view -> [NSLayoutConstraint] in [
        
            .top(firstItem: view, secondItem: backgroundView, constant: constant10),
            .left(firstItem: view, secondItem: backgroundView),
            .right(firstItem: backgroundView, secondItem: view)
        
        ]
        }
    }
    
    func buildViewHierarchy() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
    }
    
    func configureView() {
        self.titleLabel.text = "Hola"
    }
    
}

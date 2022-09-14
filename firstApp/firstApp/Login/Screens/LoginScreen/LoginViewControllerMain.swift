//
//  LoginViewControllerMain.swift
//  firstApp
//
//  Created by sebastian.diaz.avila on 13-09-22.
//

import Foundation
import UIKit

final class LoginViewControllerMain: UIViewController {
    
    private lazy var mainView: LoginView = {
        let view = LoginView(delegate: self)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
}

extension LoginViewControllerMain: loginViewDelegate {
    func clickInButton() {
        debugPrint("CLICK BUTTON")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        debugPrint("\(string)")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        debugPrint("\(textField)")
    }
    
}

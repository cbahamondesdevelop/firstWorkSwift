//
//  ViewController.swift
//  firstApp
//
//  Created by c.bahamondes.quiroga on 07-09-22.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewConfiguration()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemRed
    }

}

extension ViewController: BaseViewConfiguration {
    func buildViewHierarchy() {
        
    }
    func setupConstraints() {
        
    }
    
}

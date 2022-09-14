//
//  GenreTVShowView.swift
//  firstApp
//
//  Created by c.bahamondes.quiroga on 14-09-22.
//

import Foundation
import UIKit

final class GenreTVShowView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 34)
        label.text = "¿Cuales son tus generos de series favoritas?"
        label.textAlignment = .center
        return label
    }()
    
    lazy var listGenre: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var continueButton: UIButton = {

        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupViewConfiguration()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension GenreTVShowView: BaseViewConfiguration {
    
    func buildViewHierarchy() {
        // listGenre.dataSource = self
        // listGenre.register(UITableViewCell.self, forCellReuseIdentifier: "TablaGeneros")
        self.addSubview(self.titleLabel)
        self.addSubview(self.listGenre)
        self.addSubview(self.continueButton)
    }
    
    func setupConstraints() {
        
        self.titleLabel.setupConstraints { view -> [NSLayoutConstraint] in [
        
            .top(firstItem: view, secondItem: self, constant: constant128),
            .left(firstItem: view, secondItem: self, constant: constant2),
            .right(firstItem: self, secondItem: view)
        
        ]
        }
        
        self.listGenre.setupConstraints { view -> [NSLayoutConstraint] in [
        
            .over(topItem: titleLabel, bottomItem: view, constant: constant48),
            .left(firstItem: view, secondItem: self),
            .right(firstItem: self, secondItem: view),
            .height(view: view, constant: constant280)
        ]
        }
        
        self.continueButton.setupConstraints { view -> [NSLayoutConstraint] in [

            .bottom(firstItem: self, secondItem: view, constant: constant100),
            .left(firstItem: view, secondItem: self, constant: constant60),
            // .right(firstItem: backgroundView, secondItem: view),
            .height(view: view, constant: constant48),
            .width(view: view, constant: constant280)
        ]
        }
    }
    
    func configureView() {
        self.backgroundColor = .white
    }
}

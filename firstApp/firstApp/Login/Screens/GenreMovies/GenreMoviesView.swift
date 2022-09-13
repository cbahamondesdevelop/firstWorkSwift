//
//  GenreMoviesView.swift
//  firstApp
//
//  Created by c.bahamondes.quiroga on 13-09-22.
//

import Foundation
import UIKit

final class GenreMoviesView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 34)
        label.text = "Cuales son tus generos de peliculas favoritas"
        return label
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

extension GenreMoviesView: BaseViewConfiguration {
    
    func buildViewHierarchy() {
        self.addSubview(self.titleLabel)
    }
    
    func setupConstraints() {
        
        self.titleLabel.setupConstraints { view -> [NSLayoutConstraint] in [
        
            .top(firstItem: view, secondItem: self, constant: constant128),
            .left(firstItem: view, secondItem: self, constant: constant128),
            .right(firstItem: self, secondItem: view)
        
        ]
        }
    }
    
    func configureView() {
        self.backgroundColor = .white
    }
}

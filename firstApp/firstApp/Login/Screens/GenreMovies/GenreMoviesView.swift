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
        label.text = "¿Cuales son tus generos de peliculas favoritas?"
        label.textAlignment = .center
        return label
    }()
    
    lazy var listGenre: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupViewConfiguration()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let generos = ["Accion", "Suspenso", "Drama", "Comedia"]
    
}

extension GenreMoviesView: BaseViewConfiguration {
    
    func buildViewHierarchy() {
        listGenre.dataSource = self
        listGenre.register(UITableViewCell.self, forCellReuseIdentifier: "TablaGeneros")
        self.addSubview(self.titleLabel)
        self.addSubview(self.listGenre)
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
    }
    
    func configureView() {
        self.backgroundColor = .white
    }
}

extension GenreMoviesView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        generos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TablaGeneros", for: indexPath)
        cell.textLabel?.text = generos[indexPath.row]
        return cell
    }
    
}

//
//  GenreMoviesViewController.swift
//  firstApp
//
//  Created by c.bahamondes.quiroga on 13-09-22.
//

import Foundation
import UIKit

final class GenreMoviesViewController: UIViewController {
   
    let generos = ["Accion", "Suspenso", "Drama", "Comedia"]
    
    private lazy var genreMoviesView:GenreMoviesView = {
        let genreMovies = GenreMoviesView()
        genreMovies.listGenre.dataSource = self
        return genreMovies
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genreMoviesView.listGenre.reloadData()
        genreMoviesView.listGenre.register(UITableViewCell.self, forCellReuseIdentifier: "TablaGeneros")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func loadView() {
        self.view = self.genreMoviesView
    }
}

extension GenreMoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        generos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TablaGeneros", for: indexPath)
        cell.textLabel?.text = generos[indexPath.row]
        return cell
    }
}

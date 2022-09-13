//
//  GenreMoviesViewController.swift
//  firstApp
//
//  Created by c.bahamondes.quiroga on 13-09-22.
//

import Foundation
import UIKit

final class GenreMoviesViewController: UIViewController {
   
    private let genreMovies = GenreMoviesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func loadView() {
        self.view = self.genreMovies
    }
}

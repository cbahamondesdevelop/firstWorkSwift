//
//  GenreTVShowViewController.swift
//  firstApp
//
//  Created by c.bahamondes.quiroga on 14-09-22.
//

import Foundation
import UIKit

final class GenreTVShowViewController: UIViewController {
   
    let generosTV = ["Terror", "Crimen", "Comedia", "Animada"]
    
    private lazy var genreTVShowView:GenreTVShowView = {
        let genreTVShow = GenreTVShowView()
        genreTVShow.delegate = self
        genreTVShow.listGenre.dataSource = self
        return genreTVShow
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genreTVShowView.listGenre.reloadData()
        genreTVShowView.listGenre.register(UITableViewCell.self, forCellReuseIdentifier: "TablaGeneros")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func loadView() {
        self.view = self.genreTVShowView
    }
}

extension GenreTVShowViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        generosTV.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TablaGeneros", for: indexPath)
        cell.textLabel?.text = generosTV[indexPath.row]
        return cell
    }
}

extension GenreTVShowViewController: GenreTVShowDelegate {
    func onClickButton() {
        debugPrint("1")
    }
}

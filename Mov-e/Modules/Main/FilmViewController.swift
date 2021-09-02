//
//  MainViewController.swift
//  Mov-e
//
//  Created by Mac on 29.08.2021.
//

import UIKit
import Firebase

final class FilmViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var detailView: FilmDetailView!
  
  var viewModel = FilmViewModel()
  
  private var filmSearchController = UISearchController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createContactSearchController()
    
    viewModel.getFilm { [weak self] isRequestSucces in
      guard let self = self else { return }
      isRequestSucces ? self.tableView.reloadData() : self.showError(title: Localization.Error.error, subtitle: Localization.Error.responseSubtitle)
    }
  }
  
  private func createContactSearchController() {
    filmSearchController = ({
      let searchController = UISearchController(searchResultsController: nil)
      
      searchController.searchResultsUpdater = self
      searchController.searchBar.sizeToFit()
      searchController.obscuresBackgroundDuringPresentation = false
      
      tableView.tableHeaderView = searchController.searchBar
      
      return searchController
    })()
  }
  
  private func configurePhotoDetailView(_ isDetailViewHidden: Bool, _ isTableViewHidden: Bool) {
    detailView.isHidden = isDetailViewHidden
    tableView.isHidden = isTableViewHidden
  }
}

extension FilmViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.getFilmCount()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let row = indexPath.row
    
    let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.film, for: indexPath) as! FilmTableViewCell
    let film = viewModel.getFilm(at: row)
    
    cell.configure(film.title, film.imdbRating, film.runtime, posterUrl: film.poster)
    
    return cell
  }
}

extension FilmViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let row = indexPath.row
    
    FirebaseAnalytics.Analytics.logEvent("detail_screen_viewed", parameters: [
      
      AnalyticsParameterScreenName: "film_detail_view",
      
      "film": viewModel.films[row].title
    ])
    
    let film = viewModel.getFilm(at: row)
    
    configurePhotoDetailView(false, true)
    
    detailView.configure(film.title, film.year, film.released, film.runtime, film.genre, film.director, film.poster)
    
    detailView.close = { [weak self] in
      guard let self = self else { return }
      
      self.configurePhotoDetailView(true, false)
    }
  }
}

//MARK: Search Controller
extension FilmViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    guard let searchText = searchController.searchBar.text else { return }
    
    viewModel.films.removeAll()
    
    viewModel.getFilm(title: searchText) { [weak self] isRequestSucces in
      guard let self = self else { return }
      isRequestSucces ? self.tableView.reloadData() : self.showError(title: Localization.Error.error, subtitle: Localization.Error.responseSubtitle)
    }
    
    tableView.reloadData()
  }
}

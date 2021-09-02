//
//  MainViewModel.swift
//  Mov-e
//
//  Created by Mac on 29.08.2021.
//

import Foundation

final class FilmViewModel {
  var films: [Film] = []
  
  var selectedFilm: Film?
  
  var networkingManager = NetworkingManager()
  
  func getFilm(title: String? = nil, completionHandler: @escaping (Bool) -> ()) {
    if let title = title {
      networkingManager.urlPath = title
    }
     
    return networkingManager.getFilms(completionHandler: { [weak self] films in
      guard let self = self else { return }
      
      for film in films {
        self.films.append(film)
      }
      
      completionHandler(true)
    })
  }
  
  func getFilmCount() -> Int {
    return films.count
  }
  
  func getFilm(at index: Int) -> Film {
    return films[index]
  }
}

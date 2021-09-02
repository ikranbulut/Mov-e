//
//  Localization.swift
//  Mov-e
//
//  Created by Mac on 30.08.2021.
//

import Foundation

enum Localization {
  enum Error {
    static let error = "error".localized()
    static let networkingSubtitle = "error.newtorkingSubtitle".localized()
    static let responseSubtitle = "error.responseSubtitle".localized()
  }
  
  enum Film {
    static let imdbRating = "film.imdbRating".localized()
    static let time = "film.time".localized()
  }
  
  enum FilmDetail {
    static let released = "filmDetail.released".localized()
    static let runtime = "filmDetail.runtime".localized()
    static let genre = "filmDetail.genre".localized()
    static let director = "filmDetail.director".localized()
  }
}

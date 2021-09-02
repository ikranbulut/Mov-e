//
//  FilmsTableViewCell.swift
//  Mov-e
//
//  Created by Mac on 30.08.2021.
//

import UIKit
import Kingfisher

class FilmTableViewCell: UITableViewCell {
  @IBOutlet weak var posterImageView: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var ratedLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  func configure(_ title: String, _ rated: String, _ time: String, posterUrl: String) {
    
    let poster = URL(string: posterUrl)
    
    posterImageView.kf.setImage(with: poster)
    
    titleLabel.text = title
    ratedLabel.text = Localization.Film.imdbRating + rated
    timeLabel.text = Localization.Film.time + time
  }
}

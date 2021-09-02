//
//  FilmDetailViewView.swift
//  Mov-e
//
//  Created by Mac on 30.08.2021.
//

import UIKit
import SnapKit

final class FilmDetailView: UIView {
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var yearLabel: UILabel!
  @IBOutlet weak var releasedLabel: UILabel!
  @IBOutlet weak var runtimeLabel: UILabel!
  @IBOutlet weak var genreLabel: UILabel!
  @IBOutlet weak var directorLabel: UILabel!
  
  var close: (() -> Void)?
  
  private override init(frame: CGRect) {
    super.init(frame: frame)
    
    loadNib()
  }
  
  internal required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    loadNib()
  }
  
  private func loadNib() {
    Bundle.main.loadNibNamed("FilmDetailView", owner: self, options: nil)
    
    addSubview(contentView)
    
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    contentView.layer.masksToBounds = true
  }
  
  func FilmDetailViewViewConstraint() {
    snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.right.equalToSuperview()
      make.left.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }
  
  func configure(_ title: String, _ year: String, _ released: String, _ runtime: String, _ genre: String, _ director: String, _ posterUrl: String) {
    
    titleLabel.text = title
    yearLabel.text = year
    releasedLabel.text = Localization.FilmDetail.released + released
    runtimeLabel.text = Localization.FilmDetail.runtime + runtime
    genreLabel.text = Localization.FilmDetail.genre + genre
    directorLabel.text = Localization.FilmDetail.director + director
    
    let photo = URL(string: posterUrl)
    
    imageView.kf.setImage(with: photo)
  }
  
  @IBAction func closeButtonTapped(_ sender: UIButton) {
    close?()
  }
}

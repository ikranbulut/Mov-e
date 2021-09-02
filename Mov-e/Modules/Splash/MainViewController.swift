//
//  ViewController.swift
//  Mov-e
//
//  Created by Mac on 29.08.2021.
//

import UIKit
import Network
import Firebase

final class MainViewController: UIViewController {
  @IBOutlet weak var label: UILabel!
  
  private var viewModel = MainViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    viewModel.setupRemoteConfigDefaults()
    viewModel.fetchRemoteConfig({ [weak self] isRemoteConfig in
      guard let self = self else { return }
      self.changeTitle()
    })

    viewModel.getNetworkConnection({ [weak self] isNetworkConnection in
      guard let self = self else { return }
      
      isNetworkConnection ? self.routeToFilm() : self.showError(title: Localization.Error.error, subtitle: Localization.Error.networkingSubtitle)
    })
  }
  
  func changeTitle() {
    let loginLabel = viewModel.appDelegate.remoteConfig.configValue(forKey: Constants.splashLabelKey).stringValue ?? ""
    
    label.text = loginLabel
  }
  
  func routeToFilm() {
    let filmStoryboard = UIStoryboard(name: StoryboardName.film, bundle: nil)
    
    let filmViewController = filmStoryboard.instantiateViewController(withIdentifier: StoryboardName.film) as! FilmViewController

    navigationController?.pushViewController(filmViewController, animated: true)
  }
}


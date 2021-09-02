//
//  SplashViewModel.swift
//  Mov-e
//
//  Created by Mac on 29.08.2021.
//

import Foundation
import Network

final class MainViewModel {
  let monitor = NWPathMonitor()
  let queue = DispatchQueue(label: Constants.queueLabel)

  var appDelegate = AppDelegate()
  
  func setupRemoteConfigDefaults() {
    let defaultValue = [Constants.splashLabelKey: Constants.splashLabelDefault as NSObject]
    
    appDelegate.remoteConfig.setDefaults(defaultValue)
  }
  
  func fetchRemoteConfig(_ handler: @escaping (Bool) -> ()) {
    appDelegate.remoteConfig.fetch(withExpirationDuration: 0) { [weak self] _,_  in
      guard let self = self else { return }
      
      self.appDelegate.remoteConfig.activate()
      
      handler(true)
    }
    
    handler(false)
  }
  
  func getNetworkConnection(_ handler: @escaping (Bool) -> ()) {
    self.monitor.pathUpdateHandler = { pathUpdateHandler in
      
      DispatchQueue.main.async {
        if pathUpdateHandler.status == .satisfied {
          sleep(3)
          
          handler(true)
        } else {
          handler(false)
        }
      }
    }
    
    monitor.start(queue: self.queue)
  }
}

//
//  NetworkingManager.swift
//  Mov-e
//
//  Created by Mac on 30.08.2021.
//

import Foundation
import Alamofire

final class NetworkingManager {
  var urlPath: String?
  
  func getFilms(completionHandler: @escaping ([Film]) -> ()) {
    var url = ""
    
    if let urlPath = urlPath {
      url = Constants.baseUrl + urlPath + Constants.queryParam
    } else {
      url = Constants.baseUrl + Constants.urlPath + Constants.queryParam
    }

    let request =  AF.request(url, method: .get)
    
    request.responseDecodable (of: Film.self) { response in
      guard let film = response.value else { return }
      
      completionHandler([film])
    }
  }
}


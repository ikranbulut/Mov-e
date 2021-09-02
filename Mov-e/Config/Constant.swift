//
//  Constant.swift
//  Mov-e
//
//  Created by Mac on 30.08.2021.
//

import Foundation

struct Constants {
  static let splashLabelKey = "splashLabel"
  static let splashLabelDefault = "Hello world!"
  
  static let queueLabel = "InternetConnectionMonitor"
  
  static var baseUrl: String {
    get {
      guard let filePath = Bundle.main.path(forResource: "OmdbAPI", ofType: "plist") else {
        fatalError("Couldn't find file 'OmdbAPI.plist'.")
      }
      
      let plist = NSDictionary(contentsOfFile: filePath)
      
      guard let value = plist?.object(forKey: "baseUrl") as? String else {
        fatalError("Couldn't find key 'Base URL' in 'OmdbAPI.plist'.")
      }
      
      return value
    }
  }
  
 static var urlPath: String {
    get {
      guard let filePath = Bundle.main.path(forResource: "OmdbAPI", ofType: "plist") else {
        fatalError("Couldn't find file 'OmdbAPI.plist'.")
      }
      
      let plist = NSDictionary(contentsOfFile: filePath)
      
      guard let value = plist?.object(forKey: "urlPath") as? String else {
        fatalError("Couldn't find key 'Url Path' in 'OmdbAPI.plist'.")
      }
      
      return value
    }
  }
  
  static var queryParam: String {
     get {
       guard let filePath = Bundle.main.path(forResource: "OmdbAPI", ofType: "plist") else {
         fatalError("Couldn't find file 'OmdbAPI.plist'.")
       }
      
       let plist = NSDictionary(contentsOfFile: filePath)
      
       guard let value = plist?.object(forKey: "queryParam") as? String else {
         fatalError("Couldn't find key 'Query Param' in 'NasaAPI.plist'.")
       }
      
       return value
     }
   }
}

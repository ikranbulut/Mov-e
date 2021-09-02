//
//  StringExtension.swift
//  Mov-e
//
//  Created by Mac on 30.08.2021.
//

import Foundation

extension String {
  func localized() -> String {
    return NSLocalizedString(self, comment: "")
  }
}

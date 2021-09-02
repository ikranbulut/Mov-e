//
//  UIViewControllerExtension.swift
//  Mov-e
//
//  Created by Mac on 29.08.2021.
//

import UIKit
import NotificationBannerSwift

extension UIViewController {
  func showError(title: String, subtitle: String) {
    let banner = FloatingNotificationBanner(title: title,
                                            subtitle: subtitle,
                                            style: .info)
    banner.transparency = 0.85
    banner.show(bannerPosition: .top, cornerRadius: 10)
  }
}

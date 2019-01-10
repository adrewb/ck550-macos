//
//  MonitoringViewController.swift
//  ck550
//
//  Created by Michal Duda on 18/12/2018.
//  Copyright © 2018 Michal Duda. All rights reserved.
//

import Foundation
import Cocoa

class MonitoringViewController: NSViewController {
    @IBAction func toggledAction(_ sender: NSSegmentedCell) {
        let userInfo = [UserInfoNotificationType.isMonitoringEnabled.rawValue: sender.isSelected(forSegment: 0)]
        let notification = Notification(name: .CustomMenuToggled,
                                        object: self,
                                        userInfo: userInfo)
        NotificationCenter.default.post(notification)
    }
}

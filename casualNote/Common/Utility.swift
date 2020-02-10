//
//  Helper.swift
//  casualNote
//
//  Created by 胡俊峰 on 2/9/20.
//  Copyright © 2020 CasualNotes. All rights reserved.
//

import Foundation
// 获取时间 timestamp
func getTimestamp()->Int {
    let now = NSDate()
    let timeInterval: TimeInterval = now.timeIntervalSince1970
    return Int(timeInterval)
   
}

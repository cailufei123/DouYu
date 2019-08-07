//
//  NSDate+Estension.swift
//  DouYu
//
//  Created by ribencun on 2019/7/19.
//  Copyright © 2019 李勇聪. All rights reserved.
//

import Foundation

extension NSDate {
    class func getCurrentDate() -> String {
        let nowDate = NSDate()
        let interval = Int(nowDate.timeIntervalSince1970)
        return"\(interval)"
    }
}

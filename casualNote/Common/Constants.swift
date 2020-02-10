//
//  Constants.swift
//  casualNote
//
//  Created by 胡俊峰 on 2/8/20.
//  Copyright © 2020 CasualNotes. All rights reserved.
//

import Foundation
import UIKit

func RGBColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor.init(red: (r/255.0), green: (g/255.0), blue: (b/255.0), alpha: a)
}

//        配色：rgba(41, 128, 185,1.0)

func RGBColorBase() -> UIColor {
    return UIColor.init(red: (41/255.0), green: (128/255.0), blue: (185/255.0), alpha: 1.0)
}

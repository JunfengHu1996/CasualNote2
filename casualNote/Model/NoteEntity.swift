//
//  Note.swift
//  casualNote
//
//  Created by 胡俊峰 on 2/9/20.
//  Copyright © 2020 CasualNotes. All rights reserved.
//

import UIKit
import Foundation

struct Note {
    var content: String
    var timestamp: Int
    var notesId: Int
    var image: Data
    
    init(content: String, timestamp: Int, id: Int, image: Data) {
        self.content = content
        self.timestamp = timestamp
        self.notesId = id
        self.image = image
    }
    
}


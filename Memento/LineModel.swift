//
//  LineModel.swift
//  Memento
//
//  Created by Марк Фокша on 11.07.2023.
//

import UIKit

struct LineModel {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    
    init(start: CGPoint, end: CGPoint, color: UIColor) {
        self.start = start
        self.end = end
        self.color = color
    }
}



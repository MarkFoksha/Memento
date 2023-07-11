//
//  LineManager.swift
//  Memento
//
//  Created by Марк Фокша on 11.07.2023.
//

import UIKit

class LineManager {
    static let shared = LineManager()
    
    var linesArray = [LineModel]()
    
    func save() -> LineStatesMemento {
        LineStatesMemento(lines: linesArray)
    }
    
    func load(state: LineStatesMemento) {
        self.linesArray = state.linesArray
    }
    
    func printLines(in view: UIView) {
        guard let layers = view.layer.sublayers else { return }
        
        for view in layers {
            view.removeFromSuperlayer()
        }
        
        for line in linesArray {
            let path = UIBezierPath()
            
            path.move(to: line.start)
            path.addLine(to: line.end)
            draw(path, line.color, view)
        }
    }
    
    private func draw(_ path: UIBezierPath, _ lineColor: UIColor, _ view: UIView) {
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.strokeColor = lineColor.cgColor
        shape.lineWidth = 10
        shape.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(shape)
        view.setNeedsLayout()
        
    }
    
    
    private init() { }
}

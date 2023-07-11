//
//  DrawView.swift
//  Memento
//
//  Created by Марк Фокша on 11.07.2023.
//

import UIKit

class DrawView: UIView {
    var carrier: CarrierState!
    
    var lineWidth: CGFloat!
    var lineColor: UIColor!
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    var path: UIBezierPath!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        lineWidth = 10
        let lines = LineManager.shared
        carrier = CarrierState(linesManager: lines)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startPoint = touch?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        endPoint = touch?.location(in: self)
        
        carrier.linesManager.linesArray.append(LineModel(start: startPoint, end: endPoint, color: lineColor))
        
        path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        startPoint = endPoint
        draw()
    }
    
    private func draw() {
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.strokeColor = lineColor.cgColor
        shape.lineWidth = 10
        shape.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shape)
        self.setNeedsLayout()
        
    }
}

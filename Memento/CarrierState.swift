//
//  CarrierState.swift
//  Memento
//
//  Created by Марк Фокша on 11.07.2023.
//

import UIKit

class CarrierState {
    var state: LineStatesMemento?
    var linesManager: LineManager
    
    init(linesManager: LineManager) {
        self.linesManager = linesManager
    }
    
    func saveLines() {
        state = linesManager.save()
    }
    
    func loadLines() {
        guard state != nil else { return }
        
        linesManager.load(state: state!)
    }
}

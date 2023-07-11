//
//  ViewController.swift
//  Memento
//
//  Created by Марк Фокша on 11.07.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewBoard: DrawView!
    var carrier: CarrierState!
    
    let lines = LineManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBoard.lineColor = .black
        carrier = CarrierState(linesManager: lines )
    }

    @IBAction func saveAction(_ sender: Any) {
        carrier.saveLines()
    }
    
    @IBAction func loadAction(_ sender: Any) {
        carrier.loadLines()
        carrier.linesManager.printLines(in: viewBoard)
        
    }
    @IBAction func blueButton(_ sender: Any) {
        viewBoard.lineColor = .blue
    }
    @IBAction func yellowAction(_ sender: Any) {
        viewBoard.lineColor = .yellow
    }
    @IBAction func greenAction(_ sender: Any) {
        viewBoard.lineColor = .green
    }
}


//
//  ViewController.swift
//  Comb_Filtering_Simulator
//
//  Created by george on 10/31/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa
import AppKit


var polarResponse:CombFilteringResponse = CombFilteringResponse( time: 10.0)

//globals

var phaseShiftForFrequency:Float = 0.0


class ViewController: NSViewController {
    
    @IBOutlet weak var combResponseView: CombResponseView!
    @IBAction func timeDelay(_ sender: NSTextField) {
        
        polarResponse.timeDelay = sender.floatValue
       combResponseView.setNeedsDisplay(combResponseView.bounds)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//Swift.print(polarResponse.fundamantalCancellation)
//Swift.print(polarResponse.phaseShift(frequencyToInspect: 1000))
//Swift.print("******\(polarResponse.reponseForFrequency(frequencyToInspect: 500)) dB") // this shoulfd be -35dB
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    
   
    
 
 
    
    
    
}


//
//  CombResponseView.swift
//  Comb_Filtering_Simulator
//
//  Created by george on 11/4/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

class CombResponseView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        
        let combResponse = NSBezierPath()
        
        combResponse.move(to: NSPoint(x: 0, y: Int(polarResponse.reponseForFrequency(frequencyToInspect:10))))
        
        for i:Float in stride(from: 10, to: 10000, by: 1) {
            
           let xValue = log10(i) - 1
           let xPosition = Int( Float(self.bounds.width/3) * xValue  )
           let dBValue = polarResponse.reponseForFrequency(frequencyToInspect:i)
           let yPosition = (dBValue + 35) * 4
            
            combResponse.line(to: NSPoint(x: xPosition, y: Int(yPosition)))
            
           //combResponse.line(to: NSPoint(x: xPosition, y: Int(polarResponse.reponseForFrequency(frequencyToInspect:i))))
            
  Swift.print("frequency = \(i)")
  Swift.print("~~~~~~~~~")
//Swift.print("i = \(i)  ->  x = \(xPosition) y = \(polarResponse.reponseForFrequency(frequencyToInspect:i))")
        }
        
        combResponseColor.setStroke()
        combResponse.lineWidth = 1
        combResponse.stroke()
        
        
        // Drawing code here.
    }
    
}

//
//  LogGridView.swift
//  Comb_Filtering_Simulator
//
//  Created by george on 10/31/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

class LogGridView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        let yDivisions:Int = 10 // dB -infinity(-40 dB) to +10dB
        let xDivisions:Int = 30  //log 10 to 10,000
        
        
        
        self.layer?.backgroundColor = graphBackgroundColor
        self.layer?.borderWidth = 1
        self.layer?.borderColor = NSColor.black.cgColor
        
        
        
        
     //**********************************************************
     //******************* gridlines ****************************
        Swift.print(self.bounds)
        
        
        
      
        
        
     //*********** y dB grid ************************************
        
         let gridLevelAxis = NSBezierPath() //grid lines
        
        for i in 0...yDivisions {
            gridLevelAxis.move(to: NSPoint(x:self.bounds.origin.x, y: (self.bounds.height / CGFloat(yDivisions)) * CGFloat(i) ) )
            
            gridLevelAxis.line(to: NSPoint(x: self.bounds.origin.x + self.bounds.width, y: (self.bounds.size.height / CGFloat(yDivisions)) * CGFloat(i) ) )
            
        }
        


        gridColor.setStroke()
        gridLevelAxis.lineWidth = 0.5
        gridLevelAxis.stroke()
        
    
     //**************** y axis highlight ******************************
        
        let frequencyGridHighlights = NSBezierPath() //grid and axis lines...in this case only draw zero axis at division 7
        
        for i in stride(from: 0, to: yDivisions, by: 7) {
            
            frequencyGridHighlights.move(to: NSPoint(x:self.bounds.origin.x, y: (self.bounds.height / CGFloat(yDivisions)) * CGFloat(i)  )  )
            
            frequencyGridHighlights.line(to: NSPoint(x: self.bounds.origin.x + self.bounds.width, y: (self.bounds.size.height / CGFloat(yDivisions)) * CGFloat(i) )  )
            
        }
        
        axisColor.setStroke()
        frequencyGridHighlights.lineWidth = 1
        frequencyGridHighlights.stroke()
       
        
        
        //**************** x freq grid ******************************
        
        let gridFrequencyAxis = NSBezierPath() //grid lines
        
        for i in stride(from: 1, to: 4, by: 1) {
            
            let j = Int(pow(Double(10), Double(i)) )
            
            for k in stride(from: 2, to: 11, by: 1) {
                
             
                
                 let frequencyScaleValue = log10(Float(j * k)) - 1
                
                  let  XValue = Float(self.bounds.width/3) * frequencyScaleValue
                
                
                
                 gridFrequencyAxis.move(to: NSPoint(x: CGFloat(XValue), y: self.bounds.origin.y))
                 gridFrequencyAxis.line(to: NSPoint(x: CGFloat(XValue), y: self.bounds.origin.y + self.bounds.height))
       
                gridColor.setStroke()
                gridFrequencyAxis.lineWidth = 0.5
               

 Swift.print("line from  \(NSPoint(x: CGFloat(XValue), y: self.bounds.origin.y))   to \(NSPoint(x: CGFloat(XValue), y: self.bounds.origin.y + self.bounds.height))")
    
//Swift.print("xxxxxxxxx\(NSPoint(x: CGFloat(XValue), y: self.bounds.origin.y))")
//Swift.print("to\(NSPoint(x: CGFloat(XValue), y: self.bounds.origin.y +  self.bounds.height ))")
  
// Swift.print(" number = \(j * k) scalevalue = \(XValue)")
                
//Swift.print(frequencyScaleValue)
                
                
            } //end k loop
            
            
            
        } // end i loop
        
        gridFrequencyAxis.stroke()
       
        
        
        
        
    }// end draw rect
    
}

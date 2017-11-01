//
//  LogGridView.swift
//  Comb_Filtering_Simulator
//
//  Created by george on 10/31/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

@IBDesignable

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
      

        
     //*********** y dB grid ************************************
        
         let gridLevelAxis = NSBezierPath() //grid lines
        
        for i in 0...yDivisions {
            gridLevelAxis.move(to: NSPoint(x:self.bounds.origin.x, y: (self.bounds.height / CGFloat(yDivisions)) * CGFloat(i) ) )
            
            gridLevelAxis.line(to: NSPoint(x: self.bounds.origin.x + self.bounds.width, y: (self.bounds.size.height / CGFloat(yDivisions)) * CGFloat(i) ) )
            
        }
        
        gridColor.setStroke()
        gridLevelAxis.lineWidth = 0.5
        gridLevelAxis.stroke()
        
      //*************************************************************
     //**************** y axis highlight ****************************
        
        let levelGridHighlights = NSBezierPath() //grid and axis lines...in this case only draw zero axis at division 7
        
        for i in stride(from: 0, to: yDivisions, by: 7) {
            
            levelGridHighlights.move(to: NSPoint(x:self.bounds.origin.x, y: (self.bounds.height / CGFloat(yDivisions)) * CGFloat(i)  )  )
            
            levelGridHighlights.line(to: NSPoint(x: self.bounds.origin.x + self.bounds.width, y: (self.bounds.size.height / CGFloat(yDivisions)) * CGFloat(i) )  )
            
        }
        
        axisColor.setStroke()
        levelGridHighlights.lineWidth = 1
        levelGridHighlights.stroke()
       
        
        //*************************************************************
        //*************************************************************
        //**************** x freq grid ********************************
        
        let gridFrequencyAxis = NSBezierPath() //grid lines
        
        for i in stride(from: 1, to: 4, by: 1) {
            
            let j = Int(pow(Double(10), Double(i)) )
            
            for k in stride(from: 2, to: 11, by: 1) {
                
                
                let frequencyScaleValue = log10(Float(j * k)) - 1 // frequency scale start with 10 not zero
                
                let  XValue = Float(self.bounds.width/3) * frequencyScaleValue
                
                
                gridFrequencyAxis.move(to: NSPoint(x: CGFloat(XValue), y: self.bounds.origin.y))
                gridFrequencyAxis.line(to: NSPoint(x: CGFloat(XValue), y: self.bounds.origin.y + self.bounds.height))
                
                
            } //----end k loop
            
            
        } // ----end i loop
        
        gridColor.setStroke()
        gridFrequencyAxis.lineWidth = 0.5
        gridFrequencyAxis.stroke()
       
        //*************************************************************
        //*************************************************************
        //**************** x freq highlights **************************
        
        
        let highlightFrequencyAxis = NSBezierPath() //grid lines
        
        for i in stride(from: 1, to: 4, by: 1) {
            
            let j = Int(pow(Double(10), Double(i)) )
            
            //avoid zero for log so use 0.001 in counter
            for k in stride(from: 0.001, to: 11, by: 5) {
                
                
                let frequencyScaleValue = log10(Float(Double(j) * k)) - 1 // frequency scale start with 10 not zero
                
                let  XValue = Float(self.bounds.width/3) * frequencyScaleValue
                
                
                highlightFrequencyAxis.move(to: NSPoint(x: CGFloat(XValue), y: self.bounds.origin.y))
                highlightFrequencyAxis.line(to: NSPoint(x: CGFloat(XValue), y: self.bounds.origin.y + self.bounds.height))
                
                
            } //----end k loop
            
            
        } // ----end i loop
        
        axisColor.setStroke()
        highlightFrequencyAxis.lineWidth = 1
        highlightFrequencyAxis.stroke()
        
        
        
    }// end draw rect
    
}

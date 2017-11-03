//
//  CombFilteringResponse.swift
//  Comb_Filtering_Simulator
//
//  Created by george on 11/3/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

class CombFilteringResponse: NSObject {
    
    
    //**********************************************
    //******** properties **************************
    
    var timeDelay:Float = 0.0       // milliseconds
    var speedOfSound:Float = 344.0  //meters per second
  
    
    
       //******** computed properties **************
    
    var fundamantalCancellation:Float {
        get{
           return( 1 / (timeDelay/1000 * 2 ))  //Hz
        }
        
    }
   //**********************************************
    
    var pathLengthDifference:Float{
        get{
          return( speedOfSound * timeDelay) //millimeters
        }
        
    }

    
  //*************************************************
  //**************** initializer ********************
    
    init( time: Float, speed:Float = 344.0)   {
        
        
        self.timeDelay = time
        self.speedOfSound = speed
       
    }
    
    
    
    //***********************************************
    //**************** methods **********************
    
    
    
    func phaseShift(frequencyToInspect:Float) -> Float {
        
        phaseShiftForFrequency = frequencyToInspect * (timeDelay/1000) * 360
        phaseShiftForFrequency = phaseShiftForFrequency.truncatingRemainder(dividingBy: 360.0) //keep phase shift between 0 and 360
        
        Swift.print("the phase shift for the call on this func was \(phaseShiftForFrequency)")
        return phaseShiftForFrequency
        
    
    }
    
    
    func reponseForFrequency(frequencyToInspect: Float)-> Float{
        
        var degreesShift = phaseShift(frequencyToInspect: frequencyToInspect)
       
        var sensitivityForFrequency = (sin((90 + (degreesShift/2)).degreesToRadians)) * 2  //relative sensitity from 0 to 2
        
        Swift.print("degrees shift \(degreesShift)")

        Swift.print("sensitivity for frequency is \(sensitivityForFrequency)")
        
        
        if sensitivityForFrequency < 0.0001 {sensitivityForFrequency = 0.0177827941}
        return(20 * log10(sensitivityForFrequency) )
        
        
    }
    // for the purposes of plotting graph
    // zero to 2 covers from +6 db to -35 dB
    // for graph -35 => minus infinity ...
    //so to avoid log zero errors when relative sesitity = zero
    // offset by 0.177827941 which will result in -35dB instead of minus infinity
    
    

}

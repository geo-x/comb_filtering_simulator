//
//  ResultantGridView.swift
//  Comb_Filtering_Simulator
//
//  Created by george on 11/5/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa

@IBDesignable

class ResultantGridView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        self.layer?.backgroundColor = graphBackgroundColor
        self.layer?.borderWidth = 1
        self.layer?.borderColor = NSColor.black.cgColor

        // Drawing code here.
    }
    
}

//
//  RemoveBuyablePiece.swift
//  HexMatch
//
//  Created by Josh McKee on 2/2/16.
//  Copyright © 2016 Josh McKee. All rights reserved.
//

import Foundation

class RemoveBuyablePiece: BuyablePiece {
 
    override init() {
        super.init()
        
        self.basePrice = 5000
        self.currentPrice = 5000
    }
    
    required init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    override func createPiece() -> HexPiece {
        let hexPiece = RemovePiece()
        
        hexPiece.value = self.value
        
        return hexPiece
    }

}
//
//  FramedArtView.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 12/16/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation
import UIKit

class FramedArtView: UIView {
    // for later - may not need
    var shouldSetupConstraints = true
    
    var picframeView: UIImageView!
    var savedArtImageView: UIImageView!
    
    let screenSize = UIScreen.main.bounds
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        picframeView = UIImageView(frame: CGRect.zero)
        picframeView = UIImageView(frame: CGRect(x: 0, y: 0, width: 280, height: 280))
        picframeView.image = UIImage(named:"OrnateFrame")
        // how do I make this flexible to whatever the subview is?
        
        self.addSubview(picframeView)
        
        savedArtImageView = UIImageView(frame: CGRect.zero)
        savedArtImageView.layer.borderColor = UIColor.black.cgColor
        savedArtImageView.layer.borderWidth = 1.0
        // in my VC I will set the actual image, I hope
        

        self.addSubview(savedArtImageView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // for later - may not need
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
}



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
   
    // A view for the frame and a view for the artwork
    private var picframeView: UIImageView!
    private var savedArtImageView: UIImageView!
    private var widthConstraint: NSLayoutConstraint!
    private var heightConstraint: NSLayoutConstraint!
    
 
        
    override init(frame: CGRect){
        picframeView = UIImageView()
        picframeView.translatesAutoresizingMaskIntoConstraints = false
        picframeView.image = UIImage(named:"NormalFrame")
        savedArtImageView = UIImageView()
        savedArtImageView.translatesAutoresizingMaskIntoConstraints = false
        savedArtImageView.contentMode = .scaleAspectFit
        super.init(frame: frame)
        addSubview(picframeView)
        addSubview(savedArtImageView)
        savedArtImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        savedArtImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        widthConstraint = savedArtImageView.widthAnchor.constraint(equalToConstant: 0)
        widthConstraint.isActive = true
        heightConstraint = savedArtImageView.heightAnchor.constraint(equalToConstant: 0)
        heightConstraint.isActive = true
        
    }
    
    func setImage(_ image: UIImage) {
        savedArtImageView.image = image
//        var newSize: CGSize = CGSize()

//          need to get size minus 60 for frame accomodation
        let accomodatingSizeForImage = image.accomodatingSize(maxSize: (savedArtImageView.bounds.size))
        let newSizeWidth = accomodatingSizeForImage.width - 60
        let newSizeHeight = accomodatingSizeForImage.height - 50
//        newSize.width = newSizeWidth
//        newSize.height = newSizeHeight
        savedArtImageView.image!.accessibilityFrame.size.width = newSizeWidth
        savedArtImageView.image!.accessibilityFrame.size.height = newSizeHeight
       
        }
    
    
        
    

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
}

extension UIImage {
    func accomodatingSize(maxSize: CGSize) -> CGSize {
        guard size.width > 0 && size.height > 0 else { return size }
        
        let scale: CGFloat
        
        if size.width > size.height {
            scale = maxSize.width / size.width
        } else {
            scale = maxSize.height / size.height
        }
        return CGSize(width: size.width * scale , height: size.height * scale)
    }
    
}




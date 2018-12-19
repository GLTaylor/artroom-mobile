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
    private var frameWidthConstraint: NSLayoutConstraint!
    private var frameHeightConstraint: NSLayoutConstraint!

    override init(frame: CGRect) {
        picframeView = UIImageView()
        picframeView.translatesAutoresizingMaskIntoConstraints = false
        picframeView.image = UIImage(named: "OnyxFrame")
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

        // Four constraints should set the frame. These two center it
        picframeView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        picframeView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        frameWidthConstraint = picframeView.widthAnchor.constraint(equalToConstant: 0)
        frameWidthConstraint.isActive = true
        frameHeightConstraint = picframeView.heightAnchor.constraint(equalToConstant: 0)
        frameHeightConstraint.isActive = true
    }

    func setImage(_ image: UIImage) {
        savedArtImageView.image = image
        let newSize: CGSize = CGSize(width: (bounds.size.width - 60), height: bounds.size.height - 50)
        let accomodatingSizeForImage = image.accomodatingSize(maxSize: newSize)
        widthConstraint.constant = accomodatingSizeForImage.width
        heightConstraint.constant = accomodatingSizeForImage.height

        // This doesn't quite work but it should be that the frame is just slightly bigger than the image so the below is almost right I think
        frameWidthConstraint.constant = widthConstraint.constant + 65
        frameHeightConstraint.constant = heightConstraint.constant + 64
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
        return CGSize(width: size.width * scale, height: size.height * scale)
    }
}

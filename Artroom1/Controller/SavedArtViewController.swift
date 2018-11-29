//
//  SavedArtViewController.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 11/20/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation
import UIKit

class SavedArtViewController: UIViewController {
    
    var arrayOfSavedArt: [Artwork]?
    var savedArtImage: UIImageView!

    
    @IBOutlet weak var savedArt: iCarousel?
//    @IBOutlet weak var savedArtTitle: UILabel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedArt!.type = .invertedCylinder
        savedArt!.contentMode = .scaleAspectFit
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))
    }
    
    @objc func startOver() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
    
extension SavedArtViewController: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return arrayOfSavedArt!.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        if view == nil {
            savedArtImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
            savedArtImage.contentMode = .scaleAspectFit
        } else {
            savedArtImage = view as? UIImageView
        }
        let nameOfImage = arrayOfSavedArt?[index].image
        savedArtImage.image = UIImage(named: nameOfImage ?? "Empty Frame")
        return savedArtImage
      }
    
        
    }
    


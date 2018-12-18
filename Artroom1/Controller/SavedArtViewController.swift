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
    var savedArtImage: UIImage!
    // Displays carousel of artworks - for now, images only
    @IBOutlet var savedArt: iCarousel?
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
}

extension SavedArtViewController: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in _: iCarousel) -> Int {
        return arrayOfSavedArt!.count
    }
    
    

    func carousel(_: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {

        let frameView = FramedArtView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        
        let nameOfImage = arrayOfSavedArt?[index].image.url
        loadImageFromURL(nameOfImage!, framedView: frameView)

        //This neews to be the framedView from the loadImageFromURL func
        return frameView
    }

    func loadImageFromURL(_ givenurl: String, framedView: FramedArtView) {
        guard let url = URL(string: givenurl) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { place, _, _ in
            guard let place = place else {
                print("location went wrong")
                return
            }
            let image = UIImage(data: place)
            DispatchQueue.main.async {
                framedView.setImage(image!)
            }
        }
        task.resume()
    }
}

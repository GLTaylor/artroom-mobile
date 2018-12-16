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
    // new var to try to get frame included
    // I now have a customized class, but I can't plug it in here (not sure how it fits with carousel)
    var frameView: UIImageView!
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

        if view == nil {
            frameView = UIImageView(frame: CGRect(x: 0, y: 0, width: 280, height: 280))
            frameView.image = UIImage(named:"OrnateFrame")
            savedArtImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
            savedArtImage.contentMode = .scaleAspectFit
            //not sure if this helps at all
            frameView.frame = savedArtImage.bounds;

            frameView.addSubview(savedArtImage)


        } else {
            frameView = view as? UIImageView
        }
        let nameOfImage = arrayOfSavedArt?[index].image.url
        loadImageFromURL(nameOfImage!)
        return frameView
    }

    func loadImageFromURL(_ givenurl: String) {
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
                self.savedArtImage.image = image
            }
        }
        task.resume()
    }
}

//
//  ArtViewController.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/18/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation
import UIKit


class ArtViewController: UIViewController {
    
    var chosenArtAttributes: ArtAttributes!
    private var selection: [Artwork] = []

    @IBOutlet weak var artResults: UILabel!
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var anotherButton: UIButton!
   
    func setCurrentArtwork(_ artwork: Artwork) {
        self.artResults.text = artwork.title
        self.artImage.image = UIImage (named: artwork.image)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selection = arrayOfArtworks.filter { (artwork: Artwork) -> Bool in
            artwork.attributes == chosenArtAttributes
        }
        renderFresh()
       
     }
    
    @IBAction func renderFresh() {
        
        if selection.isEmpty {
            self.artResults.text = "No more art matches"
            self.artImage.image = UIImage (named: "Empty Frame")
            // no art "Art" piece
            anotherButton.isEnabled = false
            anotherButton.alpha = 0.5
//            anotherButton.setTitle("No more art", for: .disabled )

        } else {
            renderNextArt()
        }
       
    }
    
    @IBAction func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }

    private func renderNextArt() {
        if let rendered = selection.randomElement(), let index = selection.firstIndex(of: rendered)  {
            setCurrentArtwork(rendered)
            selection.remove(at: index)
        }
    }
    
}

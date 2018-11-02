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
    var randomIndex = Int()
    private var selection: [Artwork] = []

    @IBOutlet weak var artResults: UILabel!
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var anotherButton: UIButton!

   
    func assignTheLabels(_ artwork: Artwork) {
        self.artResults.text = artwork.title
        self.artImage.image = UIImage (named: artwork.image)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        selection = arrayOfArtworks.filter { (artwork: Artwork) -> Bool in
            artwork.attributes == chosenArtAttributes
        }
        renderFresh()
       
     }
    
    @IBAction func renderFresh() {
        
        if selection.isEmpty {
            // no art "Art" piece
            anotherButton.isEnabled = false
            anotherButton.alpha = 0.5
            anotherButton.setTitle("No more art", for: .disabled )

        } else {
            renderNextArt()
        }
       
    }
    
    @IBAction func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }

    private func renderNextArt() {
        if let rendered = selection.randomElement(), let index = selection.firstIndex(of: rendered)  {
            assignTheLabels(rendered)
            selection.remove(at: index)
        }
    }
    
}

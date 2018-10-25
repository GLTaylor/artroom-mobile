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

    @IBOutlet weak var artResults: UILabel!
    @IBOutlet weak var artImage: UIImageView!

   override func viewWillAppear(_ animated: Bool) {
    
    func assignTheLabels(_ artwork: Artwork) {
        self.artResults.text = artwork.title
        self.artImage.image = UIImage (named: artwork.image)
    }
    
    
    switch chosenArtAttributes.mood {
    case .happy:
        switch chosenArtAttributes.interest {
        case .cities:
            let artwork = Artwork(title: "Watching - Erin Nicholls", image: "erin nicholls")
            assignTheLabels(artwork)
            
        case .nature:
            let artwork = Artwork(title: "Fall Scene - John Smith", image: "nowhere")
            assignTheLabels(artwork)

        }
    case .sad:
        switch chosenArtAttributes.interest {
        case .cities:
            let artwork = Artwork(title: "Reflections - Erin Nicholls", image: "Reflections_nicholls")
            assignTheLabels(artwork)
            
        case .nature:
            let artwork = Artwork(title: "Norway Night - Sarah Hicks", image: "norway")
            assignTheLabels(artwork)
        }
        
     }
    }
    
    @IBAction func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }

}

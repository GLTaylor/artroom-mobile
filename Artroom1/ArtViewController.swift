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
    
    var chosenArtAttributes: HomeViewController.ArtAttributes!
//    var chosenMood: HomeViewController.Mood!
//    var chosenInterest: HomeViewController.Interest!

    @IBOutlet weak var artResults: UILabel!
    @IBOutlet weak var artImage: UIImageView!

   override func viewWillAppear(_ animated: Bool) {
    switch chosenArtAttributes.mood {
    case .happy:
        switch chosenArtAttributes.interest {
        case .cities:
            self.artResults.text = "Late Night - Erin Nicholls"
            self.artImage.image = UIImage (named: "erin nicholls")
            
        case .nature:
            self.artResults.text = "Fall Scene - John Smith"
            self.artImage.image = UIImage (named: "nowhere")


        }
    case .sad:
        switch chosenArtAttributes.interest {
        case .cities:
            self.artResults.text = "Reflections - Erin Nicholls"
            self.artImage.image = UIImage (named: "Reflections_nicholls")
            
        case .nature:
            self.artResults.text = "Norway Night - Sarah Hicks"
            self.artImage.image = UIImage (named: "norway")

        }
        
     }
    }
    
    @IBAction func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }

}

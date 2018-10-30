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

    
    var array_of_artworks = [
        (Artwork(title: "Watching - Erin Nicholls", image: "erin nicholls", attributes: ArtAttributes(mood: .happy, interest: .cities ))), (Artwork(title: "Fall Scene - John Smith", image: "nowhere", attributes: ArtAttributes(mood: .happy, interest: .nature))), (Artwork(title: "Mikhail - Annie Leibovitz", image: "Mikhail - Annie Leibovitz", attributes: ArtAttributes(mood: .happy, interest: .humanity))), (Artwork(title: "Reflections - Erin Nicholls", image: "Reflections_nicholls", attributes: ArtAttributes(mood: .sad, interest: .cities))), (Artwork(title: "Norway Night - Sarah Hicks", image: "norway", attributes: ArtAttributes(mood: .sad, interest: .nature))), (Artwork(title: "Diagonal of May 25 - Dan Flavin", image: "Diagonal of May 25 - Dan Flavin", attributes: ArtAttributes(mood: .sad, interest: .humanity))), (Artwork(title: "Melbourne - Erin Nicholls", image: "melbourne", attributes: ArtAttributes(mood: .meh, interest: .cities))), (Artwork(title: "Isle Saint-Michel - Elger Esser", image: "Isle Saint-Michel - Elger Esser", attributes: ArtAttributes(mood: .meh, interest: .nature))), (Artwork(title: "Studies of Hands - Alexander Maw", image: "Studies of Hands - Alexander Maw", attributes: ArtAttributes(mood: .meh, interest: .humanity))), (Artwork(title: "Poveglia - Elger Esser", image: "Poveglia - Elger Esser", attributes: ArtAttributes(mood: .meh, interest: .nature))), (Artwork(title: "Drifting - Anthony Goicolea", image: "Drifting - Anthony Goicolea", attributes: ArtAttributes(mood: .meh, interest: .nature))), (Artwork(title: "My parents with their grandson, Ross - Annie Leibovitz", image: "My parents with their grandson, Ross - Annie Leibovitz", attributes: ArtAttributes(mood: .happy, interest: .humanity))), (Artwork(title: "Class Picture - Anthony Goicolea", image: "Class Picture - Anthony Goicolea", attributes: ArtAttributes(mood: .happy, interest: .humanity)))
    ]
   override func viewWillAppear(_ animated: Bool) {
    
    func assignTheLabels(_ artwork: Artwork) {
        self.artResults.text = artwork.title
        self.artImage.image = UIImage (named: artwork.image)
    }
    
    let selection = array_of_artworks.filter { (Artwork) -> Bool in
        Artwork.attributes == chosenArtAttributes
    }
    
    let rendered = selection.randomElement()
    assignTheLabels(rendered!)
 
     }
    
    
    // need a button to do all of the above again
    
    @IBAction func renderAgain() {
        func assignTheLabels(_ artwork: Artwork) {
            self.artResults.text = artwork.title
            self.artImage.image = UIImage (named: artwork.image)
        }
        
        let selection = array_of_artworks.filter { (Artwork) -> Bool in
            Artwork.attributes == chosenArtAttributes
        }
        
        let rendered = selection.randomElement()
        assignTheLabels(rendered!)
        
    }

    @IBAction func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }

}

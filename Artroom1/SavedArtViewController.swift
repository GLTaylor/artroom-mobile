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
    var artOnDisplay: Artwork?
    
    @IBOutlet weak var savedArt: UIImageView?
    @IBOutlet weak var savedArtTitle: UILabel?
    
    
    func setCurrentArtwork(_ artwork: Artwork) {
        self.savedArtTitle!.text = artwork.title
        self.savedArt!.image = UIImage (named: artwork.image)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))
    }
    
    @objc func startOver() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        artOnDisplay = arrayOfSavedArt?.first
        setCurrentArtwork(artOnDisplay!)
    }
    
//   We don't want this, it actually re-renders the last VC, refreshing the art as well. Not good.
//    @IBAction func playAgain() {
//        self.dismiss(animated: true, completion: nil)
//    }
    
    
}

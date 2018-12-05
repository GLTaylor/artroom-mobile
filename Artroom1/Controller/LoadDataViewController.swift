//
//  LoadDataViewController.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 12/3/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation
import UIKit

class LoadDataViewController: UIViewController {
    let delay = 5 // seconds
    @IBOutlet var delayMessage: UILabel?
    @IBOutlet var reloadButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadButton?.isHidden = true
        ArtworksDatabase.shared.load(completionHandler: {(artworks, error)  in
            if artworks != nil {
                self.performSegue(withIdentifier: "Loaded", sender: self)
            } else {
                self.delayMessage?.text = "Error: \(error ?? "another error" as! Error)"
                self.reloadButton?.isHidden = false
            }
        })
        // Below only waits a certain amount of time and doesn't recognize errors per se, so I won't use it
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(delay)) {
//            self.delayMessage?.text = "This is taking a while, sorry"
//            self.reloadButton?.isHidden = false
//        }

    }
    
    // I am not sure this works because it doesn't make it to the else a second time.
    @IBAction func loadAgain() {
        ArtworksDatabase.shared.load(completionHandler: {(artworks, error)  in
            if artworks != nil {
                self.performSegue(withIdentifier: "Loaded", sender: self)
            } else {
                self.delayMessage?.text = "Error: \(error?.localizedDescription ?? "another error")"
                self.reloadButton?.isHidden = false
            }
        })
        viewDidLoad()
    }
    
}


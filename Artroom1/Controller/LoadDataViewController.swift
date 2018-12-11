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
<<<<<<< HEAD
    @IBOutlet var delayMessage: UILabel?
    @IBOutlet var reloadButton: UIButton?

=======
>>>>>>> external-JSON
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadButton?.isHidden = true
        ArtworksDatabase.shared.load(completionHandler: { artworks, error in
            if artworks != nil {
                self.performSegue(withIdentifier: "Loaded", sender: self)
            } else {
                self.delayMessage?.text = "Error: You may not be connected to wifi. \(error.debugDescription)"
                self.reloadButton?.isHidden = false
            }
        })
    }
<<<<<<< HEAD

    @IBAction func loadAgain() {
        ArtworksDatabase.shared.load(completionHandler: { artworks, error in
            if artworks != nil {
                self.performSegue(withIdentifier: "Loaded", sender: self)
            } else {
                self.delayMessage?.text = "Error: \(error?.localizedDescription ?? "another error")"
                self.reloadButton?.isHidden = false
            }
        })
        viewDidLoad()
    }
=======
>>>>>>> external-JSON
}

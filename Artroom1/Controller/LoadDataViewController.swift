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
        ArtworksDatabase.shared.load(completionHandler: {
            self.performSegue(withIdentifier: "Loaded", sender: self)
        })
        // If the page takes longer than 5 seconds to load, something likely went wrong and the option to try loading again will appear
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            self.delayMessage?.text = "This is taking a while, sorry"
            self.reloadButton?.isHidden = false
        }
    }
    
    @IBAction func loadAgain() {
        ArtworksDatabase.shared.load(completionHandler: {
            self.performSegue(withIdentifier: "Loaded", sender: self)
        })
        viewDidLoad()
    }
    
}


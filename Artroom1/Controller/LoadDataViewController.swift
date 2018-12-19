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
    @IBOutlet var delayMessage: UILabel?
    @IBOutlet var reloadButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadButton?.isHidden = true
        loadTheData()
    }

    @IBAction func loadTheData() {
        ArtworksDatabase.shared.load(completionHandler: { artworks, error in
            if artworks != nil {
                self.performSegue(withIdentifier: "Loaded", sender: self)
            } else {
                DispatchQueue.main.async {
                    self.delayMessage?.text = "Error: \(error?.localizedDescription ?? "another error")"
                    self.reloadButton?.isHidden = false
                }
            }
        })
    }
}

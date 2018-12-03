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

    override func viewDidLoad() {
        super.viewDidLoad()
        ArtworksDatabase.shared.load(completionHandler: {
            self.performSegue(withIdentifier: "Loaded", sender: self)
        })
    }
    
}

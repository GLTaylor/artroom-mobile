//
//  HomeViewController.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/17/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import UIKit

    
   class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var chooseSelf: UIPickerView!
    @IBOutlet weak var welcomeSign: UILabel!
    @IBOutlet weak var welcomeMessage: UILabel!
    
    var chosenThings: Int!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch (row, component) {
            // these need to go in order based on mood and interest structs, otherwise the data will be wonky (ie, if I set "death" to 3,1 I'd still get images for sexuality because that is the fourth interest in the struct)
        case (0, 0): return "joyful"
        case (1, 0): return "melancholy"
        case (0, 1): return "tech"
        case (1, 1): return "nature"
        case (2, 0): return "meh"
        case (2, 1): return "humanity"
        case (3, 0): return "wild"
        case (3, 1): return "sexuality"
            
        default: return "whoops"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackgrounds()
    }
    
    func assignbackgrounds(){
        let background = UIImage(named: "Artwall")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    @IBAction func seeArt() {
        let controller: ArtViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ArtViewController") as! ArtViewController

        controller.chosenArtAttributes = choosingAttributes()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    private func choosingAttributes() -> ArtAttributes {
        let moodIndex =  chooseSelf.selectedRow(inComponent: 0)
        let interestIndex = chooseSelf.selectedRow(inComponent: 1)
        let mood = Mood(rawValue: moodIndex)!
        let interest = Interest(rawValue: interestIndex)!
        let art = ArtAttributes(mood: mood, interest: interest)
        return art
    }
}


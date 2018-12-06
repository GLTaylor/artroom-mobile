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
    var moodTitles: [String]!
    var interestTitles: [String]!
    
    var chosenThings: Int!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let artworks = ArtworksDatabase.shared.arrayOfArtworks
        let moods = Set(artworks.map { (artwork) -> Mood in
            return artwork.attributes.mood
        })
            .sorted()
            .map(moodToString)
        
        moodTitles = moods
        
        let interests = Set(artworks.map { (artwork) -> Interest in
            return artwork.attributes.interest
        })
            .sorted()
            .map(interestToString)
        
        interestTitles = interests
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return moodTitles.count
        } else {
            return interestTitles.count
        }
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return moodTitles[row]
        } else {
            return interestTitles[row]
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
    
    func moodToString(_ mood: Mood) -> String {
        switch mood {
        case Mood.joyful:
            return "joyful"
        case .melancholy:
            return "melancholy"
        case .meh:
            return "meh"
        case .wild:
            return "wild"
        case .poetic:
            return "poetic"
        case .humorous:
            return "humorous"
        }
    }
    
    func interestToString(_ interest: Interest) -> String {
        switch interest {
        case .death:
            return "death"
        case .tech:
            return "tech"
        case .nature:
            return "nature"
        case .humanity:
            return "humanity"
        case .sexuality:
            return "sexuality"
        case .politics:
            return "politics"
        }
    }
}


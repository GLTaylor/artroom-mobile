//
//  HomeViewController.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/17/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet var chooseSelf: UIPickerView!
    @IBOutlet var welcomeSign: UILabel!
    @IBOutlet var welcomeMessage: UILabel!
<<<<<<< HEAD
    var moodTitles: [String]!
    var interestTitles: [String]!
    var chosenThings: Int!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let artworks = ArtworksDatabase.shared.arrayOfArtworks
        let moods = Set(artworks.map { (artwork) -> Mood in
            artwork.attributes.mood
        })
            .sorted()
            .map(moodToString)

        moodTitles = moods

        let interests = Set(artworks.map { (artwork) -> Interest in
            artwork.attributes.interest
        })
            .sorted()
            .map(interestToString)

        interestTitles = interests
    }

=======

    var chosenThings: Int!

>>>>>>> external-JSON
    func numberOfComponents(in _: UIPickerView) -> Int {
        return 2
    }

<<<<<<< HEAD
    func pickerView(_: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return moodTitles.count
        } else {
            return interestTitles.count
        }
    }

    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return moodTitles[row]
        } else {
            return interestTitles[row]
=======
    func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        return 4
    }

    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
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
>>>>>>> external-JSON
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackgrounds()
    }

    func assignbackgrounds() {
<<<<<<< HEAD
        let background = UIImage(named: "Artwall")
=======
        let background = UIImage(named: "polke_faded")
>>>>>>> external-JSON

        var imageView: UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }

    @IBAction func seeArt() {
        let controller: ArtViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ArtViewController") as! ArtViewController

        controller.chosenArtAttributes = choosingAttributes()
        navigationController?.pushViewController(controller, animated: true)
    }

    private func choosingAttributes() -> ArtAttributes {
        let moodIndex = chooseSelf.selectedRow(inComponent: 0)
        let interestIndex = chooseSelf.selectedRow(inComponent: 1)
        let mood = Mood(rawValue: moodIndex)!
        let interest = Interest(rawValue: interestIndex)!
        let art = ArtAttributes(mood: mood, interest: interest)
        return art
    }
<<<<<<< HEAD

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
=======
>>>>>>> external-JSON
}

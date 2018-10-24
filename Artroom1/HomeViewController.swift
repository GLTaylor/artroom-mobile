//
//  HomeViewController.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/17/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    enum Mood: Int {
        case happy
        case sad
    }
    
    enum Interest: Int {
        case cities
        case nature
    }
    
    struct ArtAttributes: Equatable {
        var mood: Mood
        var interest: Interest
    }
    
    
    @IBOutlet weak var chooseSelf: UIPickerView!
    
    var chosenThings: Int!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch (row, component) {
        case (0, 0): return "happy"
        case (1, 0): return "sad"
        case (0, 1): return "cities"
        case (1, 1): return "nature"
            
        default: return "whoops"
        }
    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        let mood =  [pickerView.selectedRow(inComponent: 0)]
//        let interest = [pickerView.selectedRow(inComponent: 1)]
//        chosenThings =   "\(mood) & \(interest)"
//    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        // Do any additional setup after loading the view.
    }
    
    func assignbackground(){
        let background = UIImage(named: "polke_faded")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    @IBAction func seeArt() {
        let controller: ArtViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ArtViewController") as! ArtViewController

        controller.chosenArtAttributes = choosingAttributes()
        present(controller, animated: true, completion: nil)
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


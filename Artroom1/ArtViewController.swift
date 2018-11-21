//
//  ArtViewController.swift
//  Artroom1
//
//  Created by Taylor Lindsay on 10/18/18.
//  Copyright © 2018 Taylor Lindsay at Babbel. All rights reserved.
//

import Foundation
import UIKit

var usersLikedArtworks: [Artwork] = []

class ArtViewController: UIViewController {
        
    var renderedForKeeping: Artwork?
    var chosenArtAttributes: ArtAttributes!

    @IBOutlet weak var artResults: UILabel!
    @IBOutlet weak var artImage: UIImageView!
    
    private var selection: [Artwork] = []
    private var animator: UIDynamicAnimator!
    private var snapping: UISnapBehavior!
   
    func setCurrentArtwork(_ artwork: Artwork) {
        self.artResults.text = artwork.title
        self.artImage.image = UIImage (named: artwork.image)
        renderedForKeeping = artwork
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: view)
        snapping = UISnapBehavior(item: artImage, snapTo: CGPoint(x: view.center.x, y: (view.center.y - 60) ))
        animator.addBehavior(snapping)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selection = ArtworksDatabase.shared.arrayOfArtworks.filter { (artwork: Artwork) -> Bool in
            artwork.attributes == chosenArtAttributes
        }
        renderFresh()
     }
    
     func renderFresh() {
        
        if selection.isEmpty {
            self.artResults.text = "No more art matches"
            self.artImage.image = UIImage (named: "Empty Frame")

        } else {
            renderNextArt()
        }
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        if  self.artResults.text == "No more art matches" {
            recognizer.isEnabled = false
        } else {
            switch recognizer.state {
            case .began, .changed:
                animator.removeBehavior(snapping)
            case .ended, .cancelled, .failed:
                animator.addBehavior(snapping)
                if(artImage.center.x > view.center.x) {
                    usersLikedArtworks.append(renderedForKeeping!)
                    NSLog("gesture went right and sample array should grow");
                    print(usersLikedArtworks)
                    Toast.show(message: "Saved!", controller: self)
                    renderFresh()
                } else {
                    renderFresh()
                    NSLog("gesture went left");
                    }
            case .possible:
                break
                }
            }
        }

 
    @IBAction func playAgain() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet var seeSavedArtButton: UIButton? 
    @IBAction func seeSavedArt() {
        let controller: SavedArtViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "SavedArtViewController") as! SavedArtViewController
    
        controller.arrayOfSavedArt = usersLikedArtworks
        self.navigationController?.pushViewController(controller, animated: true)
//        present(controller, animated: true, completion: nil)
    }


    private func renderNextArt() {
        if usersLikedArtworks == [] {
            seeSavedArtButton?.isEnabled = false
        } else {
            seeSavedArtButton?.isEnabled = true
        }
        if let rendered = selection.randomElement(), let index = selection.firstIndex(of: rendered)  {
            setCurrentArtwork(rendered)
            selection.remove(at: index)
        }
    }
    

}


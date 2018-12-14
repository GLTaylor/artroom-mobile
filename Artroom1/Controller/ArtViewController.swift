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
    var task: URLSessionTask?

    @IBOutlet var artResults: UILabel!
    @IBOutlet var artImage: UIImageView!

    private var selection: [Artwork] = []
    private var animator: UIDynamicAnimator!
    private var snapping: UISnapBehavior!

    var selectedIndex: Int!

    func setCurrentArtwork(_ artwork: Artwork) {
        artResults.text = artwork.title
        // instead of assigning an outlet like above, here below I'm calling a function to do that - which assigns artImage and returns nothing
        loadImageFromURL(artwork.image.url)
        renderedForKeeping = artwork
    }

    func loadImageFromURL(_ givenurl: String) {
        guard let url = URL(string: givenurl) else {
            return
        }
        task?.cancel()
        task = URLSession.shared.dataTask(with: url) { place, _, _ in
            guard let place = place else {
                print("location went wrong")
                return
            }
            let image = UIImage(data: place)
            DispatchQueue.main.async {
                self.artImage.image = image
            }
        }
        task!.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: view)
        snapping = UISnapBehavior(item: artImage, snapTo: CGPoint(x: view.center.x, y: (view.center.y - 60)))
        animator.addBehavior(snapping)
        selection = ArtworksDatabase.shared.arrayOfArtworks.filter { (artwork: Artwork) -> Bool in
            artwork.attributes == chosenArtAttributes
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        renderFresh()
    }

    func renderFresh() {
        enablesSavedArtsButtonIfNeeded()

        if selection.isEmpty {
            artResults.text = "No more art matches"
            artImage.image = UIImage(named: "Empty Frame")

        } else {
            renderNextArt()
        }
    }

    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: view)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x,
                                  y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: view)

        if artResults.text == "No more art matches" {
            recognizer.isEnabled = false
        } else {
            switch recognizer.state {
            case .began, .changed:
                animator.removeBehavior(snapping)
            case .ended, .cancelled, .failed:
                animator.addBehavior(snapping)
                if artImage.center.x > view.center.x {
                    if !usersLikedArtworks.contains(renderedForKeeping!) {
                        usersLikedArtworks.append(renderedForKeeping!)
                    }
                    print(usersLikedArtworks)
                    Toast.show(message: "Saved!", controller: self)

                    selection.remove(at: selectedIndex)
                    renderFresh()
                } else {
                    selection.remove(at: selectedIndex)
                    renderFresh()
                    NSLog("gesture went left")
                }
            case .possible:
                break
            }
        }
    }

    @IBOutlet var seeSavedArtButton: UIButton?

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        let controller = segue.destination as! SavedArtViewController
        if segue.identifier == "ShowSaved" {
            controller.arrayOfSavedArt = usersLikedArtworks
        }
    }

    private func renderNextArt() {
        enablesSavedArtsButtonIfNeeded()
        if let randomArtwork = selection.randomElement(), let index = selection.firstIndex(of: randomArtwork) {
            selectedIndex = index
            setCurrentArtwork(randomArtwork)
        }
    }

    func enablesSavedArtsButtonIfNeeded() {
        if usersLikedArtworks == [] {
            seeSavedArtButton?.isEnabled = false
        } else {
            seeSavedArtButton?.isEnabled = true
        }
    }
}

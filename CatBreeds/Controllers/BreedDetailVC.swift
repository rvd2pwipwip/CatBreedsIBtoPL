//
//  BreedDetailVC.swift
//  CatBreeds
//
//  Created by Joshua Adams on 2/17/18.
//  Copyright © 2018 Josh Adams. All rights reserved.
//

import UIKit

class BreedDetailVC: UIViewController, UITextViewDelegate {
  private var breed: Breed!

  var breedDetailView: BreedDetailView {
    return view as! BreedDetailView
  }

  override func loadView() {
    title = breed.name
    let breedDetailView = BreedDetailView(frame: UIScreen.main.bounds)
    breedDetailView.fullDescription.text = breed.fullDescription
    breedDetailView.fullDescription.delegate = self
    breedDetailView.photo.image = breed.photo
    view = breedDetailView
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    breedDetailView.hide()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    breedDetailView.fullDescription.setContentOffset(.zero, animated: false)
    breedDetailView.unhide()
  }

  class func getViewController(breed: Breed) -> BreedDetailVC {
    let breedDetailVC = BreedDetailVC()
    breedDetailVC.breed = breed
    return breedDetailVC
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let y = breedDetailView.fullDescription.contentOffset.y
    if y < BreedDetailView.initialPhotoHeightWidth {
      breedDetailView.updatePhotoSize(heightWidth: BreedDetailView.initialPhotoHeightWidth - y)
    } else {
      breedDetailView.updatePhotoSize(heightWidth: 0.0)
    }
  }
}

//class BreedDetailVC: UIViewController, UITextViewDelegate {
//  @IBOutlet var photo: UIImageView!
//  @IBOutlet var fullDescription: UITextView!
//  @IBOutlet var photoWidthConstraint: NSLayoutConstraint!
//  @IBOutlet var photoHeightConstraint: NSLayoutConstraint!
//  private let initialPhotoSize: CGFloat = 180.0
//
//  private var breed: Breed!
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    fullDescription.delegate = self
//  }
//
//  override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    photo.image = breed.photo
//    fullDescription.text = breed.fullDescription
//    title = breed.name
//  }
//
//  class func getViewController(breed: Breed) -> BreedDetailVC {
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    guard let viewController = storyboard.instantiateViewController(withIdentifier: "\(BreedDetailVC.self)") as? BreedDetailVC else {
//      fatalError("Could not load \(BreedDetailVC.self) from storybard.")
//    }
//    viewController.breed = breed
//    return viewController
//  }
//
//  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    let y = fullDescription.contentOffset.y
//    if y < initialPhotoSize {
//      photoWidthConstraint.constant = initialPhotoSize - y
//      photoHeightConstraint.constant = initialPhotoSize - y
//    } else {
//      photoWidthConstraint.constant = 0
//      photoHeightConstraint.constant = 0
//    }
//  }
//}

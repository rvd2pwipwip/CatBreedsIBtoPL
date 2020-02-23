//
//  BreedDetailView.swift
//  CatBreeds
//
//  Created by Herve Desrosiers on 2020-02-23.
//  Copyright © 2020 Josh Adams. All rights reserved.
//

import UIKit

//class BreedDetailView: UIView {
//  required init(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented.")
//  }
//
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//  }
//}

class BreedDetailView: UIView {
  @UsesAutoLayout
  internal var photo: UIImageView = {
    let photo = UIImageView()
    photo.contentMode = .scaleAspectFit
    return photo
  } ()

  @UsesAutoLayout
  internal var fullDescription: UITextView = {
    let fullDescription = UITextView()
    fullDescription.textColor = Colors.white
    fullDescription.backgroundColor = Colors.blackish
    fullDescription.font = Fonts.body
    fullDescription.bounces = false
    return fullDescription
  } ()

  // 0
  internal static let initialPhotoHeightWidth: CGFloat = 180.0
  private var photoHeight: NSLayoutConstraint?
  private var photoWidth: NSLayoutConstraint?

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented.")
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = Colors.blackish
    addSubview(photo)
    addSubview(fullDescription)
    photo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).activate()
    photo.centerXAnchor.constraint(equalTo: centerXAnchor).activate()
    // 1
    photoHeight = photo.heightAnchor.constraint(equalToConstant: BreedDetailView.initialPhotoHeightWidth)
    photoHeight?.activate()
    photoWidth = photo.widthAnchor.constraint(equalToConstant: BreedDetailView.initialPhotoHeightWidth)
    photoWidth?.activate()
    fullDescription.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: Padding.standard).activate()
    fullDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).activate()
    fullDescription.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
    fullDescription.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
  }

  // 2
  internal func updatePhotoSize(heightWidth: CGFloat) {
    photoWidth?.constant = heightWidth
    photoHeight?.constant = heightWidth
  }

  // 3
  internal func hide() {
    photo.isHidden = true
    fullDescription.isHidden = true
  }

  internal func unhide() {
    photo.isHidden = false
    fullDescription.isHidden = false
  }
}

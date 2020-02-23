//
//  NSLayoutConstraintExtension.swift
//  CatBreeds
//
//  Created by Herve Desrosiers on 2020-02-23.
//  Copyright © 2020 Josh Adams. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
  @discardableResult func activate() -> NSLayoutConstraint {
    isActive = true
    return self
  }
}

//
//  UsesAutoLayout.swift
//  CatBreeds
//
//  Created by Herve Desrosiers on 2020-02-23.
//  Copyright © 2020 Josh Adams. All rights reserved.
//

import UIKit

@propertyWrapper
public struct UsesAutoLayout<T: UIView> {
  public var wrappedValue: T {
    didSet {
      wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
  }

  public init(wrappedValue: T) {
    self.wrappedValue = wrappedValue
    wrappedValue.translatesAutoresizingMaskIntoConstraints = false
  }
}

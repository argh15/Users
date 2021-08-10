//
//  Dynamic.swift
//  Users
//
//  Created by Arghadeep Chakraborty on 10/08/21.
//

import Foundation

class Dynamic<T> {
    
  typealias Listener = (T) -> Void
  var listener: Listener?
  
  func bind(listener: Listener?) {
    self.listener = listener
  }
  
  var value: T {
    didSet {
      listener?(value)
    }
  }
  
  init(_ v: T) {
    value = v
  }
}

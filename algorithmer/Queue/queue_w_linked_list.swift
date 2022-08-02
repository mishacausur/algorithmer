//
//  queue_w_linked_list.swift
//  algorithmer
//
//  Created by Misha Causur on 31.07.2022.
//

import Foundation

public class DNode<T> {
  
  public var value: T
  public var next: DNode<T>?
  public var previous: DNode<T>?
  
  public init(value: T) {
    self.value = value
  }
}

extension DNode: CustomStringConvertible {
  
  public var description: String {
    String(describing: value)
  }
}

//
//  double_linked_list.swift
//  algorithmer
//
//  Created by Misha Causur on 03.08.2022.
//

import Foundation

public class DoubleLinkedList<T> {
  
  private var head: DNode<T>?
  private var tail: DNode<T>?
  
  public init() { }
  
  public var isEmpty: Bool {
    head == nil
  }
  
  public var first: DNode<T>? {
    head
  }
  
  public func append(_ value: T) {
    let newNode = DNode(value: value)
    
    guard let tailNode = tail else {
      head = newNode
      tail = newNode
      return
    }
    
    newNode.previous = tailNode
    tailNode.next = newNode
    tail = newNode
  }
  
  public func remove(_ node: DNode<T>) -> T {
    let prev = node.previous
    let next = node.next
    
    if let prev = prev {
      prev.next = next
    } else {
      head = next
    }
    
    next?.previous = prev
    
    if next == nil {
      tail = prev
    }
    
    node.previous = nil
    node.next = nil
    
    return node.value
  }
}

extension DoubleLinkedList: CustomStringConvertible {
  
  public var description: String {
    var string = ""
    var current = head
    while let node = current {
      string.append("\(node.value) -> ")
      current = node.next
    }
    return string + "end"
  }
}

public class LinkedListIterator<T>: IteratorProtocol {
  
  private var current: DNode<T>?
  
  init(node: DNode<T>?) {
    current = node
  }
  
  public func next() -> DNode<T>? {
    defer { current = current?.next }
    return current
  }
}

extension DoubleLinkedList: Sequence {
  
  public func makeIterator() -> LinkedListIterator<T> {
    LinkedListIterator(node: head)
  }
}

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

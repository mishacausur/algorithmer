//
//  linked_list.swift
//  algorithmer
//
//  Created by Misha Causur on 28.07.2022.
//

import Foundation

public class Node<Value> {
    
    public var value: Value
    
    public var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    
    public var tail: Node<Value>?
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public init() {}
    
    /// COW implementation
    private mutating func copy() {
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode?.next = Node(value: nextOldNode.value)
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
    
    private mutating func copy(returningCopyOf node: Node<Value>?) -> Node<Value>? {
      guard !isKnownUniquelyReferenced(&head) else {
        return nil
      }
      guard var oldNode = head else {
        return nil
      }

      head = Node(value: oldNode.value)
      var newNode = head
      var nodeCopy: Node<Value>?

      while let nextOldNode = oldNode.next {
        if oldNode === node {
          nodeCopy = newNode
        }
        newNode!.next = Node(value: nextOldNode.value)
        newNode = newNode!.next
        oldNode = nextOldNode
      }

      return nodeCopy
    }
    
    /// O(1)
    public mutating func push(_ value: Value) {
        copy()
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// O(1)
    public mutating func append(_ value: Value) {
        copy()
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    /// O(n), where n = given index
    public func node(_ index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    /// O(1)
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        copy()
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
        
    }
    
    /// O(1)
    @discardableResult
    public mutating func pop() -> Value? {
        copy()
        head = head?.next
        if isEmpty {
            tail = nil
        }
        return head?.value
    }
    
    /// O(n)
    @discardableResult
    public mutating func removeLast() -> Value? {
        copy()
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var previous = head
        var current = head
        
        while let next = current.next {
            previous = current
            current = next
        }
        
        previous.next = nil
        tail = previous
        return current.value
    }
    
    @discardableResult
    public mutating func removeAfter(_ node: Node<Value>) -> Value? {
        guard let node = copy(returningCopyOf: node) else { return nil }
          defer {
            if node.next === tail {
              tail = node
            }
            node.next = node.next?.next
          }
          return node.next?.value
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty Linked List"
        }
        return String(describing: head)
    }
}

extension LinkedList: Collection {
   
    public var startIndex: Index {
       Index(node: head)
    }
    
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        position.node!.value
    }
    
    public struct Index: Comparable {
       
        public var node: Node<Value>?
        
        public static func == (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            
            switch (lhs.node, rhs.node) {
                
            case let (left?, right?):
                return left.next === right.next
                
            case (nil, nil):
                return true
                
            default:
                return false
            }
        }
        
        public static func < (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            
            guard lhs != rhs else {
                return false
            }
            
            let nodes = sequence(first: lhs.node) { $0?.next }
            
            return nodes.contains { $0 === rhs.node }
        }
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
           return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

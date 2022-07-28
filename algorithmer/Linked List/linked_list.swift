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
    
    public mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
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

extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
           return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

extension Example {
    func nodeExample() {
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        
        node1.next = node2
        node2.next = node3
        
        print(node1)
    }
   
}

//
//  linked_list_challenges.swift
//  algorithmer
//
//  Created by Misha Causur on 30.07.2022.
//

import Foundation

extension Challenges {
    /// task 1
    /// O(n)
    func printInReverse<T>(_ list: LinkedList<T>) {
        printInReverse(list.head)
    }
    
    private func printInReverse<T>(_ node: Node<T>?) {
        guard let node = node else {
            return
        }
        printInReverse(node.next)
        print(node.value)
    }
    /// O(n)
    func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
        var fast = list.head
        var slow = list.head
        
        while let newFast = fast?.next {
            fast = newFast.next
            slow = slow?.next
        }
        
        return slow
    }
    
    func reverse<T>(_ list: LinkedList<T>) -> LinkedList<T> {
        var linkedList = LinkedList<T>()
        var head = list.head
        while head != nil {
            linkedList.push(head!.value)
            head = head?.next
        }
        return linkedList
    }
    
    func merge<T: Comparable>(_ llist: LinkedList<T>, _ rlist: LinkedList<T>) -> LinkedList<T> {
        var left = llist.head
        var right = rlist.head
        var newList = LinkedList<T>()
        while let leftNode = left, let rightNode = right {
            if leftNode.value <= rightNode.value {
                newList.append(leftNode.value)
                left = leftNode.next
            } else if leftNode.value > rightNode.value {
                newList.append(rightNode.value)
                right = rightNode.next
            }
        }
        if let leftNode = left {
            newList.tail?.next = leftNode
        }
        if let rightNode = right {
            newList.tail?.next = rightNode
        }
        return newList
    }
    
    func mergeBook<T: Comparable>(_ left: LinkedList<T>,
                                  _ right: LinkedList<T>) -> LinkedList<T> {
        guard !left.isEmpty else {
            return right
        }
        
        guard !right.isEmpty else {
            return left
        }
        
        var newHead: Node<T>?
        var tail: Node<T>?
        
        var currentLeft = left.head
        var currentRight = right.head
        
        if let leftNode = currentLeft, let rightNode = currentRight {
            if leftNode.value < rightNode.value {
                newHead = leftNode
                currentLeft = leftNode.next
            } else {
                newHead = rightNode
                currentRight = rightNode.next
            }
            tail = newHead
        }
        
        while let leftNode = currentLeft, let rightNode = currentRight {
            if leftNode.value < rightNode.value {
                tail?.next = leftNode
                currentLeft = leftNode.next
            } else {
                tail?.next = rightNode
                currentRight = rightNode.next
            }
            tail = tail?.next
        }
        
        if let leftNodes = currentLeft {
            tail?.next = leftNodes
        }
        
        if let rightNodes = currentRight {
            tail?.next = rightNodes
        }
        
        var list = LinkedList<T>()
        list.head = newHead
        list.tail = {
            while let next = tail?.next {
                tail = next
            }
            return tail
        }()
        return list
    }
}

extension LinkedList {
    
    mutating func reverse() {
        var temp = LinkedList<Value>()
        for value in self {
            temp.push(value)
        }
        head = temp.head
    }
    
    mutating func cheapReverse() {
        tail = head
        var previous = head
        var current = head?.next
        previous?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }
        
        head = previous
    }
    
    mutating func removeAll(_ value: Value) where Value: Equatable {
        var current = head
        while tail?.next != nil {
            if current?.value == value {
                current = current?.next
            }
        }
    }
}

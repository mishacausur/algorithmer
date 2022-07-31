//
//  linked_list_examples.swift
//  algorithmer
//
//  Created by Misha Causur on 30.07.2022.
//

import Foundation

extension Example {
    func nodeExample() {
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        
        node1.next = node2
        node2.next = node3
        
        print(node1)
    }
   
    func nodeExample2() {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        
        print(linkedList)
    }
    
    func nodeExample3() {
       var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        
        print(linkedList)
    }
    
    func nodeExample4() {
       var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.append(3)
        print(linkedList.node(6))
    }
    
    func nodeExample5() {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        
        print("Before insert: \(linkedList)")
        var middle = linkedList.node(1)!
        for _ in 1...4 {
            middle = linkedList.insert(-1, after: middle)
        }
        print("After insert: \(linkedList)")
    }
    
    func nodeExample6() {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        print("Before pop: ", linkedList)
        linkedList.pop()
        print("After pop: ", linkedList)
    }
    
    func nodeExample7() {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        
        print("Before remove: \(linkedList)")
        let removed = linkedList.removeLast()
        
        print("After remove: \(linkedList)")
        print("Removed value: " + String(describing: removed))
    }
    
    func nodeExample8() {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)

          print("Before remove: \(linkedList)")
          let index = 1
          let node = linkedList.node(index - 1)!
          let removed = linkedList.removeAfter(node)

          print("After remove at \(index): \(linkedList)")
          print("Removed value: " + String(describing: removed))
    }
    
    func nodeExample9() {
        var linkedList = LinkedList<Int>()
          for i in 0...9 {
              linkedList.append(i)
          }

          print("linkedList: \(linkedList)")
          print("First element: \(linkedList[linkedList.startIndex])")
          print("Array containing first 3 elements: \(Array(linkedList.prefix(3)))")
          print("Array containing last 3 elements: \(Array(linkedList.suffix(3)))")

          let sum = linkedList.reduce(0, +)
          print("Sum of all values: \(sum)")
    }
    
    func nodeExample10() {
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        print("linkedList uniquely referenced: \(isKnownUniquelyReferenced(&linkedList.head))")
        var linkedList2 = linkedList
        print("linkedList: \(linkedList)")
        print("linkedList2: \(linkedList2)")
        
        print("After mutating")
        print("linkedList uniquely referenced: \(isKnownUniquelyReferenced(&linkedList.head))")
        linkedList2.append(3)
        print("linkedList: \(linkedList)")
        print("linkedList2: \(linkedList2)")
    }
}

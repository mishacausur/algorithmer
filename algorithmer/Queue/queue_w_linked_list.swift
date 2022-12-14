//
//  queue_w_linked_list.swift
//  algorithmer
//
//  Created by Misha Causur on 31.07.2022.
//

import Foundation

public class QueueLinkedList<T>: Queue {
    private var list = DoubleLinkedList<T>()
    public init() {}
    /// O(1)
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    /// O(1)
    public func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else {
            return nil
        }
        return list.remove(element)
    }
    
    public var peek: T? {
        list.first?.value
    }
    
    public var isEmpty: Bool {
        list.isEmpty
    }
}

extension QueueLinkedList: CustomStringConvertible {
    public var description: String {
        String(describing: list)
    }
}

extension Example {
    func queueExample1() {
        var queue = QueueLinkedList<String>()
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")
        print(queue)
        queue.dequeue()
        print(queue)
        print(queue.peek)
    }
}

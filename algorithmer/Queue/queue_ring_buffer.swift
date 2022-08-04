//
//  queue_ring_buffer.swift
//  algorithmer
//
//  Created by Misha Causur on 04.08.2022.
//

import Foundation

public struct QueueRBuffer<T>: Queue {
   
    private var buffer: RingBuffer<T>
    
    public init(count: Int) {
        buffer = .init(count: count)
    }
    
    public var isEmpty: Bool {
        buffer.isEmpty
    }
    
    public var peek: T? {
        buffer.first
    }
    /// O(1)
    public mutating func enqueue(_ element: T) -> Bool {
        buffer.write(element)
    }
    /// O(1)
    public mutating func dequeue() -> T? {
        buffer.read()
    }
}

extension QueueRBuffer: CustomStringConvertible {
    public var description: String {
        String(describing: buffer)
    }
}

extension Example {
    func queueRBExample() {
        var queue = QueueRBuffer<String>(count: 10)
        queue.enqueue("Ray")
        queue.enqueue("Brian")
        queue.enqueue("Eric")
        print(queue)
        queue.dequeue()
        print(queue)
        print(queue.peek)
    }
}

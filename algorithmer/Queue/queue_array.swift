//
//  queue_array.swift
//  algorithmer
//
//  Created by Misha Causur on 31.07.2022.
//

import Foundation

public struct QueueArray<T>: Queue {
    
    public typealias Element = T
    
    public var isEmpty: Bool {
        array.isEmpty
    }
    public var peek: Element? {
        array.first
    }
    private var array: [T] = []
    
    public init() {}
    
    /// O(1) (O(n) if array is already full and needed to copy all of the elements to get more space (x2))
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    /// O(n)
    public mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
}

extension QueueArray: CustomStringConvertible {
    public var description: String {
        String(describing: array)
    }
}

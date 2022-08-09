//
//  queue_double_stack.swift
//  algorithmer
//
//  Created by Misha Causur on 05.08.2022.
//

import Foundation

public struct QueueStack<T>: Queue {
    
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public var isEmpty: Bool {
        leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        !leftStack.isEmpty ? leftStack.last : rightStack.first
    }
    
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
    public init() {}
}

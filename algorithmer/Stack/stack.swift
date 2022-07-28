//
//  stack.swift
//  algorithmer
//
//  Created by Misha Causur on 28.07.2022.
//

import Foundation

public struct Stack<Element> {
    
    private var storage: [Element] = .init()
    
    public var isEmpty: Bool {
        peek() == nil
    }
    
    public init() {}
    
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
}

extension Stack: CustomDebugStringConvertible {
    
    public var debugDescription: String {
        """
            --- TOP ---
            \(storage.map { " \($0) " }.reversed().joined(separator: "\n"))
            --- END ---
        """
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}

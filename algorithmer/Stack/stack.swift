//
//  stack.swift
//  algorithmer
//
//  Created by Misha Causur on 28.07.2022.
//

import Foundation

public struct Stack<Element> {
    
    private var storage: [Element] = .init()
    
    public init() {}
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
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

//
//  binary_tree.swift
//  algorithmer
//
//  Created by Misha Causur on 18.08.2022.
//

import Foundation

public class BinaryNode<Element> {
    public var value: Element
    public var left: BinaryNode?
    public var right: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

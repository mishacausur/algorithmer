//
//  tree.swift
//  algorithmer
//
//  Created by Misha Causur on 09.08.2022.
//

import Foundation

public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}

extension Example {
    func treeExample() {
        let beverages = TreeNode("BEVERAGES")
        let hot = TreeNode("HOT")
        let cold = TreeNode("COLD")
        
        beverages.add(hot)
        beverages.add(cold)
    }
}

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

extension TreeNode {
    public func depthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        children.forEach {
            $0.depthFirst(visit: visit)
        }
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
    
    func treeExample2() {
        let tree = makeBeverageTree()
        tree.depthFirst { print($0.value) }
    }
    
    func makeBeverageTree() -> TreeNode<String> {
      let tree = TreeNode("Beverages")

      let hot = TreeNode("hot")
      let cold = TreeNode("cold")

      let tea = TreeNode("tea")
      let coffee = TreeNode("coffee")
      let chocolate = TreeNode("cocoa")

      let blackTea = TreeNode("black")
      let greenTea = TreeNode("green")
      let chaiTea = TreeNode("chai")

      let soda = TreeNode("soda")
      let milk = TreeNode("milk")

      let gingerAle = TreeNode("ginger ale")
      let bitterLemon = TreeNode("bitter lemon")

      tree.add(hot)
      tree.add(cold)

      hot.add(tea)
      hot.add(coffee)
      hot.add(chocolate)

      cold.add(soda)
      cold.add(milk)

      tea.add(blackTea)
      tea.add(greenTea)
      tea.add(chaiTea)

      soda.add(gingerAle)
      soda.add(bitterLemon)

      return tree
    }
}

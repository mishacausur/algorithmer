//
//  tree.swift
//  algorithmer
//
//  Created by Misha Causur on 09.08.2022.
//

import Foundation

public class TreeNode<T> {
    public typealias NodeClosure = (TreeNode) -> Void
    
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
    public func depthFirst(visit: NodeClosure) {
        visit(self)
        children.forEach {
            $0.depthFirst(visit: visit)
        }
    }
    
    public func levelOrder(visit: NodeClosure) {
        visit(self)
        var queue = QueueStack<TreeNode>()
        children.forEach { queue.enqueue($0) }
        while let node = queue.dequeue() {
            visit(node)
            node.children.forEach { queue.enqueue($0) }
        }
    }
}

extension TreeNode where T: Equatable {
    public func search(_ value: T) -> TreeNode? {
        var result: TreeNode?
        levelOrder {
            if $0.value == value {
                result = $0
            }
        }
        return result
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
    
    func treeExample3() {
       let tree = makeBeverageTree()
        if let search = tree.search("ginger ale") {
            print("Node is found: \(search.value)")
        }
        
        if let search = tree.search("chocolate milk") {
            print("Node is found: \(search.value)")
        } else {
            print("chocolate mils ain't found")
        }
    }
}

extension Challenges {
    /// task 1
    
    func treeTask1<T>(_ value: T) {
        ///1 level
        let tree = TreeNode(15)
        
        ///2 level
        let one = TreeNode(1)
        tree.add(one)

        let seventeen = TreeNode(17)
        tree.add(seventeen)

        let twenty = TreeNode(20)
        tree.add(twenty)
        
        /// 3 level
        let one2 = TreeNode(1)
        let five = TreeNode(5)
        let zero = TreeNode(0)
        one.add(one2)
        one.add(five)
        one.add(zero)

        let two = TreeNode(2)
        seventeen.add(two)

        let five2 = TreeNode(5)
        let seven = TreeNode(7)
        twenty.add(five2)
        twenty.add(seven)
        var stack = QueueStack<Int>()
        rrr(tree: tree, stack: &stack)
        
        while let node = stack.dequeue() {
            print(node)
        }
    }
    
    func rrr<T>(tree: TreeNode<T>, stack: inout QueueStack<T>) {
        stack.enqueue(tree.value)
        tree.children.forEach { rrr(tree: $0, stack: &stack) }
    }
}

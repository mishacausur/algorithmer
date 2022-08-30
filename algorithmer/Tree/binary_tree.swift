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

extension BinaryNode: CustomStringConvertible {
    
    public var description: String {
        diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.right,
                       top + " ", top + "┌──", top + "│ ")
        + root + "\(node.value)\n"
        + diagram(for: node.left,
                  bottom + "│ ", bottom + "└──", bottom + " ")
    }
}
extension BinaryNode {

  public func traverseInOrder(visit: (Element) -> Void) {
    left?.traverseInOrder(visit: visit)
    visit(value)
    right?.traverseInOrder(visit: visit)
  }
}

extension Example {
    func binaryNodeExample() {
        var tree: BinaryNode<Int> = {
          let zero = BinaryNode(value: 0)
          let one = BinaryNode(value: 1)
          let five = BinaryNode(value: 5)
          let seven = BinaryNode(value: 7)
          let eight = BinaryNode(value: 8)
          let nine = BinaryNode(value: 9)

          seven.left = one
          one.left = zero
          one.right = five
          seven.right = nine
          nine.left = eight

          return seven
        }()
    }
}

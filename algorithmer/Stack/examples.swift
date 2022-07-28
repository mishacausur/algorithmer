//
//  examples.swift
//  algorithmer
//
//  Created by Misha Causur on 28.07.2022.
//

import Foundation

final class Example {
    
    var stack = Stack<Int>()
    
    func stackExample() {
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
        
        print(stack)
        
        if let poppedElement = stack.pop() {
            assert(4 == poppedElement)
            print("Popped: \(poppedElement)")
          }
    }
    
}

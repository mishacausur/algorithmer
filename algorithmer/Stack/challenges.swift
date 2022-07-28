//
//  challenges.swift
//  algorithmer
//
//  Created by Misha Causur on 28.07.2022.
//

import Foundation

final class Challenges {
  /// Stack task 1
    let array: [Int] = [1, 2, 3, 4, 5]
   
    
    func task1<T>(_ array: [T]) {
        var stack = Stack<T>()
        for item in array {
            stack.push(item)
        }
        while !stack.isEmpty {
            print(stack.pop())
        }
    }
    
    /// Stack task 2
    var testString1 = "h((e))llo(world)()"
    
    func task2(_ string: String) -> Bool {
        var stack = Stack<Character>()
        for character in string {
            if character == "(" {
                stack.push(character)
            } else if character == ")" {
                if stack.isEmpty {
                    return false
                } else {
                    stack.pop()
                }
            }
        }
        return stack.isEmpty
    }
}

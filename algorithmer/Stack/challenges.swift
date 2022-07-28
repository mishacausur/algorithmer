//
//  challenges.swift
//  algorithmer
//
//  Created by Misha Causur on 28.07.2022.
//

import Foundation

final class Challenges {
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
}

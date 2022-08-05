//
//  queue_double_stack.swift
//  algorithmer
//
//  Created by Misha Causur on 05.08.2022.
//

import Foundation

public struct QueueStack<T>: Queue {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    public init() {}
}

//
//  ring_buffer.swift
//  algorithmer
//
//  Created by Misha Causur on 04.08.2022.
//

import Foundation

public struct RingBuffer<T> {
    
    private var array: [T?]
    private var indexRead = 0
    private var indexWrite = 0
    private var availableReadingSpace: Int {
        return indexWrite - indexRead
    }
    private var availableWritingSpace: Int {
        return array.count - indexRead
    }
    public var first: T? {
        array[indexRead]
    }
    public var isEmpty: Bool {
        availableReadingSpace == 0
    }
    public var isFull: Bool {
        availableWritingSpace == 0
    }
    
    public init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    public mutating func write(_ element: T) -> Bool {
        guard !isFull else { return false }
        array[indexWrite % array.count] = element
        indexWrite += 1
        return true
    }
    
    public mutating func read() -> T? {
        guard !isEmpty else { return nil }
        let element = array[indexRead % array.count]
        indexRead += 1
        return element
    }
}

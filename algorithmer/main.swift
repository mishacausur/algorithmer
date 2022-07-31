//
//  main.swift
//  algorithmer
//
//  Created by Misha Causur on 28.07.2022.
//

import Foundation

let example = Example()
//example.stackExample()
//example.nodeExample10()


let changelles = Challenges()
//changelles.task1(changelles.array)
//print(changelles.task2(changelles.testString1))


var list = LinkedList<Int>()
list.push(5)
list.push(4)
list.push(3)
list.push(3)
list.push(1)
print(list)
list.removeAll(3)
print(list)

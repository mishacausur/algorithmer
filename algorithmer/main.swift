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
list.push(10)
list.push(8)
list.push(6)

list.push(4)

list.push(2)

print(list)
var list2 = LinkedList<Int>()
list2.push(5)
list2.push(3)
list2.push(1)
print(list2)

let list3 = changelles.merge(list, list2)
print(list3)
let list4 = changelles.mergeBook(list, list2)
print(list4)

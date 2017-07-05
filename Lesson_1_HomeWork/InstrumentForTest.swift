//
//  InstrumentForTest.swift
//  Lesson_1_HomeWork
//
//  Created by Yaroslav Surovtsev on 05.07.17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

struct InstrumentForTest {
    
    private let elementCount = 1_000_000
    private let newElement = 1
    private var array: [Int] = []
    private var set = Set<Int>()
    private var dictionary: [Int: Int] = [:]
    
    mutating func beginTest() {
        insertValueAtBeginArray()
        insertValueInMiddleArray()
        insertValueAtEndArray()
        insertSameValueInSet()
        insertDifferentValueInSet()
        insertSameValueInDictionary()
        insertDifferentValueInDictionary()
        removeArray()
        removeSet()
        removeDictionary()
    }
    
    private func printInterval(timeBefore: Date, timeAfter: Date, description: String) {
        print("\(timeAfter.timeIntervalSince(timeBefore)) : \(description)")
    }
    
    private func beginSampleInterval(description: String, loopOfAction: () -> Void) {
        let timeBefore = Date()
        loopOfAction()
        let timeAfter = Date()
        printInterval(timeBefore: timeBefore, timeAfter: timeAfter, description: description)
    }
    
    private mutating func doLoopOfActions(Action: () -> Void) {
        (1...elementCount).forEach { i in
            Action()
        }
    }
    
    private mutating func insertValueAtBeginArray() {
        beginSampleInterval(description: "Inserting a value at the beginning of an array") {
            doLoopOfActions() { array.insert(newElement, at: 0) }
        }
    }
    
    private mutating func insertValueInMiddleArray() {
        array.removeAll()
        beginSampleInterval(description: "Inserting a value in the middle of an array") {
            doLoopOfActions() { array.insert(newElement, at: Int(array.count / 2)) }
        }
    }
    
    private mutating func insertValueAtEndArray() {
        array.removeAll()
        beginSampleInterval(description: "Inserting a value at the end of an array") {
            doLoopOfActions() { array.insert(newElement, at: array.count) }
        }
    }
    
    private mutating func insertSameValueInSet() {
        beginSampleInterval(description: "Inserting the same value into the set") {
            doLoopOfActions() { set.insert(newElement) }
        }
    }
    
    private mutating func insertDifferentValueInSet() {
        set.removeAll()
        beginSampleInterval(description: "Inserting different values into the set") {
            (1...elementCount).forEach { i in
                set.insert(i)
            }
        }
    }
    
    private mutating func insertSameValueInDictionary() {
        beginSampleInterval(description: "Inserting the same value in the dictionary") {
            doLoopOfActions() { dictionary[newElement] = newElement }
        }
    }
    
    private mutating func insertDifferentValueInDictionary() {
        dictionary.removeAll()
        beginSampleInterval(description: "Inserting different values in the dictionary") {
            (1...elementCount).forEach { i in
                dictionary[i] = i
            }
        }
    }
    
    private mutating func removeArray() {
        beginSampleInterval(description: "Deleting an array") {
            array.removeAll()
        }
    }
    
    private mutating func removeSet() {
        beginSampleInterval(description: "Deleting a set") {
            set.removeAll()
        }
    }
    
    private mutating func removeDictionary() {
        beginSampleInterval(description: "Deleting a dictionary") {
            dictionary.removeAll()
        }
    }
    
    
    
    
}

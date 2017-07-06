//
//  InstrumentForTest.swift
//  Lesson_1_HomeWork
//
//  Created by Yaroslav Surovtsev on 05.07.17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

struct InstrumentForTest {
    
    static let elementCount = 1_000_000
    static let newElement = 1
    
    func beginTest() {
        ArrayTests.beginArrayTest()
        SetTests.beginSetTest()
        DictionaryTests.beginSetTest()
    }
    
    static func beginSampleInterval(description: String, loopOfAction: () -> Void) {
        let timeBefore = Date()
        loopOfAction()
        let timeAfter = Date()
        printInterval(timeBefore: timeBefore, timeAfter: timeAfter, description: description)
    }
    
    static func printInterval(timeBefore: Date, timeAfter: Date, description: String) {
        print("\(timeAfter.timeIntervalSince(timeBefore)) : \(description)")
    }
    
    static func doLoopOfActions(Action: () -> Void) {
        (1...elementCount).forEach { i in
            Action()
        }
    }
    
    enum ArrayTests {
        static func beginArrayTest() {
            ArrayTests.insertValueAtBeginArray()
            ArrayTests.insertValueInMiddleArray()
            ArrayTests.insertValueAtEndArray()
            ArrayTests.removeArray()
        }
        
        static func insertValueAtBeginArray() {
            var array: [Int] = []
            InstrumentForTest.beginSampleInterval(description: Constants.ArrayConstants.descInsAtBeginArray) {
                InstrumentForTest.doLoopOfActions() { array.insert(newElement, at: 0) }
            }
        }
        
        static func insertValueInMiddleArray() {
            var array: [Int] = []
            InstrumentForTest.beginSampleInterval(description: Constants.ArrayConstants.descInsInMiddleArray) {
                InstrumentForTest.doLoopOfActions() { array.insert(newElement, at: Int(array.count / 2)) }
            }
        }
        
        static func insertValueAtEndArray() {
            var array: [Int] = []
            InstrumentForTest.beginSampleInterval(description: Constants.ArrayConstants.descInsAtEndArray) {
                InstrumentForTest.doLoopOfActions() { array.insert(newElement, at: array.count) }
            }
        }
        
        static func removeArray() {
            var array: [Int] = []
            array.append(contentsOf: 1...elementCount)
            InstrumentForTest.beginSampleInterval(description: Constants.ArrayConstants.descRemoveArray) {
                array.removeAll()
            }
        }
    }
    
    enum SetTests {
        static func beginSetTest() {
            insertSameValueInSet()
            insertDifferentValueInSet()
            removeSet()
        }
        
        static func insertSameValueInSet() {
            var set = Set<Int>()
            InstrumentForTest.beginSampleInterval(description: Constants.SetConstants.descInsSameValueInSet) {
                InstrumentForTest.doLoopOfActions() { set.insert(newElement) }
            }
        }
        
        static func insertDifferentValueInSet() {
            var set = Set<Int>()
            InstrumentForTest.beginSampleInterval(description: Constants.SetConstants.descInsDiffValueInSet) {
                (1...elementCount).forEach { i in
                    set.insert(i)
                }
            }
        }
        
        static func removeSet() {
            var set = Set<Int>()
            (1...elementCount).forEach { i in
                set.insert(newElement)
            }
            InstrumentForTest.beginSampleInterval(description: Constants.SetConstants.descRemoveSet) {
                set.removeAll()
            }
        }
    }
    
    enum DictionaryTests {
        static func beginSetTest() {
            insertSameValueInDictionary()
            insertDifferentValueInDictionary()
            removeDictionary()
        }
        
        static func insertSameValueInDictionary() {
            var dictionary: [Int: Int] = [:]
            InstrumentForTest.beginSampleInterval(description: Constants.DictionaryConstants.descInsSameValueInDict) {
                InstrumentForTest.doLoopOfActions() { dictionary[newElement] = newElement }
            }
        }
        
        static func insertDifferentValueInDictionary() {
            var dictionary: [Int: Int] = [:]
            InstrumentForTest.beginSampleInterval(description: Constants.DictionaryConstants.descInsDiffValueInDict) {
                (1...elementCount).forEach { i in
                    dictionary[i] = i
                }
            }
        }
        
        static func removeDictionary() {
            var dictionary: [Int: Int] = [:]
            (1...elementCount).forEach { i in
                dictionary[i] = i
            }
            InstrumentForTest.beginSampleInterval(description: Constants.DictionaryConstants.descRemoveDictionary) {
                dictionary.removeAll()
            }
        }
    }
 
}

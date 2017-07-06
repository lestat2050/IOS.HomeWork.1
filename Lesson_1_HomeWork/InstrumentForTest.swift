//
//  InstrumentForTest.swift
//  Lesson_1_HomeWork
//
//  Created by Yaroslav Surovtsev on 05.07.17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

struct InstrumentForTest {
    
    func beginTest() {
        ArrayTest.beginArrayTest()
        SetTest.beginSetTest()
        DictionaryTest.beginSetTest()
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
        for _ in Constants.firstElement...Constants.elementCount {
            Action()
        }
    }
    
    enum ArrayTest {
        static func beginArrayTest() {
            ArrayTest.insertValueAtBeginArray()
            ArrayTest.insertValueInMiddleArray()
            ArrayTest.insertValueAtEndArray()
            ArrayTest.removeArray()
        }
        
        static func insertValueAtBeginArray() {
            var array: [Int] = []
            InstrumentForTest.beginSampleInterval(description: Constants.Array.Insert.atBegin) {
                InstrumentForTest.doLoopOfActions() { array.insert(Constants.newElement, at: 0) }
            }
        }
        
        static func insertValueInMiddleArray() {
            var array: [Int] = []
            InstrumentForTest.beginSampleInterval(description: Constants.Array.Insert.inMiddle) {
                InstrumentForTest.doLoopOfActions() { array.insert(Constants.newElement, at: Int(array.count / 2)) }
            }
        }
        
        static func insertValueAtEndArray() {
            var array: [Int] = []
            InstrumentForTest.beginSampleInterval(description: Constants.Array.Insert.atEnd) {
                InstrumentForTest.doLoopOfActions() { array.insert(Constants.newElement, at: array.count) }
            }
        }
        
        static func removeArray() {
            var array: [Int] = []
            array.append(contentsOf: 1...Constants.elementCount)
            InstrumentForTest.beginSampleInterval(description: Constants.Array.remove) {
                array.removeAll()
            }
        }
    }
    
    enum SetTest {
        static func beginSetTest() {
            insertSameValueInSet()
            insertDifferentValueInSet()
            removeSet()
        }
        
        static func insertSameValueInSet() {
            var set = Set<Int>()
            InstrumentForTest.beginSampleInterval(description: Constants.Set.Insert.sameInSet) {
                InstrumentForTest.doLoopOfActions() { set.insert(Constants.newElement) }
            }
        }
        
        static func insertDifferentValueInSet() {
            var set = Set<Int>()
            InstrumentForTest.beginSampleInterval(description: Constants.Set.Insert.diffInSet) {
                for i in Constants.firstElement...Constants.elementCount {
                    set.insert(i)
                }
            }
        }
        
        static func removeSet() {
            var set = Set<Int>()
            for _ in Constants.firstElement...Constants.elementCount {
                set.insert(Constants.newElement)
            }
            InstrumentForTest.beginSampleInterval(description: Constants.Set.remove) {
                set.removeAll()
            }
        }
    }
    
    enum DictionaryTest {
        static func beginSetTest() {
            insertSameValueInDictionary()
            insertDifferentValueInDictionary()
            removeDictionary()
        }
        
        static func insertSameValueInDictionary() {
            var dictionary: [Int: Int] = [:]
            InstrumentForTest.beginSampleInterval(description: Constants.Dictionary.Insert.sameInDict) {
                InstrumentForTest.doLoopOfActions() { dictionary[Constants.newElement] = Constants.newElement }
            }
        }
        
        static func insertDifferentValueInDictionary() {
            var dictionary: [Int: Int] = [:]
            InstrumentForTest.beginSampleInterval(description: Constants.Dictionary.Insert.diffInDict) {
                for i in Constants.firstElement...Constants.elementCount {
                    dictionary[i] = i
                }
            }
        }
        
        static func removeDictionary() {
            var dictionary: [Int: Int] = [:]
            for i in Constants.firstElement...Constants.elementCount {
                dictionary[i] = i
            }
            InstrumentForTest.beginSampleInterval(description: Constants.Dictionary.remove) {
                dictionary.removeAll()
            }
        }
    }
 
}

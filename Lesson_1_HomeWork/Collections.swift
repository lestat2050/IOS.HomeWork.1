//
//  InstrumentForTest.swift
//  Lesson_1_HomeWork
//
//  Created by Yaroslav Surovtsev on 05.07.17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

struct Collections {
    
    func beginTest() {
        Arrays.beginTest()
        Sets.beginTest()
        Dictionaries.beginTest()
    }
    
    static func beginSample(description: String, loopWithAction: () -> Void) {
        let timeBefore = Date()
        loopWithAction()
        let timeAfter = Date()
        printInterval(timeBefore: timeBefore, timeAfter: timeAfter, description: description)
    }
    
    static func printInterval(timeBefore: Date, timeAfter: Date, description: String) {
        print("\(timeAfter.timeIntervalSince(timeBefore)) : \(description)")
    }
    
    static func doLoop(Action: (Int) -> Void) {
        for i in Constants.firstElement...Constants.elementCount {
            Action(i)
        }
    }
    
    enum Arrays {
        static func beginTest() {
            insertValueAtBegin()
            insertValueInMiddle()
            insertValueAtEnd()
            remove()
        }
        
        static func insertValueAtBegin() {
            var array: [Int] = []
            Collections.beginSample(description: Constants.Array.Insert.atBegin) {
                Collections.doLoop() { _ in array.insert(Constants.newElement, at: 0) }
            }
        }
        
        static func insertValueInMiddle() {
            var array: [Int] = []
            Collections.beginSample(description: Constants.Array.Insert.inMiddle) {
                Collections.doLoop() { _ in array.insert(Constants.newElement, at: Int(array.count / 2)) }
            }
        }
        
        static func insertValueAtEnd() {
            var array: [Int] = []
            Collections.beginSample(description: Constants.Array.Insert.atEnd) {
                Collections.doLoop() { _ in array.insert(Constants.newElement, at: array.count) }
            }
        }
        
        static func remove() {
            var array: [Int] = []
            array.append(contentsOf: 1...Constants.elementCount)
            Collections.beginSample(description: Constants.Array.remove) {
                array.removeAll()
            }
        }
    }
    
    
    enum Sets {
        static func beginTest() {
            insertSameValue()
            insertDiffValue()
            remove()
        }
        
        static func insertSameValue() {
            var set = Set<Int>()
            Collections.beginSample(description: Constants.Set.Insert.sameInSet) {
                Collections.doLoop() { _ in set.insert(Constants.newElement) }
            }
        }
        
        static func insertDiffValue() {
            var set = Set<Int>()
            Collections.beginSample(description: Constants.Set.Insert.diffInSet) {
                Collections.doLoop() { i in set.insert(i) }
            }
        }
        
        static func remove() {
            var set = Set<Int>()
            for _ in Constants.firstElement...Constants.elementCount {
                set.insert(Constants.newElement)
            }
            Collections.beginSample(description: Constants.Set.remove) {
                set.removeAll()
            }
        }
    }

    enum Dictionaries {
        static func beginTest() {
            insertSameValue()
            insertDiffValue()
            remove()
        }
        
        static func insertSameValue() {
            var dictionary: [Int: Int] = [:]
            Collections.beginSample(description: Constants.Dictionary.Insert.sameInDict) {
                Collections.doLoop() { _ in dictionary[Constants.newElement] = Constants.newElement }
            }
        }
        
        static func insertDiffValue() {
            var dictionary: [Int: Int] = [:]
            Collections.beginSample(description: Constants.Dictionary.Insert.diffInDict) {
                Collections.doLoop() { i in dictionary[i] = i }
            }
        }
        
        static func remove() {
            var dictionary: [Int: Int] = [:]
            for i in Constants.firstElement...Constants.elementCount {
                dictionary[i] = i
            }
            Collections.beginSample(description: Constants.Dictionary.remove) {
                dictionary.removeAll()
            }
        }
    }
 
}

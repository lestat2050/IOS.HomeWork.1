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
    
    static func timeInterval(description: String, operation: () -> Void) {
        let timeBefore = Date()
        operation()
        let timeAfter = Date()
        print("\(timeAfter.timeIntervalSince(timeBefore)) : \(description)")
    }
    
    static func doLoop(action: (Int) -> Void) {
        for i in Constants.firstElement...Constants.elementCount {
            action(i)
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
            Collections.timeInterval(description: Constants.Array.Insert.atBegin) {
                Collections.doLoop() { _ in array.insert(Constants.newElement, at: 0) }
            }
        }
        
        static func insertValueInMiddle() {
            var array: [Int] = []
            Collections.timeInterval(description: Constants.Array.Insert.inMiddle) {
                Collections.doLoop() { _ in array.insert(Constants.newElement, at: Int(array.count / 2)) }
            }
        }
        
        static func insertValueAtEnd() {
            var array: [Int] = []
            Collections.timeInterval(description: Constants.Array.Insert.atEnd) {
                Collections.doLoop() { _ in array.insert(Constants.newElement, at: array.count) }
            }
        }
        
        static func remove() {
            var array: [Int] = []
            array.append(contentsOf: 1...Constants.elementCount)
            Collections.timeInterval(description: Constants.Array.remove) {
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
            Collections.timeInterval(description: Constants.Set.Insert.sameInSet) {
                Collections.doLoop() { _ in set.insert(Constants.newElement) }
            }
        }
        
        static func insertDiffValue() {
            var set = Set<Int>()
            Collections.timeInterval(description: Constants.Set.Insert.diffInSet) {
                Collections.doLoop() { i in set.insert(i) }
            }
        }
        
        static func remove() {
            var set = Set<Int>()
            for _ in Constants.firstElement...Constants.elementCount {
                set.insert(Constants.newElement)
            }
            Collections.timeInterval(description: Constants.Set.remove) {
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
            Collections.timeInterval(description: Constants.Dictionary.Insert.sameInDict) {
                Collections.doLoop() { _ in dictionary[Constants.newElement] = Constants.newElement }
            }
        }
        
        static func insertDiffValue() {
            var dictionary: [Int: Int] = [:]
            Collections.timeInterval(description: Constants.Dictionary.Insert.diffInDict) {
                Collections.doLoop() { i in dictionary[i] = i }
            }
        }
        
        static func remove() {
            var dictionary: [Int: Int] = [:]
            for i in Constants.firstElement...Constants.elementCount {
                dictionary[i] = i
            }
            Collections.timeInterval(description: Constants.Dictionary.remove) {
                dictionary.removeAll()
            }
        }
    }
 
}

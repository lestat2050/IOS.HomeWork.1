//
//  TestInterval.swift
//  Lesson_1_HomeWork
//
//  Created by Yaroslav Surovtsev on 04.07.17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

struct StructTimeAndPrint {
    
    private let elementCount = 1_000_000
    private let newElement = 1
    private var arrayTest: [Int] = []
    private var setTest = Set<Int>()
    private var dictionaryTest: [Int: Int] = [:]
    
    private func printInterval(timeBefore: Date, timeAfter: Date, description: String) {
        print("\(timeAfter.timeIntervalSince(timeBefore)) : \(description)")
    }
    
    private func startTestInsert(description: String, closureWithTest: () -> Void) {
        let timeBefore = Date()
        closureWithTest()
        let timeAfter = Date()
        printInterval(timeBefore: timeBefore, timeAfter: timeAfter, description: description)
    }
    
    private mutating func loop(clousure: () -> Void) {
        (1...elementCount).forEach { i in
            clousure()
        }
    }
    
    mutating func testSpeedInsertAndRemoveInDifferentTypesOfCollections() {
        startTestInsert(description: "Array 1kk insert index first") {
            loop() {arrayTest.insert(newElement, at: 0)}
        }
        
        arrayTest.removeAll()
        startTestInsert(description: "Array 1kk insert index middle") {
            loop() {arrayTest.insert(newElement, at: Int(arrayTest.count / 2))}
        }
        
        arrayTest.removeAll()
        startTestInsert(description: "Array 1kk insert index last") {
            loop() {arrayTest.insert(newElement, at: arrayTest.count)}
        }
        
        startTestInsert(description: "Set 1kk insert") {
            loop() {setTest.insert(newElement)}
        }
        
        startTestInsert(description: "Set2 diffrent values 1kk insert") {
            (1...elementCount).forEach { i in
                setTest.insert(i)
            }
        }
        
        startTestInsert(description: "Dictionary 1kk insert") {
            loop() {dictionaryTest[newElement] = newElement}
        }
        
        startTestInsert(description: "Dictionary2 diffrent values 1kk insert") {
            (1...elementCount).forEach { i in
                dictionaryTest[i] = i
            }
        }
        
        startTestInsert(description: "Array 1kk remove") {
            arrayTest.removeAll()
        }
        
        startTestInsert(description: "Set 1kk remove") {
            setTest.removeAll()
        }
        
        startTestInsert(description: "Dictionary 1kk remove") {
            dictionaryTest.removeAll()
        }
        
    }
    
}

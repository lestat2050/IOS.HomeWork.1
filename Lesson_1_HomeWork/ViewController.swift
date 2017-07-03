//
//  ViewController.swift
//  Lesson_1_HomeWork
//
//  Created by Yaroslav Surovtsev on 28.06.17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let elementCount = 1_000_000
    let newElement = 1
    var arrayTest: [Int] = []
    var setTest = Set<Int>()
    var dictionaryTest: [Int: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        testSpeedInsertAndRemoveInDifferentTypesOfCollections()
        
    }
    
    struct structTimeAndPrint {
        
        var time: Date {
            return Date()
        }
        
        func printInterval(timeBefore: Date, timeAfter: Date, infoText: String) {
            print("\(timeAfter.timeIntervalSince(timeBefore)) : \(infoText)")
        }
        
    }
    
    func startTestInsert(infoText: String, closureWithTest: () -> Void) {
        
        let TimeAndPrint = structTimeAndPrint()
        let timeBefore = TimeAndPrint.time
        closureWithTest()
        let timeAfter = TimeAndPrint.time
        TimeAndPrint.printInterval(timeBefore: timeBefore, timeAfter: timeAfter, infoText: infoText)
    }
    
    func startTestRemove(infoText: String, closureWithTest: () -> Void) {
        let TimeAndPrint = structTimeAndPrint()
        let timeBefore = TimeAndPrint.time
        closureWithTest()
        let timeAfter = TimeAndPrint.time
        TimeAndPrint.printInterval(timeBefore: timeBefore, timeAfter: timeAfter, infoText: infoText)
    }
    
    func testSpeedInsertAndRemoveInDifferentTypesOfCollections() {
        
        //array
        startTestInsert(infoText: "Array 1kk insert index first", closureWithTest: {
            for _ in 1...elementCount {
                arrayTest.insert(newElement, at: 0)
            }
        })
        
        arrayTest.removeAll()
        startTestInsert(infoText: "Array 1kk insert index middle", closureWithTest: {
            for _ in 1...elementCount {
                arrayTest.insert(newElement, at: Int(arrayTest.count / 2))
            }
        })
        
        arrayTest.removeAll()
        startTestInsert(infoText: "Array 1kk insert index last", closureWithTest: {
            for _ in 1...elementCount {
                arrayTest.insert(newElement, at: arrayTest.count)
            }
        })
        
        //set
        startTestInsert(infoText: "Set 1kk insert", closureWithTest: {
            for _ in 1...elementCount {
                setTest.insert(newElement)
            }
        })

        //set2
        startTestInsert(infoText: "Set2 diffrent values 1kk insert", closureWithTest: {
            for i in 1...elementCount {
                setTest.insert(i)
            }
        })

        //dictionary
        startTestInsert(infoText: "Dictionary 1kk insert", closureWithTest: {
            for _ in 1...elementCount {
                dictionaryTest[newElement] = newElement
            }
        })

        //dictionary2
        startTestInsert(infoText: "Dictionary2 diffrent values 1kk insert", closureWithTest: {
            for i in 1...elementCount {
                dictionaryTest[i] = i
            }
        })
        
        //remove
        startTestRemove(infoText: "Array 1kk remove", closureWithTest: {
            arrayTest.removeAll()
        })
        
        startTestRemove(infoText: "Set 1kk remove", closureWithTest: {
            setTest.removeAll()
        })
        
        startTestRemove(infoText: "Dictionary 1kk remove", closureWithTest: {
            dictionaryTest.removeAll()
        })
        
    }
    
}


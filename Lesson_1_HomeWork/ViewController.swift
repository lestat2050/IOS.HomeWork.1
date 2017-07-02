//
//  ViewController.swift
//  Lesson_1_HomeWork
//
//  Created by Yaroslav Surovtsev on 28.06.17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //startHomeWork1
        testCollectionTypes()
        //endHomeWork1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //startHomeWork1
    func testCollectionTypes() {
        
        let elementCount: Int = 1_000_000
        let newElement: Int = 1
        var time1: Date
        var time2: Date
        var arrayTest: [Int] = []
        var setTest: Set<Int> = []
        var dictionaryTest: Dictionary = [Int: Int]()
        
        func printInterval(time1: Date, time2: Date, label: String) {
            print("\(time2.timeIntervalSince(time1)) : \(label)")
        }
        
        //array
        time1 = Date()
        for _ in 1...elementCount {
            arrayTest.insert(newElement, at: 0)
        }
        time2 = Date()
        printInterval(time1: time1, time2: time2, label: "Array 1kk insert index first")
        
        arrayTest.removeAll()
        time1 = Date()
        for _ in 1...elementCount {
            arrayTest.insert(newElement, at: Int(arrayTest.count / 2))
        }
        time2 = Date()
        printInterval(time1: time1, time2: time2, label: "Array 1kk insert index middle")
        
        arrayTest.removeAll()
        time1 = Date()
        for _ in 1...elementCount {
            arrayTest.insert(newElement, at: Int(arrayTest.count))
        }
        time2 = Date()
        printInterval(time1: time1, time2: time2, label: "Array 1kk insert index last")
        
        //set
        time1 = Date()
        for _ in 1...elementCount {
            setTest.insert(newElement)
        }
        time2 = Date()
        printInterval(time1: time1, time2: time2, label: "Set 1kk insert")
        
        //set2
        time1 = Date()
        for i in 1...elementCount {
            setTest.insert(i)
        }
        time2 = Date()
        printInterval(time1: time1, time2: time2, label: "Set2 diffrent values 1kk insert")
        
        //dictionary
        time1 = Date()
        for _ in 1...elementCount {
            dictionaryTest[newElement] = newElement
        }
        time2 = Date()
        printInterval(time1: time1, time2: time2, label: "Dictionary 1kk insert")
        
        //dictionary2
        time1 = Date()
        for i in 1...elementCount {
            dictionaryTest[i] = i
        }
        time2 = Date()
        printInterval(time1: time1, time2: time2, label: "Dictionary2 diffrent values 1kk insert")
        
        time1 = Date()
        arrayTest.removeAll()
        time2 = Date()
        printInterval(time1: time1, time2: time2, label: "Array 1kk remove")
        
        time1 = Date()
        setTest.removeAll()
        time2 = Date()
        printInterval(time1: time1, time2: time2, label: "Set 1kk remove")
        
        time1 = Date()
        dictionaryTest.removeAll()
        time2 = Date()
        printInterval(time1: time1, time2: time2, label: "Dictionary 1kk remove")
        
    }
    //endHomeWork1

}


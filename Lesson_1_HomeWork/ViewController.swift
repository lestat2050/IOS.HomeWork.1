//
//  ViewController.swift
//  Lesson_1_HomeWork
//
//  Created by Yaroslav Surovtsev on 28.06.17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let instrumentForTest = InstrumentForTest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instrumentForTest.beginTest()
        
    }
    
    
}


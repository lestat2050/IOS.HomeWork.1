//
//  Constants.swift
//  Lesson_1_HomeWork
//
//  Created by Yaroslav Surovtsev on 05.07.17.
//  Copyright © 2017 Yaroslav Surovtsev. All rights reserved.
//

import Foundation

enum Constants {
    static let elementCount = 1_000_000
    static let firstElement = 1
    static let newElement = 1
    enum Array {
        enum Insert {
            static let atBegin = "Inserting a value at the beginning of an array"
            static let inMiddle = "Inserting a value in the middle of an array"
            static let atEnd = "Inserting a value at the end of an array"
        }
        static let remove = "Deleting an array"
    }
    enum Set {
        enum Insert {
            static let sameInSet = "Inserting the same value into the set"
            static let diffInSet = "Inserting different values into the set"
        }
        static let remove = "Deleting a set"
    }
    enum Dictionary {
        enum Insert {
            static let sameInDict = "Inserting the same value in the dictionary"
            static let diffInDict = "Inserting different values in the dictionary"
        }
        static let remove = "Deleting a dictionary"
    }
}

//
//  BooksClass.swift
//  AdultBookReader
//
//  Created by Varun Narayanswamy on 10/5/19.
//  Copyright © 2019 Varun Narayanswamy LPC. All rights reserved.
//

import Foundation

class Books
{
    var name: String?
    var pages: Int?
    var currentPages: Int = 0
    var currentBook: Bool = false
    var completed: Bool = false
    var GoalPages: Int = 0
    var weeklyPages: Int = 0
    var timeRemaining: Int = 0
}

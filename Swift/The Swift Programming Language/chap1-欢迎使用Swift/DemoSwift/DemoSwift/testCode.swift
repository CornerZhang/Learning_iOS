//
//  testCode.swift
//  DemoSwift
//
//  Created by CornerZhang on 14-10-8.
//  Copyright (c) 2014年 NeXtreme.com. All rights reserved.
//

import Foundation

func testCode() {
    var myValue = 45;
    let doubleValue: Double = 34.5;
    let str: String = "A String";
    let noDummy: String = str + String(myValue)
    
    let numberOfApple = 3;
    let summary = "I have \(numberOfApple) apples";
    
    let shoppingList: Array = ["fish","dog","duck","paint"];
    shoppingList[1] = "desk";

    let occupy: Dictionary = [ "mandown":"zuolu", "dianshi":"chufa", ];
    occupy["dianshi"] = "Public Relation";
}
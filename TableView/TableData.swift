//
//  TableData.swift
//  TableView
//
//  Created by Nitin Bhatia on 17/08/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//


import Foundation

struct Data {
    var title : String
    var details : String
    
    init (title : String , details: String){
        self.title = title
        self.details = details
    }
}


var items : [Data] = [

    Data(title: "item 1", details: "detail 1"),
    Data(title: "item 2", details: "detail 2"),
    Data(title: "item 3", details: "detail 3"),
    Data(title: "item 4", details: "detail 4"),
    Data(title: "item 5", details: "detail 5"),
    Data(title: "item 6", details: "detail 6"),
    Data(title: "item 7", details: "detail 7"),
    Data(title: "item 8", details: "detail 8"),
    Data(title: "item 9", details: "detail 9"),
    Data(title: "item 10", details: "detail 10"),
    Data(title: "item 11", details: "detail 11"),
    Data(title: "item 12", details: "detail 12")
    
    
]

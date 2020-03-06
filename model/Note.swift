//
//  Note.swift
//  FireBaseHelloWorld
//
//  Created by Anton Haastrup on 28/02/2020.
//  Copyright © 2020 Anton Haastrup. All rights reserved.
//

import Foundation
class Note {

    var id:String
    var head:String
    var body:String
    var image: String
    
    init(id:String, head:String, body:String, image: String ){
        self.id = id
        self.head = head
        self.body = body
        self.image = image
        
    }
}

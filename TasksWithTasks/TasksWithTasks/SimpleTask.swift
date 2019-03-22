//
//  SimpleTask.swift
//  TasksWithTasks
//
//  Created by Dinar Ilalov on 22/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

class SimpleTask: Task  {
    var name: String
    
    var tasks: [Task] = []
    
    init(name: String) {
        self.name = name
    }
}

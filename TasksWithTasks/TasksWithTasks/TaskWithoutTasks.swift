//
//  TaskWithoutTasks.swift
//  TasksWithTasks
//
//  Created by Dinar Ilalov on 22/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

class TaskWitoutTasks: Task {
    var tasks: [Task] = []
    
    var name: String
    let description: String
    
    init(name: String) {
        self.name = name
        self.description = "without task"
    }
}

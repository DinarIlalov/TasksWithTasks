//
//  TasksStorage.swift
//  TasksWithTasks
//
//  Created by Dinar Ilalov on 22/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

class TasksStorage {
    func getTasks(with hierarchyDepth: Int) -> [Task] {
        
        if hierarchyDepth <= 0 {
            return []
        }
        
        var tasks: [Task] = []
        
        let randomValue = Int.random(in: 3...7)
        
        for iterator in (0...randomValue) {
            
            let taskWithTasks: Bool = Int.random(in: 0...1) == 0
            
            var task: Task
            if taskWithTasks {
                task = SimpleTask(name: "Task # \(iterator)")
                task.tasks = getTasks(with: hierarchyDepth-1)
            } else {
                task = TaskWitoutTasks(name: "Task # \(iterator)")
            }
            
            tasks.append(task)
        }
        return tasks
    }
}

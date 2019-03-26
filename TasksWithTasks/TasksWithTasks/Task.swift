//
//  Task.swift
//  TasksWithTasks
//
//  Created by Dinar Ilalov on 22/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

protocol Task {
    var name: String { get set }
    var tasks: [Task] { get set }
}

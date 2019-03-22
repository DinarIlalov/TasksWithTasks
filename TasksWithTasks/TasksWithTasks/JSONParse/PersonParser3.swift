//
//  PersonParser3.swift
//  TasksWithTasks
//
//  Created by Dinar Ilalov on 22/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

class PersonParser3: PersonParser {
    var next: PersonParser?
    
    func parse(_ data: Data, with completion: @escaping (([Person]) -> Void)) {
        let personDecoder = PersonDecoder()
        
        guard let result: [Person] = personDecoder.decode(data) else {
            if let next = self.next {
                next.parse(data, with: completion)
            } else {
                completion([])
            }
            return
        }
        completion(result)
    }
}

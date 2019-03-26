//
//  PersonParser.swift
//  TasksWithTasks
//
//  Created by Dinar Ilalov on 22/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import Foundation

protocol PersonParser {
    var next: PersonParser? { get set }
    
    func parse(_ data: Data, with completion: @escaping (([Person]) -> Void))
    
}

class PersonDecoder {
    
    func decode<T: Decodable>(_ data: Data) -> T? {
        let decoder = JSONDecoder()
        return try? decoder.decode(T.self, from: data)
    }
}

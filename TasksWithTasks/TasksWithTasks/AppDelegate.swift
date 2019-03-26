//
//  AppDelegate.swift
//  TasksWithTasks
//
//  Created by Dinar Ilalov on 21/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        func data(from file: String) -> Data {
            let path1 = Bundle.main.path(forResource: file, ofType: "json")!
            let url = URL(fileURLWithPath: path1)
            let data = try! Data(contentsOf: url)
            return data
        }
        
        let data1 = data(from: "1")
        let data2 = data(from: "2")
        let data3 = data(from: "3")
        
        let personParser1 = PersonParser1()
        let personParser2 = PersonParser2()
        let personParser3 = PersonParser3()
        
        personParser1.next = personParser2
        personParser2.next = personParser3
        
        let personParser: PersonParser = personParser1
        
        personParser.parse(data1) { (persons) in
            print("=== FIRST ===")
            print(persons)
            print()
        }
        
        personParser.parse(data2) { (persons) in
            print("=== SECOND ===")
            print(persons)
            print()
        }
        
        personParser.parse(data3) { (persons) in
            print("=== THIRD ===")
            print(persons)
            print()
        }
        
        // проверка неработоспособности
        let data4 = data(from: "4")
        personParser.parse(data4) { (persons) in
            print("=== FORTH ===")
            print(persons)
            print()
        }
        
        
        return true
    }

}


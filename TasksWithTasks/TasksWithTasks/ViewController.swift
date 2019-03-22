//
//  ViewController.swift
//  TasksWithTasks
//
//  Created by Dinar Ilalov on 21/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func openTaskButtonPressed(_ sender: UIButton) {
        if let viewController = UIStoryboard.main?.instantiateViewController(withIdentifier: "tasks") as? TasksListViewController {
            viewController.isFirstController = true
            navigationController?.show(viewController, sender: nil)
        }
    }
}


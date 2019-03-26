//
//  TasksListViewController.swift
//  TasksWithTasks
//
//  Created by Dinar Ilalov on 21/03/2019.
//  Copyright © 2019 Dinar Ilalov. All rights reserved.
//

import UIKit

class TasksListViewController: UIViewController {

    
    // MARK: outlets
    @IBOutlet weak var taskDescriptionView: UIView!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
    }
    
    // MARK: properties
    var task: Task?
    private var tasks: [Task]?
    
    var isFirstController: Bool = false
    
    var onAddNewTaskEnd: ((Task?, Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isFirstController {
            tasks = TasksStorage().getTasks(with: 5)
        } else {
            tasks = task?.tasks
        }
        setupTopView()
        configureAddButton()
    }

    override func viewWillDisappear(_ animated: Bool) {
        if isFirstController {
            return
        }
        
        let isTaskCreation = task == nil
        
        if isTaskCreation {
            task = SimpleTask(name: taskDescriptionTextField.text ?? "noname")
        } else {
            task?.name = taskDescriptionTextField.text ?? "noname"
        }
        
        task?.tasks = tasks ?? []
        
        onAddNewTaskEnd?(task, isTaskCreation)
        
    }
    
    private func setupTopView() {
        if isFirstController {
            taskDescriptionView.isHidden = true
            tableView.setNeedsUpdateConstraints()
            return
        }
        
        taskDescriptionTextField.text = task?.name
        
        if task is TaskWitoutTasks {
            tableView.isHidden = true
        }
    }
    
    private func configureAddButton() {
        if !(task is TaskWitoutTasks) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addTaskButtonDidTap(_:)))
        }
    }
    
    @objc private func addTaskButtonDidTap(_ sender: UIBarButtonItem) {
        openTaskViewController(with: nil)
    }
    
    private func openTaskViewController(with task: Task?) {
        if let viewController = UIStoryboard.main?.instantiateViewController(withIdentifier: "tasks") as? TasksListViewController {
            viewController.task = task
            viewController.onAddNewTaskEnd = { [weak self] newTask, isTaskCreation in
                if isTaskCreation, let newTask = newTask {
                    self?.tasks?.append(newTask)
                    self?.task?.tasks = self?.tasks ?? []
                }
                self?.tableView.reloadData()
            }
            navigationController?.show(viewController, sender: nil)
        }
    }
    
}

// MARK: - UITableViewDataSource
extension TasksListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = tasks?[indexPath.row].name
        if let taskWithoutTasks = tasks?[indexPath.row] as? TaskWitoutTasks {
            cell.textLabel?.text = taskWithoutTasks.name + " " + taskWithoutTasks.description
        }
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate
extension TasksListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openTaskViewController(with: tasks?[indexPath.row])
    }
    
}

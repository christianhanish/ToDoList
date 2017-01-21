//
//  ViewController.swift
//  ToDoList
//
//  Created by Christian Hanish on 12/16/16.
//  Copyright © 2016 iOSClass. All rights reserved.
//

import UIKit

protocol AddNewTaskDelegate {
    
    func addNewTask(taskDetail: TaskDetail)
    
    }

class CreateTaskViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    var delegate: AddNewTaskDelegate?
    
    
    // @IBOutlet weak var detailsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        nameTextField.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Check 1
    }

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
        func textFieldDidEndEditing(_ textField: UITextField) {
            taskNameLabel.text = textField.text
    }
    
    // MARK: Actions

    @IBAction func addTaskButtonPressed(_ sender: UIBarButtonItem) {
        
        let taskDetail = TaskDetail(name: nameTextField.text!, notes: descriptionTextField.text!, completed: false)
        
        delegate?.addNewTask(taskDetail: taskDetail)
        
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
}


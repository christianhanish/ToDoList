//
//  ToDoListViewController.swift
//  ToDoList
//
//  Created by Christian Hanish on 12/21/16.
//  Copyright © 2016 iOSClass. All rights reserved.
//

import UIKit

class ListOfTasksViewController: UITableViewController, AddNewTaskDelegate {
    
    
    
//        var listOfTasks: [String] = [
        
//        "Study for iOS Class.",
//        "Go to the grocery store.",
//        "Go to the gym."
    
    
    var taskDetails: [TaskDetail] = [
    
//        TaskDetail(name: "Study for iOS Class.", notes: "Work on To-Do List app.", completed: true),
//        TaskDetail(name: "Work on OpenRuns UI and UX.", notes: "Finalize social and profile screens.", completed: true),
//        TaskDetail(name: "Get tickets to the UCLA vs. USC game.", notes: "Buy tickets off StubHub.", completed: true),
//        TaskDetail(name: "Go to the grocery store.", notes: "Pick up bread, eggs, and milk.", completed: true),
//        TaskDetail(name: "Go to the gym.", notes: "Work on arms, back, and core.", completed: true),
//        TaskDetail(name: "Renew UCLA gym membership.", notes: "Renew membership the next time I'm at the Wooden Center.", completed: false),
//        TaskDetail(name: "Take Diego to the airport.", notes: "Diego leaves tomorrow afternoon.", completed: false),
//        TaskDetail(name: "Get camping stuff from Pepperdine Campus Rec with Noah.", notes: "Talk to Noah about everything we need.", completed: false),
//        TaskDetail(name: "Meet with Pablo at Pepperdine West LA.", notes: "Prep for Thursday's meeting with Pepperdine.", completed: false),
//        TaskDetail(name: "Email MICDS about the academy.", notes: "Ask MICDS about Apple computers.", completed: false)
//        
//
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskDetails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasksCell", for: indexPath) as! ListOfTasksCell
        
        cell.nameLabel.text = taskDetails[indexPath.row].name
        
        cell.isCompleted = taskDetails[indexPath.row].completed
        
        return cell
        
    }
    
    func addNewTask(taskDetail: TaskDetail) {
        
        taskDetails.append(taskDetail)
        
        print(taskDetails)
        
        tableView.reloadData()
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Item deleted!")
              taskDetails.remove(at: indexPath.row) // removes item from array
              tableView.deleteRows(at: [indexPath], with: .fade) // removes the item from tableview
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .checkmark
            }
        }
        
        func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.accessoryType = .none
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "taskDetailsSegue" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                if let destination = segue.destination as? TaskDetailsViewController {
                    
                    destination.taskDetail = taskDetails[indexPath.row]
                }
            }
        } else if segue.identifier == "AddNewTaskSegue" {
            
            let destination = segue.destination as? CreateTaskViewController
            
            destination?.delegate = self
            
        }
    }
}

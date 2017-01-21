//
//  TaskDetailsViewController.swift
//  ToDoList
//
//  Created by Christian Hanish on 12/22/16.
//  Copyright © 2016 iOSClass. All rights reserved.
//

import UIKit

class TaskDetailsViewController: UIViewController {

    @IBOutlet weak var taskNameLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    var taskDetail: TaskDetail?
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let unwrappedTaskDetail = taskDetail {
            
            taskNameLabel.text = unwrappedTaskDetail.name
            
            descriptionLabel.text = unwrappedTaskDetail.notes
            
            
        }
        
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

}

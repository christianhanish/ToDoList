//
//  TaskTableViewCell.swift
//  ToDoList
//
//  Created by Christian Hanish on 12/21/16.
//  Copyright © 2016 iOSClass. All rights reserved.
//

import UIKit

protocol checkmarkDelegate {
    
    func checkmarkTapped(completed: Bool)
    
}

class ListOfTasksCell: UITableViewCell {
    
    var delegate: checkmarkDelegate?
    
    var isCompleted: Bool = false
    
    
    @IBOutlet weak var completedButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    completedButton.layer.cornerRadius = completedButton.frame.size.width / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkmarkButtonPressed(_ sender: UIButton) {
        
        print("Button tapped!")
        
        if isCompleted {
            
            completedButton.setImage(nil, for: .normal)
            
        } else {
            
            completedButton.setImage(#imageLiteral(resourceName: "round-done-button"), for: .normal)
            
        }
        
        isCompleted = !isCompleted
        
    }
    
}

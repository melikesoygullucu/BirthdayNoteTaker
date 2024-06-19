//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Melike Soygüllücü on 19.06.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var birthday: UITextField!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBirthday: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let savedName = UserDefaults.standard.object(forKey: "name")
        let savedBDay = UserDefaults.standard.object(forKey: "birthday")
        
        // casting with as? vs as!
        if let newName = savedName as? String {
            labelName.text = "Name: \(newName)"
        }
        
        if let newBDay = savedBDay as? String {
            labelBirthday.text = "Birthday: \(newBDay)"
        }
        
    }

    @IBAction func saveBDay(_ sender: Any) {
        
        // to store small data
        UserDefaults.standard.set(name.text, forKey: "name")
        UserDefaults.standard.set(birthday.text, forKey: "birthday")
        // UserDefaults.standard.synchronize()  -> no need to use
        
        labelName.text = "Name: \(name.text!)"
        labelBirthday.text = "Birthday: \(birthday.text!)"
    }
    
    
    @IBAction func deleteBDay(_ sender: Any) {
        
        let savedName = UserDefaults.standard.object(forKey: "name")
        let savedBDay = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = savedName as? String {
            UserDefaults.standard.removeObject(forKey: "name")
            labelName.text = "Name: "
        }
        
        if let newBDay = savedBDay as? String {
            UserDefaults.standard.removeObject(forKey: "birthday")
            labelBirthday.text = "Birthday: "
        }
        
        
        
    }
    
}


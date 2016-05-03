//
//  ViewController.swift
//  NSUserDefaults
//
//  Created by Sean Perez on 4/25/16.
//  Copyright © 2016 Awsome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favoriteColor: UILabel!
    
    var people = [Person]()
    
    var red = "Red"
    var blue = "Blue"
    var yellow = "Yellow"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let color = NSUserDefaults.standardUserDefaults().valueForKey("color") as? String {
            favoriteColor.text = "Favorite Color: \(color)"
        } else {
            favoriteColor.text = "Pick a color!"
        }
        
        let person1 = Person(first: "Wing", last: "Chun")
        let person2 = Person(first: "Lady", last: "Gaga")
        let person3 = Person(first: "Justin", last: "Bieber")
        
        people.append(person1)
        people.append(person2)
        people.append(person3)
        
        let peopleData = NSKeyedArchiver.archivedDataWithRootObject(people)
        
        NSUserDefaults.standardUserDefaults().setObject(peopleData, forKey: "people")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func redColor(sender: AnyObject) {
        favoriteColor(red)
        NSUserDefaults.standardUserDefaults().setValue("Red", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func blueColor(sender: AnyObject) {
        favoriteColor(blue)
        NSUserDefaults.standardUserDefaults().setValue("Blue", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        if let loadPeople = NSUserDefaults.standardUserDefaults().objectForKey("people") as? NSData {
            
            if let peopleArray = NSKeyedUnarchiver.unarchiveObjectWithData(loadPeople) as? [Person] {
                for person in peopleArray {
                    print(person.firstName)
                }
            }
        }
        
        
    }
    
    @IBAction func yellowColor(sender: AnyObject) {
        favoriteColor(yellow)
        NSUserDefaults.standardUserDefaults().setValue("Yellow", forKey: "color")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func favoriteColor(string: String) {
        favoriteColor.text = "Favorite Color: \(string)"
    }

}
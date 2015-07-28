//
//  RestaurantSettingsViewController.swift
//  GitTest
//
//  Created by Kyle Barker on 7/15/15.
//  Copyright (c) 2015 Don Wilson. All rights reserved.
//

import UIKit

class RestaurantSettingsViewController: UIViewController {

    @IBOutlet weak var poorServiceDownArrow: UIButton!
    @IBOutlet weak var poorServicePercentLabel: UILabel!
    @IBOutlet weak var poorServiceUpArrow: UIButton!
    @IBOutlet weak var goodServiceDownArrow: UIButton!
    @IBOutlet weak var goodServicePercentLabel: UILabel!
    @IBOutlet weak var goodServiceUpArrow: UIButton!
    @IBOutlet weak var amazingServiceDownArrow: UIButton!
    @IBOutlet weak var amazingServicePercentLabel: UILabel!
    @IBOutlet weak var amazingServiceUpArrow: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var restaurantService: RestaurantService = RestaurantService()
    var updatedPoorPercentage: Int = 0
    var updatedGoodPercentage: Int = 0
    var updatedAmazingPercentage: Int = 0
    
    //create dictionary of defaults
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        updatedPoorPercentage = defaults.integerForKey("restaurantPoor")
        updatedGoodPercentage = defaults.integerForKey("restaurantGood")
        updatedAmazingPercentage = defaults.integerForKey("restaurantAmazing")
        poorServicePercentLabel.text = "\(updatedPoorPercentage)"
        goodServicePercentLabel.text = "\(updatedGoodPercentage)"
        amazingServicePercentLabel.text = "\(updatedAmazingPercentage)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    @IBAction func decrementPoorPercentage(sender: AnyObject) {
        updatedPoorPercentage = updatedPoorPercentage - 1
        poorServicePercentLabel.text = "\(updatedPoorPercentage)"
    }
    
    @IBAction func decrementGoodPercentage(sender: AnyObject) {
        updatedGoodPercentage = updatedGoodPercentage - 1
        goodServicePercentLabel.text = "\(updatedGoodPercentage)"
    }
    
    @IBAction func decrementAmazingPercentage(sender: AnyObject){
        updatedAmazingPercentage = updatedAmazingPercentage - 1
        amazingServicePercentLabel.text = "\(updatedAmazingPercentage)"
    }
    
    @IBAction func incrementPoorPercentage(sender: AnyObject) {
        updatedPoorPercentage = updatedPoorPercentage + 1
        poorServicePercentLabel.text = "\(updatedPoorPercentage)"
    }
   
    @IBAction func incrementGoodPercentage(sender: AnyObject) {
        updatedGoodPercentage = updatedGoodPercentage + 1
        goodServicePercentLabel.text = "\(updatedGoodPercentage)"
    }
    
    @IBAction func incrementAmazingPercentage(sender: AnyObject) {
        updatedAmazingPercentage = updatedAmazingPercentage + 1
        amazingServicePercentLabel.text = "\(updatedAmazingPercentage)"
    }
    
    @IBAction func resetServiceRates(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        updatedPoorPercentage = defaults.integerForKey("defaultRestaurantPoorPercentage")
        updatedGoodPercentage = defaults.integerForKey("defaultRestaurantGoodPercentage")
        updatedAmazingPercentage = defaults.integerForKey("defaultRestaurantAmazingPercentage")
        poorServicePercentLabel.text = "\(updatedPoorPercentage)"
        goodServicePercentLabel.text = "\(updatedGoodPercentage)"
        amazingServicePercentLabel.text = "\(updatedAmazingPercentage)"
    }
    
    @IBAction func handleDoneButton(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(updatedPoorPercentage, forKey: "restaurantPoor")
        defaults.setInteger(updatedGoodPercentage, forKey: "restaurantGood")
        defaults.setInteger(updatedAmazingPercentage, forKey: "restaurantAmazing")
        
        self.dismissViewControllerAnimated(true, completion:nil)
    }
   
    @IBAction func handleCancelButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion:nil)
    }
    
    

}

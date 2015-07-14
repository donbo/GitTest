//
//  RestaurantViewController.swift
//  GitTest
//
//  Created by Kyle Barker on 7/12/15.
//  Copyright (c) 2015 Don Wilson. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billBeforeTipRestaurant: UITextField!
    @IBOutlet weak var poorButtonRestaurant: UIButton!
    @IBOutlet weak var goodButtonRestaurant: UIButton!
    @IBOutlet weak var amazingButtonRestaurant: UIButton!
    @IBOutlet weak var percentLabelRestaurant: UILabel!
    @IBOutlet weak var tipAmountRestaurant: UILabel!
    @IBOutlet weak var totalCostRestaurant: UILabel!
    @IBOutlet weak var lessPeopleButtonRestaurant: UIButton!
    @IBOutlet weak var morePeopleButtonRestaurant: UIButton!
    @IBOutlet weak var peopleInPartyLabelRestaurant: UILabel!
    @IBOutlet weak var splitBillAmountRestaurant: UILabel!
    var restaurantService: RestaurantService = RestaurantService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantService.setTipPercentage()
        tipAmountRestaurant.text = "\(restaurantService.tipAmount())"
        totalCostRestaurant.text = "\(restaurantService.billAfterTip())"
        percentLabelRestaurant.text = "\(restaurantService.tipPercentage)"
        peopleInPartyLabelRestaurant.text = "\(restaurantService.numberInParty)"
        splitBillAmountRestaurant.text = "\(restaurantService.splitAmount())"
        
        billBeforeTipRestaurant.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateViewFromServiceQuality() {
        restaurantService.setTipPercentage()
        tipAmountRestaurant.text = "\(restaurantService.tipAmount())"
        totalCostRestaurant.text = "\(restaurantService.billAfterTip())"
        percentLabelRestaurant.text = "\(restaurantService.tipPercentage)"
    }
    
    @IBAction func poorButtonPressed(sender: AnyObject) {
        restaurantService.serviceQuality = ServiceQuality.poor
        updateViewFromServiceQuality()
        println("poor button pressed")
    }
    
    @IBAction func goodButtonPressed(sender: AnyObject) {
        restaurantService.serviceQuality = ServiceQuality.good
        updateViewFromServiceQuality()
    }
    
    @IBAction func amazingButtonPressed(sender: AnyObject) {
        restaurantService.serviceQuality = ServiceQuality.amazing
        updateViewFromServiceQuality()
        
        println("amazing button pressed")
    }
    
    func updateSplitInfo() {
        peopleInPartyLabelRestaurant.text = "\(restaurantService.numberInParty)"
        splitBillAmountRestaurant.text = "\(restaurantService.splitAmount())"
    }
    
    @IBAction func lessPeopleButtonPressed(sender: AnyObject) {
        restaurantService.decrementNumberInParty()
        updateSplitInfo()
        println("less people button pressed")
    }
    
    @IBAction func morePeopleButtonPressed(sender: AnyObject) {
        restaurantService.incrementNumberInParty()
        updateSplitInfo()
        println("more people button pressed")
    }
    
    func readBillBeforeTipNumber() {
        let a:Double? = (billBeforeTipRestaurant.text as NSString).doubleValue
        
        if a != nil {
            restaurantService.billBeforeTip = a! //a! gives you the value and not the nil
        }
        
        tipAmountRestaurant.text = "\(restaurantService.tipAmount())"
        totalCostRestaurant.text = "\(restaurantService.billAfterTip())"
    }
    
    
    //UITextField Delegate Functions
    func textFieldDidBeginEditing(textField: UITextField) {
        println("Textfield did begin editing")
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        println("Textfield did end editing")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("textfield did return")
        readBillBeforeTipNumber()
        self.view.endEditing(true)        
        return true
    }
}
















//
//  Restuarant Service.swift
//  GitTest
//
//  Created by Kyle Barker on 7/12/15.
//  Copyright (c) 2015 Don Wilson. All rights reserved.
//

import Foundation

class RestaurantService {
    
    var billBeforeTip: Double
    var tipPercentage: Double
    var serviceQuality: ServiceQuality
    var numberInParty: Int
    var splitBillAmount: Double

    
    init () {
        billBeforeTip = 0
        tipPercentage = 0
        serviceQuality = .good
        numberInParty = 1
        splitBillAmount = 0
    }
    
    func setTipPercentage() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        switch serviceQuality {
        case .poor:
            tipPercentage = Double(defaults.integerForKey("restaurantPoor"))
        case .good:
            tipPercentage = Double(defaults.integerForKey("restaurantGood"))
        case .amazing:
            tipPercentage = Double(defaults.integerForKey("restaurantAmazing"))
        }
    }
    
    func tipAmount() -> Double {
        return billBeforeTip * (tipPercentage/100)
    }
    
    func billAfterTip() -> Double {
        return billBeforeTip + tipAmount()
    }
    
    func splitAmount() -> Double {
        return billAfterTip() / Double(numberInParty)
    }
    
    func decrementNumberInParty() -> Int {
        if numberInParty > 1 {
            numberInParty = numberInParty - 1
        }
        return numberInParty
    }
    
    func incrementNumberInParty() -> Int {
        numberInParty = numberInParty + 1
        return numberInParty
    }

}
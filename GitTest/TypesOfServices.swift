//
//  TypesOfServices.swift
//  GitTest
//
//  Created by Kyle Barker on 7/8/15.
//  Copyright (c) 2015 Don Wilson. All rights reserved.
//

import Foundation

enum ServiceType: String {
    case    Restaurant = "Restaurant",
            Bartender = "Bartender",
            HairStylist = "Hair Sylist/Barber",
            TaxiDriver = "Taxi Driver",
            FoodDelivery = "Food Delivery",
            Manicurist = "Manicurist",
            Bellman = "Bellman",
            FurnitureDelivery = "Furniture Delivery",
            CarWash = "Car Wash"
    
    static let allServiceTypes = [Restaurant, Bartender, HairStylist, TaxiDriver, FoodDelivery, Manicurist, Bellman, FurnitureDelivery, CarWash]
}




//
//  User.swift
//  Watch1S Extension
//
//  Created by administrator on 25.06.2018.
//  Copyright © 2018 administrator. All rights reserved.
//

import Foundation

struct User {
    let website : String!
    let username : String!
    let phone : String!
    let name : String!
    let id : String!
    let email : String!
    let company : Company!
    let address : Address!
    
    init (dict: [String:Any]) {
        self.name = dict["name"] as? String
        self.website = dict["website"] as? String
        self.username = dict["username"] as? String
        self.phone = dict["phone"] as? String
        self.id = dict["id"] as? String
        self.email = dict["email"] as? String
        self.company = Company(dict: dict["company"] as! [String : String])
        self.address = Address(dict: dict["address"] as! [String : AnyObject])
        
    }
}
struct Company {
    let bs : String!
    let catchPhrase : String!
    let name : String!
    
    init (dict: [String:String]) {
        self.bs = dict["bs"]
        self.catchPhrase = dict["catchPhrase"]
        self.name = dict["name"]
    }
}

struct Address {
    let city : String!
    let street : String!
    let suite : String!
    let zipcode : String!
    let lng : String!
    let lat : String!
    
    init (dict: [String:AnyObject]) {
        self.city = dict["city"] as! String
        self.street = dict["street"] as! String
        self.suite = dict["suite"] as! String
        self.zipcode = dict["zipcode"] as! String
        self.lat = dict["geo"]!["lat"]! as! String
        self.lng = dict["geo"]!["lng"]! as! String
    }
    
}

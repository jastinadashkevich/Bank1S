//
//  Info.swift
//  Watch1S Extension
//
//  Created by administrator on 27.06.2018.
//  Copyright © 2018 administrator. All rights reserved.
//

import Foundation

struct Requisite {
    let bank : String!
    let bankDetails : String!
    let unp : String!
    let account : String!
    let payAssign : String!
    let noAdditionalPayments : String!
    let currencyCode : String!
    let currencyName : String!
    
    init (dict: [String:Any]) {
        self.bank = dict["bank"] as? String
        self.bankDetails = dict["bankDetails"] as? String
        self.unp = dict["unp"] as? String
        self.account = dict["account"] as? String
        self.payAssign = dict["payAssign"] as? String
        self.noAdditionalPayments = dict["noAdditionalPayments"] as? String
        self.currencyCode = dict["currencyCode"] as? String
        self.currencyName = dict["currencyName"] as? String
    }
}

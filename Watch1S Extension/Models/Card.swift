//
//  Card.swift
//  Watch1S Extension
//
//  Created by administrator on 14.06.2018.
//  Copyright © 2018 administrator. All rights reserved.
//

import Foundation

struct Card : Decodable {
    let id : Int!
    let isCurrent : Bool!
    let type : String!
    let expdate : Int!
    let cardClass : String!
    let corporative : Int!
    let num : String!
    let cardHolder : String!
    let cardName : String!
    let fixedBalance : Int!
    let currency : String!
    let blocking : String!
    let balance : String!
    let international : Int!
    let internet : Int!
    let status3D : Int!
    let statusPimp : Int!
    let statusLimits : Int!
    let isProlongable : Int!
    let isReplaceable : Int!
    let isCredit : Int!
    let isBelcard : Int!
    let isSendPinAllowed : Int!
    let isDBO : Int!
    let cardClassColor : String!
    let isVirtual : String!
    let cardsKey : Int!
    
//    var statementArray = [Statement]()

    init (dict: [String:Any]) {
        self.id = dict["id"] as? Int
        self.isCurrent = dict["isCurrent"] as? Bool
        self.type = dict["type"] as? String
        self.expdate = dict["expdate"] as? Int
        self.cardClass = dict["cardClass"] as? String
        self.corporative = dict["corporative"] as? Int
        self.num = dict["num"] as? String
        self.cardHolder = dict["cardHolder"] as? String
        self.cardName = dict["cardName"] as? String
        self.fixedBalance = dict["fixedBalance"] as? Int
        self.currency = dict["currency"] as? String
        self.blocking = dict["blocking"] as? String
        self.balance = dict["balance"] as? String
        self.international = dict["international"] as? Int
        self.internet = dict["internet"] as? Int
        self.status3D = dict["status3D"] as? Int
        self.statusPimp = dict["statusPimp"] as? Int
        self.statusLimits = dict["statusLimits"] as? Int
        self.isProlongable = dict["isProlongable"] as? Int
        self.isReplaceable = dict["isReplaceable"] as? Int
        self.isCredit = dict["isCredit"] as? Int
        self.isBelcard = dict["isBelcard"] as? Int
        self.isSendPinAllowed = dict["isSendPinAllowed"] as? Int
        self.isDBO = dict["isDBO"] as? Int
        self.cardClassColor = dict["cardClassColor"] as? String
        self.isVirtual = dict["isVirtual"] as? String
        self.cardsKey = dict["cardsKey"] as? Int
        
//        if let array = dict["Statement"] as? [[String:String]] {
//            for statementDict in array {
//                let statement = Statement(dict: statementDict)
//                statementArray.append(statement)
//            }
//        }
    }
}
//struct Statement {
//    let amount : String!
//    let desc : String!
//    let date : String!
//
//    init (dict: [String:String]) {
//        self.amount = dict["amount"]
//        self.desc = dict["desc"]
//        self.date = dict["date"]
//    }
//}

//
//  Statement.swift
//  Watch1S Extension
//
//  Created by administrator on 27.06.2018.
//  Copyright © 2018 administrator. All rights reserved.
//

import Foundation

struct Statement {
    let date : String!
    let dateResp : String!
    let type : String!
    let cardAcceptor : String!
    let transactionAmt : String!
    let transactionAmtCurrency : String!
    let feeAmt : String!
    let feeAmtCurrency : String!
    let reflectedAccountAmt : String!
    let reflectedAccountAmtCurrency : String!
    let reflectedFee : String!
    let reflectedFeeCurrency : String!
    let balanceAmt : String!
    let balanceAmtCurrency : String!
    let status: String!
    let sign : String!
    let operationColor : String!
    let cardNum : String!
    let historyKey : String!
    
    init (dict: [String:Any]) {
        self.date = dict["date"] as? String
        self.dateResp = dict["dateResp"] as? String
        self.type = dict["type"] as? String
        self.cardAcceptor = dict["cardAcceptor"] as? String
        self.transactionAmt = dict["transactionAmt"] as? String
        self.transactionAmtCurrency = dict["transactionAmtCurrency"] as? String
        self.feeAmt = dict["feeAmt"] as? String
        self.feeAmtCurrency = dict["feeAmtCurrency"] as? String
        self.reflectedAccountAmt = dict["reflectedAccountAmt"] as? String
        self.reflectedAccountAmtCurrency = dict["reflectedAccountAmtCurrency"] as? String
        self.reflectedFee = dict["reflectedFee"] as? String
        self.reflectedFeeCurrency = dict["reflectedFeeCurrency"] as? String
        self.balanceAmt = dict["balanceAmt"] as? String
        self.balanceAmtCurrency = dict["balanceAmtCurrency"] as? String
        self.status = dict["status"] as? String
        self.sign = dict["sign"] as? String
        self.operationColor = dict["operationColor"] as? String
        self.cardNum = dict["cardNum"] as? String
        self.historyKey = dict["historyKey"] as? String
    }
}

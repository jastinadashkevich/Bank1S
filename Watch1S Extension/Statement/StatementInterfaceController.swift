//
//  StatementInterfaceController.swift
//  Watch1S Extension
//
//  Created by administrator on 18.06.2018.
//  Copyright © 2018 administrator. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire

class StatementInterfaceController: WKInterfaceController {

    @IBOutlet internal var statementTable: WKInterfaceTable!
    
    //var card: Card?
    var statementArray = [Statement]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        Alamofire.request("https://msgr.lwo.by:8443/history").responseJSON { response in
            guard response.result.isSuccess else {
                print("Ошибка при запросе данных \(String(describing: response.result.error))")
                return
            }
            
            let dict = response.result.value as! [String : AnyObject]
            let values = dict["values"] as! [String : AnyObject]
            let statements = values["history"] as! [[String : AnyObject]]
            
            for item in statements {
                let statement = Statement(dict: item)
                self.statementArray.append(statement)
            }
            
            self.statementTable.setNumberOfRows(self.statementArray.count, withRowType: "StatementRowType")
            print(self.statementArray.count)
            
            for index in 0..<self.statementArray.count {
                guard let row = self.statementTable.rowController(at: index) as? StatementRowController else { continue }
                
                let statement = self.statementArray[index]
                if statement.sign == "+" {
                    row.amountLabel.setTextColor(UIColor.green)
                } else if statement.sign == "-"{
                    row.amountLabel.setTextColor(UIColor.red)
                } else {
                    row.amountLabel.setTextColor(UIColor.gray)
                }
                row.amountLabel.setText(statement.sign + statement.transactionAmt + " " + statement.transactionAmtCurrency)
                row.descLabel.setText(statement.type)
                //row.numberLabel.setText(String(card.number.suffix(9)))
                row.dateLabel.setText(statement.date)
                //row.imageImg.setImageNamed(self.setImageFromName(cardName: card.cardName))
            }
//        self.statementTable.setNumberOfRows(self.cardsArray.count, withRowType: "StatementRowType")
//        if let card = context as? Card {
////            statementTable.setNumberOfRows(card.statementArray.count, withRowType: "StatementRowType")
////
////            for index in 0..<card.statementArray.count {
////                guard let row = statementTable.rowController(at: index) as? StatementRowController else { continue }
////
//            for index in 0..<cardsArray.count {
//                guard let row = statementTable.rowController(at: index) as? StatementRowController else { continue }
//                //let statement = card.statementArray[index]
//
//                row.amountLabel.setText(card.balance)
//                //row.amountLabel.setTextColor(amountContains(amount: statement.amount))
//                //row.descLabel.setText(statement.desc)
//                //row.dateLabel.setText(statement.date)
//            }
//        }
//    }
//
////    func amountContains (amount: String) -> UIColor {
////        if amount.contains ("+") {
////            return UIColor(red:0.47, green:0.83, blue:0.33, alpha:1.0)
////        }
////        return UIColor(red:1.00, green:0.73, blue:0.36, alpha:1.0)
////    }
        }
    }
}

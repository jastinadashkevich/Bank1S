//
//  RequisiteInterfaceController.swift
//  Watch1S Extension
//
//  Created by administrator on 27.06.2018.
//  Copyright © 2018 administrator. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire

class RequisiteInterfaceController: WKInterfaceController {
    
    @IBOutlet var requisiteTable: WKInterfaceTable!
    
     var requisiteArray = [Requisite]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        Alamofire.request("https://msgr.lwo.by:8443/requisites").responseJSON { response in
            guard response.result.isSuccess else {
                print("Ошибка при запросе данных \(String(describing: response.result.error))")
                return
            }
            
            let dict = response.result.value as! [String : AnyObject]
            let values = dict["values"] as! [String : AnyObject]
            let req = values["requisites"] as! [String : AnyObject]
            
            self.requisiteTable.setNumberOfRows(req.keys.count - 2, withRowType: "RequisiteBankRowType")
            print(req.keys.count)

            for index in 0..<req.keys.count {
                guard let row = self.requisiteTable.rowController(at: index) as? RequisiteBankRowController else {
                    continue
                }
                
                switch(index) {
                case 0:
                    row.titleLabel.setText("BIC банка");
                    row.descLabel.setText(req["bank"] as? String)
                    break
                case 1:
                    row.titleLabel.setText("Детали банка");
                    row.descLabel.setText(req["bankDetails"] as? String)
                    break
                case 2:
                row.titleLabel.setText("UNP");
                row.descLabel.setText(req["unp"] as? String)
                    break
                case 3:
                    row.titleLabel.setText("Номер счета");
                    row.descLabel.setText(req["account"] as? String)
                    break
                case 4:
                    row.titleLabel.setText("Код валюты");
                    row.descLabel.setText(req["currencyCode"] as? String)
                    break
                case 5:
                    row.titleLabel.setText("Валюта");
                    row.descLabel.setText(req["currencyName"] as? String)
                    break
                default:
                    break
                }
            }
        }
    }
}

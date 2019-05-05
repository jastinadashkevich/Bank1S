//
//  CardsInterfaceController.swift
//  Watch1S Extension
//
//  Created by administrator on 12.06.2018.
//  Copyright © 2018 administrator. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire


class CardsInterfaceController: WKInterfaceController {

    @IBOutlet var cardsTable: WKInterfaceTable!
    
    //let plist = NSArray(contentsOfFile: Bundle.main.path(forResource: "Cards", ofType: "plist")!) as? [[String : Any]]
    var cardsArray = [Card]()
   
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
//        if let plist = plist {
//            for item in plist {
//                let card = Card(dict: item)
//                cardsArray.append(card)
//            }
        Alamofire.request("https://msgr.lwo.by:8443/cards_response").responseJSON { response in
                        guard response.result.isSuccess else {
                            print("Ошибка при запросе данных \(String(describing: response.result.error))")
                            return
                        }
            
            let dict = response.result.value as! [String : AnyObject]
            let values = dict["values"] as! [String : AnyObject]
            let cards = values["cards"] as! [[String : AnyObject]]
            
            for item in cards {
                let card = Card(dict: item)
                self.cardsArray.append(card)
            }
            
            self.cardsTable.setNumberOfRows(self.cardsArray.count, withRowType: "CardRowType")
            print(self.cardsArray.count)
            
            for index in 0..<self.cardsArray.count {
                guard let row = self.cardsTable.rowController(at: index) as? CardRowController else { continue }
                
                let card = self.cardsArray[index]
                
                row.cardLabel.setText(card.cardName)
                row.numberLabel.setText(card.num)
                //row.numberLabel.setText(String(card.number.suffix(9)))
                row.imageImg.setImageNamed(card.cardClass)
                //row.imageImg.setImageNamed(self.setImageFromName(cardName: card.cardName))
            }

        }
    }
    
//    func setImageFromName(cardName:String) -> String {
//        if cardName.contains ("EUR") {
//            return "type-logo_visa"
//        }
//        if cardName.contains ("GOLD") {
//            return "type-logo_ms"
//        }
//        if cardName.contains ("VIRTUON") {
//            return "type-logo_visa"
//        }
//        if cardName.contains ("USD") {
//            return "type-logo_visa"
//        }
//        return String()
//    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let card = cardsArray[rowIndex]
        pushController(withName: "InfoInterfaceController", context: card)
    }
}

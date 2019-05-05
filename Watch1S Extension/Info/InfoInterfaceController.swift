//
//  InfoInterfaceController.swift
//  Watch1S Extension
//
//  Created by administrator on 18.06.2018.
//  Copyright © 2018 administrator. All rights reserved.
//

import WatchKit
import Foundation


class InfoInterfaceController: WKInterfaceController {

    @IBOutlet var nameLabel : WKInterfaceLabel!
    @IBOutlet var numberLabel : WKInterfaceLabel!
    @IBOutlet var amountLabel : WKInterfaceLabel!
    @IBOutlet var imageText : WKInterfaceImage!
    
    var card: Card?
    
    @IBAction func onStatementButton() {
        pushController(withName: "StatementInterfaceController", context: nil/*card*/)
    }
    
    @IBAction func onAboutButton() {
        pushController(withName: "RequisiteInterfaceController", context: nil/*card*/)
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        if let card = context as? Card {
            self.card = card
            
            nameLabel.setText(card.cardName)
            numberLabel.setText(card.num)
            amountLabel.setText(card.balance + " " + card.currency)
            imageText.setImageNamed(card.type)
            //imageText.setImageNamed(setImageFromCardName(cardName: card.cardName))
        }
    }
    
//    func setImageFromCardName (cardName:String) -> String{
//        if cardName.contains("Visa") {
//            return "visaText"
//        }
//        if cardName.contains("Mastercard") {
//            return "mastercardText"
//        }
//        if cardName.contains("Maestro") {
//            return "maestroText"
//        }
//        if cardName.contains("Белкарт") {
//            return "belcardText"
//        }
//        return String()
//    }
    
}

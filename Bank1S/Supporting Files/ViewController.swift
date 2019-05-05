//
//  ViewController.swift
//  Bank1S
//
//  Created by administrator on 12.06.2018.
//  Copyright © 2018 administrator. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBAction func pushMeButton(_ sender: UIButton) {
//        var userArray : [User] = []
        
        Alamofire.request("https://msgr.lwo.by:8443/cards_response").responseJSON { response in
            guard response.result.isSuccess else {
                print("Ошибка при запросе данных \(String(describing: response.result.error))")
                return
            }
//            guard let arrayOfItems = response.result.value as? [[String:AnyObject]]
//                else {
//                    print("Не могу перевести в массив")
//                    return
//            }
            
            print(response.result.value as Any)
            
//            for item in arrayOfItems{
//                let user = User(dict: item)
//                print(user.address.lat)
//                userArray.append(user)
//
//            }
           // print(array)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


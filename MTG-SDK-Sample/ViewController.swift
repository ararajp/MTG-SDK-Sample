//
//  ViewController.swift
//  MTG-SDK-Sample
//
//  Created by Yusuke Arai on 2018/10/19.
//  Copyright © 2018年 Yusuke Arai. All rights reserved.
//

import UIKit
import MTGSDKSwift

class ViewController: UIViewController {
    
    let magic = Magic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color  = CardSearchParameter(parameterType: .colors, value: "black")
        let cmc = CardSearchParameter(parameterType: .cmc, value: "2")
        let setCode = CardSearchParameter(parameterType: .set, value: "AER")
        
        magic.fetchCards([color,cmc,setCode]) {
            cards, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            for card in cards! {
                print(card.name!)
                print(card.manaCost!)
                print(card.imageUrl!)
            }
        }
    }
}


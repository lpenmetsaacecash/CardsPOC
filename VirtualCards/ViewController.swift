//
//  ViewController.swift
//  VirtualCards
//
//  Created by Laxman Penmetsa on 10/31/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var walletView: WalletView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var coloredCardViews = [VirtualCardView]()
        for index in 1...6 {
            let cardView = VirtualCardView()
            cardView.index = index
            coloredCardViews.append(cardView)
        }
        
        walletView.reload(cardViews: coloredCardViews)
    }


}


//
//  VirtualCardView.swift
//  VirtualCards
//
//  Created by Laxman Penmetsa on 11/2/21.
//

import UIKit

class VirtualCardView: CardView {
    
    @IBOutlet weak var contentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius  = 10
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .random()
    }
}

//
//  CardView.swift
//  VirtualCards
//
//  Created by Laxman Penmetsa on 10/31/21.
//

import UIKit

class CardView: UIView, UIGestureRecognizerDelegate {
    /**
     Initializes and returns a newly allocated card view object with the specified frame rectangle.
     
     - parameter aRect: The frame rectangle for the card view, measured in points.
     - returns: An initialized card view.
     */
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupGestures()
        self.backgroundColor = .random()
    }
    
    var index: Int = 0
    
    /**
     Returns a card view object initialized from data in a given unarchiver.
     
     - parameter aDecoder: An unarchiver object.
     - returns: A card view, initialized using the data in decoder.
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGestures()
        self.backgroundColor = .random()
    }
    
    let tapGestureRecognizer    = UITapGestureRecognizer()
    let panGestureRecognizer    = UIPanGestureRecognizer()

    /**  A Boolean value that determines whether the view is presented. */
    open var presented: Bool = false
    
    /**  A parent wallet view object, or nil if the card view is not visible. */
    public var walletView: WalletView? {
        return container()
    }
    
    func setupGestures() {
        tapGestureRecognizer.addTarget(self, action: #selector(CardView.tapped))
        tapGestureRecognizer.delegate = self
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    /** This method is called when the card view is tapped. */
    @objc open func tapped() {
        if let _ = walletView?.presentedCardView {
            walletView?.dismissPresentedCardView(animated: true)
        } else {
            walletView?.present(cardView: self, animated: true)
        }
    }
}

internal extension UIView {
    func container<T: UIView>() -> T? {
        
        var view = superview
        
        while view != nil {
            if let view = view as? T {
                return view
            }
            view = view?.superview
        }
        
        return nil
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

//
//  CardView.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/30/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    private let threshold: CGFloat = 100
    
    private let cardImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "lady5c"))
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        clipsToBounds = true
        addSubview(cardImageView)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanAction))
        addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePanAction(_ gesture: UIPanGestureRecognizer){
        
        // roataion
        
        switch gesture.state {
        case .changed:
            handleChange(gesture)
            break
        case .ended:
            handleEnded(gesture)
            break
        default:
            break
        }
    }
    
    private func handleChange(_ gesture: UIPanGestureRecognizer){
        
        let translation = gesture.translation(in: nil)
        let angle: CGFloat = translation.x / 20
        let rotationalAngle : CGFloat = angle * .pi / 180
        let rotationalTransformation = CGAffineTransform(rotationAngle: rotationalAngle)
        self.transform = rotationalTransformation.translatedBy(x: translation.x, y: translation.y)
        
    }
    
    private func handleEnded(_ gesture: UIPanGestureRecognizer){
        
        let absoluteTranslation = abs(Int32(gesture.translation(in: nil).x))
        
        let shouldDismissCard = CGFloat(absoluteTranslation) > threshold
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
                
                self.frame = CGRect(x: 1000, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
                
            } else {
                self.transform = .identity
            }
            
        }) { (_) in
            self.transform = .identity
            self.frame = CGRect(x: 0, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

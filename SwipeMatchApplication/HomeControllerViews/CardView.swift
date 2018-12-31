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
    
    let cardImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "lady5c"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
     let informationLabel: UILabel = {
       let label = UILabel()
        label.text = "TEST TEST"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews(){
        layer.cornerRadius = 20
        clipsToBounds = true
        addSubview(cardImageView)
        addSubview(informationLabel)
        setupCostraintForLabel()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanAction))
        addGestureRecognizer(panGesture)
    }
    
    private func setupCostraintForLabel(){
        
        informationLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: -16, right: 0))
        
        
    }
    
    @objc private func handlePanAction(_ gesture: UIPanGestureRecognizer){
        
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
        
        let translationDirection: CGFloat = gesture.translation(in: nil).x > 0 ? 1 : -1
        
        let shouldDismissCard = abs(gesture.translation(in: nil).x) > threshold
        
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
                
                self.frame = CGRect(x: 1000 * translationDirection, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
                
            } else {
                self.transform = .identity
            }
            
        }) { (_) in
            self.transform = .identity
            if shouldDismissCard {
                self.removeFromSuperview()
            }
            
//            self.frame = CGRect(x: 0, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

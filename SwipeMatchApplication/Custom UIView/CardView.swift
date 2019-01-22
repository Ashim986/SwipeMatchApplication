//
//  CardView.swift
//  SwipeMatchApplication
//
//  Created by ashim dahal on 12/30/18.
//  Copyright © 2018 ashim dahal. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var user: User? {
        didSet {
            if let imageName = user?.imageNames, let name = user?.name, let age = user?.age, let profession = user?.profession {
                let attributedString = NSMutableAttributedString(string: name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
                attributedString.append(NSAttributedString(string: "  \(age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .light)]))
                attributedString.append(NSAttributedString(string: "\n \(profession)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
                
                cardImageView.image = UIImage(named: imageName.first ?? "")
                informationLabel.attributedText = attributedString
                user?.imageNames?.forEach({ (_) in
                    let barView = UIView()
                    barView.backgroundColor = UIColor(white: 0, alpha: 0.1)
                    barStackView.addArrangedSubview(barView)
                })
                setupImageViewIndexObserver()
            }
        }
    }
    
    var advertise: Advertise?{
        didSet {
            if let imageName = advertise?.posterPhotoName, let title = advertise?.title, let brandName = advertise?.brandName {
                cardImageView.image = UIImage(named: imageName)
                
                let attributedString = NSMutableAttributedString(string: title, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
                attributedString.append(NSAttributedString(string: "\n \(brandName)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
                
                informationLabel.attributedText = attributedString
                informationLabel.textAlignment = .center
            }
        }
    }
    
    var homeManger = HomeViewManager()
    private let threshold: CGFloat = 100
    
    private var cardImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "lady5c"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let informationLabel: UILabel = {
        let label = UILabel()
        label.text = "TEST TEST"
        label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let maskingLayerForImage: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.init(white: 0, alpha: 0.6).cgColor]
        gradientLayer.locations = [0, 1]
        return gradientLayer
    }()
    
    private var barStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        stackView.arrangedSubviews.first?.backgroundColor = UIColor.white
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    private func setupViews(){
        layer.cornerRadius = 20
        clipsToBounds = true
        addSubview(cardImageView)
        cardImageView.fillSuperView()
        layer.addSublayer(maskingLayerForImage)
        setupBarStackView()
        
        addSubview(informationLabel)
        setupCostraintForLabel()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanAction))
        addGestureRecognizer(panGesture)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapAction))
        addGestureRecognizer(tapGesture)
    }
    
    override func layoutSubviews() {
        maskingLayerForImage.frame = super.frame
    }
    
    private func setupBarStackView(){
        addSubview(barStackView)
        barStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 4, left: 4, bottom: 0, right: 4) , size: CGSize(width: 0, height: 4))
        barStackView.arrangedSubviews.first?.backgroundColor = .white
    }
    
    private func setupCostraintForLabel(){
        informationLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: -16, right: 0))
        
    }
    
    private func setupImageViewIndexObserver(){
        homeManger.imageObserable = { [weak self] (imageIndex, image) in
            self?.cardImageView.image = image
            self?.barStackView.arrangedSubviews.forEach({ (view) in
                view.backgroundColor = UIColor(white: 0, alpha: 0.1)
            })
            self?.barStackView.arrangedSubviews[imageIndex].backgroundColor = .white
        }
    }
    
    
    @objc private func handleTapAction(_ gesture: UITapGestureRecognizer){
        let getLocation = gesture.location(in: nil)
        let shouldAdvanceToNextPhoto = getLocation.x > frame.width/2
        if shouldAdvanceToNextPhoto {
            homeManger.advanceToNextImage(for: user?.imageNames)
        } else {
            homeManger.goToPreviousImage(for: user?.imageNames)
        }
        
    }
    
    @objc private func handlePanAction(_ gesture: UIPanGestureRecognizer){
        
        switch gesture.state {
        case .began:
            superview?.subviews.forEach({ (subview) in
                subview.layer.removeAllAnimations()
            })
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
                
                self.frame = CGRect(x: 500 * translationDirection, y: 0, width: self.superview!.frame.width, height: self.superview!.frame.height)
                
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

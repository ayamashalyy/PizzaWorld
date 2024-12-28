//
//  RatingView.swift
//  pizzaWorld
//
//  Created by aya on 27/12/2024.
//

import Foundation
import UIKit

class RatingView: UIView {
    var rating: Int = 5
    private var maximumRating = 5
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 2
        stack.distribution = .fill
        return stack
    }()
    
    func configureWithRating(rating: Int){
        
        if rating > 0 {
            for _ in 0..<rating {
                let starView = genericStarView(.filled)
                stackView.addArrangedSubview(starView)
            }
        }
        let nonFilledCount = maximumRating - rating
        if nonFilledCount > 0 {
            for _ in 0..<nonFilledCount {
                let starView = genericStarView(.nonFilled)
                stackView.addArrangedSubview(starView)
            }
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        configureWithRating(rating: 3)
    }
    
    func setupUI() {
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func genericStarView(_ type: StarType) -> UIImageView {
        let imageView = UIImageView()
        let imageName = type == .filled ? "starr" : "star-shapee"
        guard let image = UIImage(named: imageName) else {
            print("⚠️ Image \(imageName) not found in assets.")
            return UIImageView()
        }
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        return imageView
    }
    
}

enum StarType {
    case filled
    case nonFilled
}

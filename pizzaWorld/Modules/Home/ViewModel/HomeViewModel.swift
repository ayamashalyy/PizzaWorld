//
//  HomeViewModel.swift
//  pizzaWorld
//
//  Created by aya on 29/12/2024.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    private var silderTimer: Timer?
    private var slides: BehaviorRelay <[Int]> = .init(value: [1,2,3,4,5])
     var popularItems: BehaviorRelay <[Product]> = .init(value: [.init(title: "Test"), .init(title: "Test"), .init(title: "Test"), .init(title: "Test"), .init(title: "Test"), .init(title: "Test")
])
    private var currentSlide = 0
    
    // outputs
   // var slideToItemAtIndex: ((Int) -> Void)?
    var slideToItem: PublishSubject<Int> = .init()
    //MARK: Public Variables
    var numberOfItems: Int {
        return slides.value.count
    }
    
    //Inputs
    func viewDidLoad() {
        
    silderTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }
    
        @objc func scrollToNextItem(){
            let nextSlide = currentSlide + 1
            currentSlide = nextSlide % slides.value.count
            slideToItem.onNext(currentSlide)
            //slideToItemAtIndex?(currentSlide)
        }
}

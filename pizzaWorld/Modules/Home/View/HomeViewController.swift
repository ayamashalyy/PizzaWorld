//
//  HomeViewController.swift
//  pizzaWorld
//
//  Created by aya on 27/12/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var silderCollectionView: UICollectionView!
    var silderTimer: Timer?
    var slides: [Int] = [1,2,3,4,5]
    var currentSlide = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCells()
        silderTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollToNextItem), userInfo: nil, repeats: true)
    }
    
    private func setupUI() {
        
        silderCollectionView.delegate = self
        silderCollectionView.dataSource = self
        
    }
    
    @objc func scrollToNextItem(){
        let nextSlide = currentSlide + 1
        currentSlide = nextSlide % slides.count
        silderCollectionView.scrollToItem(at: IndexPath(row: currentSlide, section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
    }
    
    private func registerCells() {
        silderCollectionView.registerCell(cellClass: SliderCell.self)
    }
    
    // Custom initializer to load the view controller from its associated XIB file.
    // This ensures that the UI is properly loaded from "HomeViewController.xib".
    init() {
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK Silder Data Sourse
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as SliderCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    
    
}

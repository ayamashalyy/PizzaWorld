//
//  HomeViewController.swift
//  pizzaWorld
//
//  Created by aya on 27/12/2024.
//

import UIKit
import RxCocoa
import RxSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var silderCollectionView: UICollectionView!
    @IBOutlet weak var pupularTableView: UITableView!
    
    let viewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Test")
        setupUI()
        registerCells()
        bind()
        viewModel.viewDidLoad()
    }
    
    func bind() {
//        viewModel.slideToItemAtIndex = { [weak self] index in
//            self?.silderCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
//        }
        
        viewModel.slideToItem.subscribe { [weak self ] index in
            self?.silderCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: [.centeredVertically, .centeredHorizontally], animated: true)
        }.disposed(by: disposeBag)
    }
    
    private func setupUI() {
        
        silderCollectionView.delegate = self
        silderCollectionView.dataSource = self
        
    }
    
    func setupPopularTableView() {
        pupularTableView.rx.setDelegate(self).disposed(by: disposeBag)
        viewModel.popularItems.asObservable()
            .bind(to: pupularTableView.rx.items(cellIdentifier: String(describing: PopularCell.self), cellType: PopularCell.self)) { index, model, cell in
                
            }.disposed(by: disposeBag)
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
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(indexPath: indexPath) as SliderCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    
    
}

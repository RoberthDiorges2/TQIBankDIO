//
//  HomeViewController.swift
//  TQIBankDIO
//
//  Created by Roberth Diorges on 29/01/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: HomeViewModel!
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDelegate =  self
        setCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // By Markus
        //        navigationController?.setNavigationBarHidden(true, animated: false)
        viewModel.getMenuOptions()
    }
    
    func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCollectionViewCell.self)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.model.menuOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(of: HomeCollectionViewCell.self, for: indexPath) { cell in
            let model = self.viewModel.model.menuOptions[indexPath.row]
            cell.setup(option: model)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.goToExtract()
    }
}

extension HomeViewController: HomeViewModelViewDelegate {
    func viewSuccess(_ viewModel: HomeViewModel) {
        collectionView.reloadData()
        
    }
    
    func viewFailure(_ viewModel: HomeViewModel, error: Error) {
        debugPrint(error)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.contentSize.width - 20) / 3
        return CGSize(width: width, height: 112)
    }
}

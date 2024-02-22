//
//  HomeViewController.swift
//  FriendsApp
//
//  Created by Roberto Rojo Sahuquillo on 18/2/24.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func updateViews()
    
    func navigateToDetail(with data: HomeCellModel)
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        viewModel?.onViewsLoaded()

        }
    
    private func configureViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension HomeViewController: HomeViewControllerProtocol {
    
    func navigateToDetail(with data: HomeCellModel) {
        
        let detailStoryboard = UIStoryboard(name: "DetailView", bundle: nil)
        
        guard let destinationVC = detailStoryboard.instantiateInitialViewController() as? DetailViewController else { return }
        
        destinationVC.viewModel = DetailViewModel(delegate: destinationVC, data: data)
        
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func updateViews() {

        collectionView.reloadData()
    }
    
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.dataCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 2 * 0.95, height: 160.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellViewController.cellIdentifier, for: indexPath) as? CellViewController
        
        if let data = viewModel?.viewData,
           indexPath.row < data.count {
    
                cell?.updateViews(data: data[indexPath.row])
            
        }
        return cell ?? UICollectionViewCell()
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.onItemSelected(at: indexPath.row)
    }
    
}

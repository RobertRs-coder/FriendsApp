//
//  HomeViewModel.swift
//  FriendsApp
//
//  Created by Roberto Rojo Sahuquillo on 18/2/24.
//

import Foundation

protocol HomeViewModelProtocol {
    var dataCount: Int { get }
    var viewData: [HomeCellModel] { get }
    
    func onViewsLoaded()
    
    func onItemSelected(at index: Int)
    
}

final class HomeViewModel {
    
    weak private var delegate: HomeViewControllerProtocol?
    
    private var data: CharactersModel
    private(set) var viewData = [HomeCellModel]()
//    private(set) var movies: [Movie] = []

    
    init(delegate: HomeViewControllerProtocol?, data: CharactersModel) {
        self.delegate = delegate
        self.data = data
    }
    
    private func loadData() {
        
        viewData = mapViewData(data: data)
        // Notificar a la vista que pinte los datos
        delegate?.updateViews()

    }
    

    private func mapViewData(data: CharactersModel) -> [HomeCellModel] {
        return data.compactMap { character in
            HomeCellModel(image: character.image, title: character.name)
        }
    }
}


extension HomeViewModel: HomeViewModelProtocol {

    
    
    var dataCount: Int {
        viewData.count
    }
    
    func onViewsLoaded() {
        
        loadData()
    }
    

    func onItemSelected(at index: Int) {
        //
        delegate?.navigateToDetail(with: viewData[index])
    }
}

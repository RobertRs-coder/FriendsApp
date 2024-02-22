//
//  DetailViewModel.swift
//  FriendsApp
//
//  Created by Roberto Rojo Sahuquillo on 21/2/24.
//

import Foundation

protocol DetailViewModelProtocol {
    var viewData: DetailModel { get }
    func onViewsLoaded()
}

final class DetailViewModel {
    
    private weak var delegate: DetailViewControllerProtocol?
    private var data: HomeCellModel
    
    private (set) var viewData = DetailModel()
    
    init(delegate: DetailViewControllerProtocol?, data: HomeCellModel) {
        self.delegate = delegate
        self.data = data
    }
    
    private func loadData() {
        viewData = mapData(data: data)
        delegate?.updateViews(data: viewData)

    }
    
    private func mapData(data: HomeCellModel) -> DetailModel {
        DetailModel(image: data.image, title: data.title)
    }
}


extension DetailViewModel: DetailViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }

}

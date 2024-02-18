//
//  SplashViewModel.swift
//  FriendsApp
//
//  Created by Roberto Rojo Sahuquillo on 18/2/24.
//

import Foundation

protocol SplashViewModelProtocol {
    func onViewsLoaded()
}

final class SplashViewModel {
    
    weak var delegate: SplashViewControllerProtocol?
    
    init(delegate: SplashViewControllerProtocol?) {
        self.delegate = delegate
    }
    
    private func loadData() {

        delegate?.showLoading(true)

        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.delegate?.showLoading(false)
            
        }
    }
}


extension SplashViewModel: SplashViewModelProtocol {
    func onViewsLoaded() {
        loadData()
    }
}

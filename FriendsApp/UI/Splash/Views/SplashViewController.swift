//
//  SplashViewController.swift
//  FriendsApp
//
//  Created by Roberto Rojo Sahuquillo on 18/2/24.
//

import UIKit


protocol SplashViewControllerProtocol: AnyObject {
    func showLoading( _ show: Bool)
}

class SplashViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var viewModel: SplashViewModelProtocol?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = SplashViewModel(delegate: self)
        viewModel?.onViewsLoaded()

    }
}

extension SplashViewController: SplashViewControllerProtocol {
    func showLoading(_ show: Bool) {
        switch show {
        case true where !activityIndicator.isAnimating:
            activityIndicator.stopAnimating()

        case false where activityIndicator.isAnimating:
            activityIndicator.startAnimating()
            
        default: break
        }
        
    }
}
 


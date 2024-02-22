//
//  SplashViewController.swift
//  FriendsApp
//
//  Created by Roberto Rojo Sahuquillo on 18/2/24.
//

import UIKit


protocol SplashViewControllerProtocol: AnyObject {
    func showLoading( _ show: Bool)
    func navigateToHome(_: String)
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
    
    func navigateToHome(_ name: String) {
        
        /// 1. Create Storyboard
        let homeStoryboard = UIStoryboard(name: name, bundle: nil)
        
        /// 2. Instantiate its own ViewController as initial ViewController
        guard let destinationViewController = homeStoryboard.instantiateInitialViewController() as? HomeViewController else { return }
        
        destinationViewController.viewModel = HomeViewModel(delegate: destinationViewController, data: sampleCharactersData)
        
        /// 3. Set stack of ViewControllers embedded in navigationController
        self.navigationController?.setViewControllers([destinationViewController], animated: true)
    }

}
 


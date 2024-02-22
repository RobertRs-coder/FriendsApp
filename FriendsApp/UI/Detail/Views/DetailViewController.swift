//
//  DetailViewController.swift
//  FriendsApp
//
//  Created by Roberto Rojo Sahuquillo on 21/2/24.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
    func updateViews(data: DetailModel)
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    
    
    var viewModel: DetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.onViewsLoaded()
    }

    private func update(image: String?) {
        detailImage.image = UIImage(named: image ?? "")
    }
    
    private func update(title: String?) {
        detailTitle.text = title
    }
    
}

extension DetailViewController: DetailViewControllerProtocol {
    func updateViews(data: DetailModel) {
        update(image: data.image)
        update(title: data.title)
    }
}

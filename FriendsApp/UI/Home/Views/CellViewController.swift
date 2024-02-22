//
//  CellViewController.swift
//  FriendsApp
//
//  Created by Roberto Rojo Sahuquillo on 18/2/24.
//

import UIKit


class CellViewController: UICollectionViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        /// First time
        configureCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        /// Clean cell
        cellImage = nil
        cellTitle = nil
    }
    
    func updateViews(data: HomeCellModel) {
        update(image: data.image)
        update(title: data.title)
    }
    
    private func update(image: String?) {
        cellImage.image = UIImage(named: image ?? "")
    }
    
    private func update(title: String?) {
        cellTitle.text = title
    }
    
    
    private func configureCell() {
        cellImage.layer.cornerRadius = 4.0
        cellView.layer.cornerRadius = 4.0
        cellView.layer.shadowColor = UIColor.gray.cgColor
        cellView.layer.shadowOffset = .zero
        cellView.layer.shadowOpacity = 0.7
        cellView.layer.shadowRadius = 4.0
    }
}

extension CellViewController {
    static var cellIdentifier: String {
        String(describing: CellViewController.self)
    }
}

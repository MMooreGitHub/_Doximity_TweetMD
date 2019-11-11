//
//  TweetDetailVC.swift
//  TweetMD


import Foundation
import UIKit

class TweetDetailVC: UIViewController {
    
    // MARK: Properties
    private let viewModel: TweetDetailVMContract
    
    @IBOutlet private var thumbnailImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var handleLabel: UILabel!
    @IBOutlet private var contentLabel: UILabel!
    @IBOutlet private var favoriteButton: UIButton!
    @IBOutlet private var dateLabel: UILabel!
    
    // MARK: Init
    init(viewModel: TweetDetailVMContract) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        nameLabel.text = viewModel.authorName
        handleLabel.text = viewModel.authorHandle
        contentLabel.text = viewModel.content
        dateLabel.text = viewModel.dateString
        thumbnailImageView.image = viewModel.authorProfilePhoto
        favoriteButton.backgroundColor = viewModel.favoriteButtonColor
        favoriteButton.setTitle(viewModel.favoriteButtonText, for: .normal)
    }
    
    @IBAction func favoriteToggle(sender: Any) {
        viewModel.toggleFavorites()
        
        configureView()
    }
}

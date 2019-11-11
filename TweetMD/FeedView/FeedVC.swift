//
//  FeedVC.swift
//  TweetMD


import UIKit

class FeedVC: UIViewController {
    
    // MARK: Properties
    fileprivate let viewModel: FeedVMContract
    @IBOutlet private var tableView: UITableView!
    
    // MARK: Init
    init(viewModel: FeedVMContract) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: type(of: self)), bundle: Bundle.main)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TweetMD"
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.register(UINib.init(nibName: FeedCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: FeedCell.reuseIdentifier)
        
        viewModel.setMedicalTweetsDidChangeClosure {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
}

// MARK: TableView Methods
extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.medicalTweets.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.reuseIdentifier, for: indexPath) as? FeedCell,
            indexPath.row < viewModel.medicalTweets.count
        else { return UITableViewCell() }
        
        let tweet = viewModel.medicalTweets[indexPath.row]
        cell.configure(with: tweet)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let tweet = viewModel.medicalTweets[indexPath.row]
        let detailVC = TweetDetailVC(viewModel: TweetDetailVM(tweet: tweet))
        navigationController?.pushViewController(detailVC, animated: true)
    }
}


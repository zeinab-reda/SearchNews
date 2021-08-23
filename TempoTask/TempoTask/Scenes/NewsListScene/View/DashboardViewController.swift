//
//  DashboardViewController.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 19/06/2021.
//

import UIKit
import RxCocoa
import RxSwift

class DashboardViewController: BaseViewController {
    private var viewModel: NewsViewModelType?
    private var router: NewsRouterType?
    private let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    private let cellIdentifer = "HeadlineTableViewCell"

    
    override func viewDidLoad() {
        setupView()
        setupTableView()
    }
    private func fetchSearchResults(searchTxt:String)
    {
        // fetch all news
        viewModel?.getSearchNewsResults(q:searchTxt, pageSize:10, page: 1)

    }
    
    
    private func setupTableView()
    {
        // register cell
        tableView.register(UINib(nibName: cellIdentifer, bundle: nil),
                           forCellReuseIdentifier: cellIdentifer)
        
        tableView.rowHeight = 250.0
        
        
        // binding table
        viewModel?.newsDriver.drive { (articles) in
            
        }.disposed(by: disposeBag)
        
        viewModel?.newsDriver.drive(tableView.rx.items(cellIdentifier: cellIdentifer,
                                                      cellType: HeadlineTableViewCell.self)) { _, element, cell in
            cell.item = element
        }.disposed(by: disposeBag)
        
        
        tableView.rx.modelSelected(NewsModel.self).subscribe { [weak self] topic in
            self?.router?.navigateToDetails(topic)
        }.disposed(by: disposeBag)
    }
    
    private func setupView() {
        viewModel = NewsViewModel()
        router = NewsRouter()
        viewModel?.loadingDriver.drive { [weak self] isloading in
            isloading == true ? self?.showLoading() :  self?.hideLoading()
            self?.tableView.isHidden = isloading
        }.disposed(by: disposeBag)

        viewModel?.errorDriver.drive { [weak self] message in
            self?.showAlert(message)
        }.disposed(by: disposeBag)
        
    
    }

    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [weak self] _ in
            self?.viewModel?.getSearchNewsResults(q: "",  pageSize: 10, page: 1)
        }))
        present(alert, animated: true, completion: nil)
    }
 
}

extension DashboardViewController : UISearchBarDelegate
{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text?.isEmpty ?? false ? showAlert("text is empty") : fetchSearchResults(searchTxt: searchBar.text ?? "")

    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        

    }
}

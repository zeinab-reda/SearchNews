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
    private let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    private let cellIdentifer = "HeadlineTableViewCell"

    
    override func viewDidLoad() {
        setupView()
        setupTableView()
    }
    
    private func setupTableView()
    {
        // register cell
        tableView.register(UINib(nibName: cellIdentifer, bundle: nil),
                           forCellReuseIdentifier: cellIdentifer)
        
        tableView.rowHeight = 200.0
        
        // fetch all news
        viewModel?.getSearchNewsResults(q: "", pageSize:10, page: 0)
        
        // binding table
        viewModel?.newsDriver.drive { (articles) in
            
        }.disposed(by: disposeBag)
        
        viewModel?.newsDriver.drive(tableView.rx.items(cellIdentifier: cellIdentifer,
                                                      cellType: HeadlineTableViewCell.self)) { _, element, cell in
            cell.item = element
        }.disposed(by: disposeBag)
        

    }
    
    
    private func setupView() {
        viewModel = NewsViewModel()
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
            self?.viewModel?.getSearchNewsResults(q: "",  pageSize: 10, page: 0)
        }))
        present(alert, animated: true, completion: nil)
    }
 
}

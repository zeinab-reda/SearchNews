//
//  BaseViewProtocol.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 18/08/2021.
//

import Foundation

protocol BaseViewProtocol: class {
    func showLoading()
    func hideLoading()
    func showScreenNoConnection()
    func showAlert(title: String?, message: String)
    func showErrorAlert(error: String)
    func showBlockScreenWithRetry(error: String)
    func retryBlock()
}

//
//  BaseView.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 18/08/2021.
//

import Foundation
import JGProgressHUD

class BaseViewController: UIViewController, BaseViewProtocol{
    func retryBlock() {
    }
    
    
    let hud = JGProgressHUD()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hud.textLabel.text = "Loading"

    }
    
    //MARK:- Loading and alerts
    func showLoading() {
        hud.show(in: self.view)

    }
    
    func showAlert(title: String?, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    func showErrorAlert(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
  
    func hideLoading() {
        hud.dismiss()
    }
    
    func showBlockScreenWithRetry(error: String) {
        let alertController = UIAlertController(title: "error", message: error, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        alertController.addAction(UIAlertAction(title: "Tryagin", style: .default, handler:{[weak self]_ in
            self?.retryBlock()
        }))

        present(alertController, animated: true, completion: nil)
        
    }
    
    func showScreenNoConnection() {
        let alertController = UIAlertController(title: "No Connection", message: "please recheck you connection and try again", preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        alertController.addAction(UIAlertAction(title: "Tryagin", style: .default, handler:{[weak self]_ in
            self?.retryBlock()
        }))

        present(alertController, animated: true, completion: nil)
    }
    
    //MARK:- Handel Error
    
    func handelError(_ error: AppError, view: BaseViewProtocol?) {
         switch error.errorType {
         case .noConnection :
             view?.showScreenNoConnection()
         case .internalServerError,  .unauthorized ,  .notFound :
            view?.showErrorAlert(error: error.message ?? "")
         default:
            view?.showBlockScreenWithRetry(error: error.message ?? "")
         }
     }
}

//
//  Router.swift
//  VIPER
//
//  Created by Neosoft on 26/06/26.
//

import Foundation
import UIKit

// Object
// Entry Point
// Reference to View

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class ProductRouter: AnyRouter {
    var entry: (any EntryPoint)?
    
    static func start() -> any AnyRouter {
        let router = ProductRouter()
        
        // Assign VIP
        var view: AnyView = ProductViewController()
        var presenter: AnyPresenter = productPresenter()
        var interactor: AnyInteractor = productInteractor()
        
        view.presenter = presenter
        interactor.presentor = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
}

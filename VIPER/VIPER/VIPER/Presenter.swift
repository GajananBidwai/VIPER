//
//  Presentor.swift
//  VIPER
//
//  Created by Neosoft on 26/06/26.
//

import Foundation

// Object
// Protocol
// Reference to interactor, router, view

enum FetchError: Error {
    case failed
}


protocol AnyPresenter {
    var router: AnyRouter? { get set}
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchProduct(with result: Result<Products, Error>)
}

class productPresenter: AnyPresenter {
    var router: (any AnyRouter)?
    
    var interactor: (any AnyInteractor)? {
        didSet {
            interactor?.getProduct()
        }
    }
    
    var view: (any AnyView)?
    
    
    
    func interactorDidFetchProduct(with result: Result<Products, Error>) {
        switch result {
        case .success(let success):
            view?.update(with: success)
        case .failure:
            view?.updateWithError(with: "Something went wrong")
        }
    }
    
}

//
//  Interpretor.swift
//  VIPER
//
//  Created by Neosoft on 26/06/26.
//

import Foundation
// Object
// Protocol
// Reference to presenter

// https://dummyjson.com/products

protocol AnyInteractor {
    var presentor: AnyPresenter? { get set }
    
    func getProduct()
    
}

class productInteractor: AnyInteractor {
    var presentor: (any AnyPresenter)?
    
    func getProduct() {
        print("Start fetching")
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            
            guard let data = data, error == nil else {
                self?.presentor?.interactorDidFetchProduct(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(Products.self, from: data)
                self?.presentor?.interactorDidFetchProduct(with: .success(response))
                
            } catch {
                self?.presentor?.interactorDidFetchProduct(with: .failure(error))
            }
            
        }
         task.resume()
    }
    
    
    
    
}

//
//  FilmAssembly.swift
//  StarWars
//
//  Created by Anastas Smekh on 15.02.2021.
//

import UIKit

final class FilmPageAssembly {
    
    static func assembly() -> UIViewController  {
        
        let view = FilmPageView()
        let presenter = FilmPagePresenter()
        let interactor = FilmPageInteractor()
        let router = FilmPageRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
    
}

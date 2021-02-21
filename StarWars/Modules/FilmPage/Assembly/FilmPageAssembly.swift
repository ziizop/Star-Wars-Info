//
//  FilmAssembly.swift
//  StarWars
//
//  Created by Anastas Smekh on 15.02.2021.
//

import UIKit

final class FilmPageAssembly {
    
    static func assembly(filmDataInfo: FilmsDataInfo, image: UIImage) -> UIViewController  {
        
        let view = FilmPageView(filmDataInfo: filmDataInfo, image: image)
        let presenter = FilmPagePresenter()
        let interactor = FilmPageInteractor(filmsDataInfo: filmDataInfo)
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

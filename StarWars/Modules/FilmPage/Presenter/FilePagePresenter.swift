//
//  FilePagePresenter.swift
//  StarWars
//
//  Created by Anastas Smekh on 15.02.2021.
//

import Foundation
final class FilmPagePresenter {
    
    weak var view: FilmPageViewInput?
    var interactor: FilmPageInteractorInput?
    var router: FilmPageRouterInput?
    
}

extension FilmPagePresenter: FilmPageInteractorOutput {
    
}

extension FilmPagePresenter: FilmPageViewOutput {
    
}

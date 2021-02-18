//
//  FilePageInteractor.swift
//  StarWars
//
//  Created by Anastas Smekh on 15.02.2021.
//

import Foundation
protocol FilmPageInteractorOutput: class {
    
    
}

protocol FilmPageInteractorInput {
    
}

final class FilmPageInteractor {
    
    var presenter: FilmPageInteractorOutput?
    
}

extension FilmPageInteractor: FilmPageInteractorInput {
    
}

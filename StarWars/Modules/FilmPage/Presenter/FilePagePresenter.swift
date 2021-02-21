//
//  FilePagePresenter.swift
//  StarWars
//
//  Created by Anastas Smekh on 15.02.2021.
//

import UIKit
final class FilmPagePresenter {
    
    weak var view: FilmPageViewInput?
    var interactor: FilmPageInteractorInput?
    var router: FilmPageRouterInput?
    var characters: [PeopleRowData] = []
    var imageArray: [UIImage] = []
    
    
}

extension FilmPagePresenter: FilmPageViewOutput {
 
    func viewDidLoad() {
        interactor?.gettingInformationAboutPeople()
    }
    
    func numberOfItemsInSection() -> Int {
        characters.count
    }
    
    func cellForItemAt(index: Int) -> PeopleRowData {
        characters[index]
    }
    
    func loadImage(index: Int) -> UIImage {
        imageArray[index]
    }
}

extension FilmPagePresenter: FilmPageInteractorOutput {
    
    func featchData(_ peopleInfo: [PeopleRowData]) {
        characters = peopleInfo
        view?.reloadData()
        print(characters)
    }
    
    func featchImage(_ images: UIImage) {
        imageArray.append(images)
        view?.reloadData()
    }
    
    
    
}

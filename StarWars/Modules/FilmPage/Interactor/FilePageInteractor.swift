//
//  FilePageInteractor.swift
//  StarWars
//
//  Created by Anastas Smekh on 15.02.2021.
//

import UIKit
protocol FilmPageInteractorOutput: class {
    func featchData(_ peopleInfo: [PeopleRowData])
    func featchImage(_ images: UIImage)
    
}

protocol FilmPageInteractorInput {
    func gettingInformationAboutPeople ()
}

final class FilmPageInteractor {
    
    var presenter: FilmPageInteractorOutput?
    var filmDataInfo: FilmsDataInfo?
    
    init(filmsDataInfo:FilmsDataInfo) {
        self.filmDataInfo = filmsDataInfo
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FilmPageInteractor: FilmPageInteractorInput {
    func gettingInformationAboutPeople() {
        var dataArray: [PeopleRowData] = []
        var numberArray: [Int] = []
        let apiManager = APIManager.shared
        guard let  urlsString = filmDataInfo?.characters else { return }
        for urlString in urlsString {
            let numbersArray = urlString.components(separatedBy: CharacterSet.decimalDigits.inverted)
            for int in numbersArray {
                if let number = Int(int) {
                    apiManager.getCharactersImages(number) { [weak self] result in
                        guard let self = self else  { return }
                        switch result {
                        case .success(let data):
                            self.presenter?.featchImage(data)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            apiManager.postRequestCharacters(urlString) { [ weak self ] result in
                guard let self = self else { return }
                switch result {
                case .success(let data):
                    dataArray.append(data)
                    self.presenter?.featchData(dataArray)
                    print(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

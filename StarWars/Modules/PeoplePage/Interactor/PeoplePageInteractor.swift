import UIKit

protocol PeoplePageInteractorInput {
    func  dataFactory()
}

protocol PeoplePageInteractorOutput: class {
    func fetchPeopleData(_ peopleData: PeopleAllData)
    func fetchPeopleImages(_ peopleImage: UIImage)
}

final class PeoplePageInteractor {
    weak var presenter: PeoplePageInteractorOutput?
}

extension PeoplePageInteractor: PeoplePageInteractorInput {
    func dataFactory() {
        let url = "https://swapi.dev/api/people/"
        let apiManager = APIManager.shared
        apiManager.postRequestPeople(url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                print(data.results)
                self.presenter?.fetchPeopleData(data)
                let dataID = data.results
                apiManager.getPeopleImages(dataID) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let image):
                        print(image)
                        self.presenter?.fetchPeopleImages(image)
                    case .failure(let errorImages):
                        print(errorImages.localizedDescription)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

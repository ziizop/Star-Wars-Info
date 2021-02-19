protocol PeoplePageInteractorInput {
    func  dataFactory()
}

protocol PeoplePageInteractorOutput: class {
    func fetchPeopleData(_ peopleData: PeopleAllData)
}

final class PeoplePageInteractor {
    weak var presenter: PeoplePageInteractorOutput?
    
}

extension PeoplePageInteractor: PeoplePageInteractorInput {
    func dataFactory() {
        let url = "https://swapi.dev/api/people/1"
        let apiManager = APIManager.shared
        apiManager.postRequestPeople(url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                print(data.results)
                self.presenter?.fetchPeopleData(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

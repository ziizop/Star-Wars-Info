final class PeoplePagePresenter {
    weak var view: PeoplePageViewInput?
    var interactor: PeoplePageInteractorInput?
    var router: PeoplePageRouterInput?
    var people: [PeopleRowData] = []
}

extension PeoplePagePresenter: PeoplePageViewOutput {
    
    func viewDidLoad() {
        interactor?.dataFactory()
        view?.showLoading()
        
    }
    
    func numberOfRowsPeopleInSection() -> Int {
        people.count
    }
    
    func cellPeopleForRowAt(row: Int) -> PeopleRowData {
        people[row]
    }
}

extension PeoplePagePresenter: PeoplePageInteractorOutput {
    func fetchPeopleData(_ peopleData: PeopleAllData) {
        people.append(contentsOf: peopleData.results)
        view?.reloadData()
        view?.hideLoading()
    }
    
    
    
}

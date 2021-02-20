import  UIKit

final class PeoplePagePresenter {
    weak var view: PeoplePageViewInput?
    var interactor: PeoplePageInteractorInput?
    var router: PeoplePageRouterInput?
    private var people: [PeopleRowData] = []
    private var peopleImages: [UIImage] = []
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
    
    func didLoadPeopleImage(row: Int) -> UIImage {
        peopleImages[row]
    }
}

extension PeoplePagePresenter: PeoplePageInteractorOutput {
    
    func fetchPeopleData(_ peopleData: PeopleAllData) {
        people.append(contentsOf: peopleData.results)
        view?.reloadData()
        view?.hideLoading()
    }
    
    func fetchPeopleImages(_ peopleImage: UIImage) {
        peopleImages.append(peopleImage)
    }
}

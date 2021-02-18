final class PeoplePagePresenter {
    weak var view: PeoplePageViewInput?
    var interactor: PeoplePageInteractorInput?
    var router: PeoplePageRouterInput?
}

extension PeoplePagePresenter: PeoplePageViewOutput {
    
}

extension PeoplePagePresenter: PeoplePageInteractorOutput {
    
}

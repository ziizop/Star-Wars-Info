protocol PeoplePageInteractorInput {
    
}

protocol PeoplePageInteractorOutput: class {
    
}

final class PeoplePageInteractor {
    weak var presenter: PeoplePageInteractorOutput?
    
}

extension PeoplePageInteractor: PeoplePageInteractorInput {
    
}

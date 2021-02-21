protocol TabBarInteractorOutput: class {
    
}

protocol TabBarInteractorInput {
    
}

final class TabBarInteractor {
    
    weak var presenter: TabBarInteractorOutput?
    
}

extension TabBarInteractor: TabBarInteractorInput {
    
}

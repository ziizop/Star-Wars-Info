import UIKit

final class PeoplePageAssembly {
    
    static func assembly() -> UIViewController {
        
        let view = PeoplePageView()
        let presenter = PeoplePagePresenter()
        let interactor = PeoplePageInteractor()
        let router = PeoplePageRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}

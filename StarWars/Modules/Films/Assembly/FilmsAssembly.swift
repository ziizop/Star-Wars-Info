import UIKit

final class FilmsAssembly {
    
    static  func assembly() -> UIViewController {
        let view = FilmsView()
        let presenter = FilmsPresenter()
        let interactor = FilmsInterator()
        let router = FilmsRouter()
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        interactor.presenter = presenter
        
        router.view = view
        router.presenter = presenter
        
        return view
    }
}

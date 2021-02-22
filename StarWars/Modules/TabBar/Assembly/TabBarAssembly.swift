import UIKit

final class TabBarAssembly {
    
    static func assembly() -> UIViewController {
        
        var view = TabBarView()
        var presenter = TabBarPresenter()
        var interactor = TabBarInteractor()
        var router = TabBarRouter()
        
        view.presetner = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}

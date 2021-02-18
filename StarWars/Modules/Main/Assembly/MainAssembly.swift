import UIKit

class MainAssembly {
    
    static func assembly() -> UIViewController {
    let view = MainView()
    let presenter = MainPresenter()
    let interactor = MainInteractor()
    let router = MainRouter()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        let navController = UINavigationController(rootViewController: view)
        
        return navController
    }
}

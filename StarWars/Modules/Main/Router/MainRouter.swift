import  UIKit

protocol MainRouterInput {
    
    func showFilmsFormWithMain()
    
}

class MainRouter {
    weak var view: MainViewInput?
}

extension MainRouter: MainRouterInput {
    func showFilmsFormWithMain() {
        
        let filmAss = FilmsAssembly.assembly()
        view?.navigationController?.pushViewController(filmAss, animated: true)
    }
}

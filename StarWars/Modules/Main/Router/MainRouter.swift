import  UIKit

protocol MainRouterInput {
    
    func showFilmsFormWithMain()
    func showPeopleFromMain()
    
}

class MainRouter {
    weak var view: MainViewInput?
}

extension MainRouter: MainRouterInput {
    func showFilmsFormWithMain() {
        
        let filmAss = FilmsAssembly.assembly()
        view?.navigationController?.pushViewController(filmAss, animated: true)
    }
    
    func showPeopleFromMain() {
        
        let people = PeoplePageAssembly.assembly()
        view?.navigationController?.pushViewController(people, animated: true)
    }
}

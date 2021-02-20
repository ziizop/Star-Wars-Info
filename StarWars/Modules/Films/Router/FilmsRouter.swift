import UIKit
protocol FilmsRouterInput {
    func showFilmPage()
}

final class FilmsRouter {
    
    weak var view: FilmsView?
    
}

extension FilmsRouter: FilmsRouterInput {
    func showFilmPage() {
        let filmPage = FilmPageAssembly.assembly()
        view?.navigationController?.pushViewController(filmPage, animated: true)
    }
}

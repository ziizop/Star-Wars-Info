import UIKit

protocol FilmsRouterOutput {
    func  dataTransfer() -> FilmsDataInfo
    func imageTransfer() -> UIImage
}

protocol FilmsRouterInput: class {
    func showFilmPage()
}

final class FilmsRouter {
    
    weak var view: FilmsView?
    var presenter: FilmsRouterOutput?
}

extension FilmsRouter: FilmsRouterInput {
    func showFilmPage() {
//        print("Зашли")
//        let data = (presenter?.dataTransfer())!
//        let image = (presenter?.imageTransfer())!
//         let filmPage = FilmPageAssembly.assembly()
//         view?.navigationController?.pushViewController(filmPage, animated: true)
    }
}

import UIKit

protocol FilmsRouterOutput: class {
    func  dataTransfer(index: Int) -> FilmsDataInfo
    func imageTransfer(index: Int) -> UIImage
}

protocol FilmsRouterInput {
    func showFilmPage(index: Int)
}

final class FilmsRouter {
    
    weak var view: FilmsView?
    weak var presenter: FilmsRouterOutput?
}

extension FilmsRouter: FilmsRouterInput {
    func showFilmPage(index: Int) {
        print("Зашли")
        guard let data = presenter?.dataTransfer(index: index) else { return }
        guard let image = presenter?.imageTransfer(index: index) else { return }
        let filmPage = FilmPageAssembly.assembly(filmDataInfo: data, image: image)
        view?.navigationController?.pushViewController(filmPage, animated: true)
    }
}

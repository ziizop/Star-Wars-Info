import UIKit

final class FilmsPresenter {
    weak var view: FilmViewInput? = nil
    var interactor: FilmsInteratorInput?
    var router: FilmsRouterInput?
    private var episodesArray: [FilmsDataInfo] = []
    private var episodeImage: [UIImage] = []
    private var number: [Int] = []
}

extension FilmsPresenter: FilmViewOutput {
    
    func viewDidLoad() {
        interactor?.makeData()
        view?.showLoading()
    }
    
    func numberOfRowsInSection() -> Int {
        episodesArray.count
    }
    
    func mainCellForRowAt(index: Int) -> FilmsDataInfo {
        episodesArray[index]
    }
    
    func didSelectImageRow(index: Int) -> UIImage {
        episodeImage[index]
    }
    
    func didSelectViewModel(index: Int) {
        router?.showFilmPage(index: index)
        }
}

extension FilmsPresenter: FilmsInteratorOutput {
    
    func fetchSections(_ section: FilmsAllData) {
        episodesArray.append(contentsOf: section.results)
        view?.hideLoading()
        view?.reloadData()
    }
    
    func fetchImages(_ image: UIImage) {
        episodeImage.append(image)
        view?.reloadData()
    }
}

extension FilmsPresenter: FilmsRouterOutput {
    func dataTransfer(index: Int) -> FilmsDataInfo {
        mainCellForRowAt(index: index)
    }
    
    func imageTransfer(index: Int) -> UIImage {
        didSelectImageRow(index: index)
    }
}

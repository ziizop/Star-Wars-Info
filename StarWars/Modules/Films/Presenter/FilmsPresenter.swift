import UIKit

final class FilmsPresenter {
    weak var view: FilmViewInput?
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
    
    func didSelectViewModel() {
        router?.showFilmPage()
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

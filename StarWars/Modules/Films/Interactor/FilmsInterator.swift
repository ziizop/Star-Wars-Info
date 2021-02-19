import UIKit

protocol FilmsInteratorOutput: class {
    func fetchSections(_ section: FilmsAllData)
    func fetchImages (_ image: UIImage)
}

protocol FilmsInteratorInput {
    func makeData()
//    func getImage(_ episod_id: [FilmsDataInfo])
}

final  class FilmsInterator {

    weak var presenter: FilmsInteratorOutput?
}

extension FilmsInterator: FilmsInteratorInput {
    
    func makeData() {
        let apiMager = APIManager.shared
        let urlString = "https://swapi.dev/api/films/"
        apiMager.postRequest(urlString: urlString) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                let dataInfo = data.results
                self.presenter?.fetchSections(data)
                print(data)                
                // let dataInfo = data.results
                apiMager.loadingImageInBanner(dataInfo) { [weak self] result in
                    guard let self = self else { return }
                    switch result {
                    case .success(let data):
                        self.presenter?.fetchImages(data)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription as Any)
            }
        }
    }
}

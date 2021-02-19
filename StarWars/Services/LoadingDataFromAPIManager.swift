import UIKit

class LoadingDataFromAPI {
    
   static let shared: LoadingDataFromAPI = LoadingDataFromAPI()
    
    func loadingImageInBanner(_ data: [FilmsDataInfo], completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        let api = APIManager.shared
        
        for id in data {
            switch id.episode_id {
            
            case 1:
                print(" ID_Episods: \(id.episode_id)")
                api.getImageEpisods(4) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            case 2:
                print(" ID_Episods: \(id.episode_id)")
                api.getImageEpisods(5) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            case 3:
                print(" ID_Episods: \(id.episode_id)")
                api.getImageEpisods(6) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            case 4:
                print(" ID_Episods: \(id.episode_id)")
                api.getImageEpisods(1) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            case 5:
                print(" ID_Episods: \(id.episode_id)")
                api.getImageEpisods(2) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            case 6:
                print(" ID_Episods: \(id.episode_id)")
                api.getImageEpisods(3) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            default:
                break
            }
        }
    }

}

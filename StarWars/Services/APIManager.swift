import Alamofire

final class APIManager {
    
    static let shared: APIManager = APIManager()
    
    func postRequest(urlString: String, completion: @escaping (Result<FilmsAllData, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                
                if let error = error {
                    print(error.localizedDescription)
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {return}
                
                do {
                    let films = try JSONDecoder().decode(FilmsAllData.self, from: data)
                    completion(.success(films))
                } catch let jsonError {
                    print("Ошибка кодеровки JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    private func getImageEpisods(_ episode_id: Int, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let urlString = "https://starwars-visualguide.com/assets/img/films/\(episode_id).jpg"
        guard let  url = URL(string: urlString) else { return  }
        do {
            let imageData = try Data(contentsOf: url)
            guard let image = UIImage(data: imageData) else { return }
            completion(.success(image))
        } catch let dataError {
            completion(.failure(dataError))
        }
    }
    
    func loadingImageInBanner(_ data: [FilmsDataInfo], completion: @escaping (Result<UIImage, Error>) -> Void) {
        for id in data {
            switch id.episode_id {
            
            case 1:
                print(" ID_Episods: \(id.episode_id)")
                self.getImageEpisods(4) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            case 2:
                print(" ID_Episods: \(id.episode_id)")
                self.getImageEpisods(5) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            case 3:
                print(" ID_Episods: \(id.episode_id)")
                self.getImageEpisods(6) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            case 4:
                print(" ID_Episods: \(id.episode_id)")
                self.getImageEpisods(1) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            case 5:
                print(" ID_Episods: \(id.episode_id)")
                self.getImageEpisods(2) { result in
                    switch result {
                    case .success(let data):
                        completion(.success(data))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
                
            case 6:
                print(" ID_Episods: \(id.episode_id)")
                self.getImageEpisods(3) { result in
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

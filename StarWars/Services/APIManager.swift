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
    
    func getImageEpisods(_ episode_id: Int, completion: @escaping (Result<UIImage, Error>) -> Void) {
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
    
    func postRequestPeople(_ url: String, comletion: @escaping (Result< PeopleAllData,Error>) -> Void) {
        guard let url = URL(string: url) else { return  }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, respons, error) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                    comletion(.failure(error))
                }
                guard let data = data else { return }
                do {
                    let peopleData = try JSONDecoder().decode(PeopleAllData.self, from: data)
                    comletion(.success(peopleData))
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                    comletion(.failure(jsonError))
                }
            }
        }.resume()
    }
}

import Alamofire

final class APIManager {
    
    static let shared: APIManager = APIManager()
    // MARK: - Films API
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
    // MARK: - People API
    func postRequestPeople(_ url: String, comletion: @escaping (Result< PeopleAllData,Error>) -> Void) {
        guard let url = URL(string: url) else { return  }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                
                if let error = error {
                    print(error.localizedDescription)
                    comletion(.failure(error))
                    return
                }
                
                guard let data = data else {return}
                
                do {
                    let people = try JSONDecoder().decode(PeopleAllData.self, from: data)
                    comletion(.success(people))
                } catch let jsonError {
                    print("Ошибка кодеровки JSON", jsonError)
                    comletion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func getPeopleImages(_ peopleID: [PeopleRowData], comletion: @escaping (Result< UIImage, Error >) -> Void) {
        let idArray = peopleID.count
        for id in 1...idArray {
            print("ID People: \(id)")
            let urlString = "https://starwars-visualguide.com/assets/img/characters/\(id).jpg"
            guard let url = URL(string: urlString) else { return }
            do {
                let imageData = try Data(contentsOf: url)
                guard let image = UIImage(data: imageData) else { return }
                comletion(.success(image))
            } catch let errorData {
                print(errorData.localizedDescription)
                comletion(.failure(errorData))
            }
        }
    }
    
    func postRequestCharacters(_ url: String, comletion: @escaping (Result< PeopleRowData,Error>) -> Void) {
        guard let url = URL(string: url) else { return  }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                
                if let error = error {
                    print(error.localizedDescription)
                    comletion(.failure(error))
                    return
                }
                
                guard let data = data else {return}
                
                do {
                    let people = try JSONDecoder().decode(PeopleRowData.self, from: data)
                    comletion(.success(people))
                } catch let jsonError {
                    print("Ошибка кодеровки JSON", jsonError)
                    comletion(.failure(jsonError))
                }
            }
        }.resume()
    }
    
    func getCharactersImages(_ peopleID: Int, comletion: @escaping (Result< UIImage, Error >) -> Void) {
        let id = peopleID
        print("ID People: \(id)")
        let urlString = "https://starwars-visualguide.com/assets/img/characters/\(id).jpg"
        guard let url = URL(string: urlString) else { return }
        do {
            let imageData = try Data(contentsOf: url)
            guard let image = UIImage(data: imageData) else { return }
            comletion(.success(image))
        } catch let errorData {
            print(errorData.localizedDescription)
            comletion(.failure(errorData))
        }
    }
}

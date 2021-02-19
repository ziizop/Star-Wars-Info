//import  UIKit
//
//class EpisodeViewModel {
//    var film: FilmsDataInfo?
//    var bannerImages: UIImage?
//    
//    init(film: FilmsDataInfo?) {
//        
//        guard let filmData = film else { return }
//        
//        self.film = filmData
//        
//        APIManager.shared.getImageEpisods(filmData.episode_id) { [weak self] (result) in
//            guard let self = self else { return }
//            switch result {
//            case .success(let image):
//                self.bannerImages = image
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//}

import UIKit

struct FilmsDataInfo: Decodable {
    var title: String
    var episode_id: Int
    var opening_crawl: String
    var director: String
    var producer: String
    var release_date: String
    var characters: [String]
}

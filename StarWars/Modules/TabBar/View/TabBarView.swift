import UIKit

protocol TabBarViewOutput {
    func viewDidLoad()
}

protocol TabBarViewInput: class {
    
}

final class TabBarView : UITabBarController {
    
    var presetner: TabBarViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presetner?.viewDidLoad()
        configure()
        setTabBar()
    }
    
    private func configure() {
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
    }
    
    private func setTabBar() {
        
        let mainModel = MainAssembly.assembly()
        mainModel.tabBarItem = UITabBarItem(title: "Общая библиотека ", image: #imageLiteral(resourceName: "starwars"), tag: 1)
        
        let selectFilmModel = FilmsAssembly.assembly()
        selectFilmModel.tabBarItem = UITabBarItem(title: "Кинохроника", image: #imageLiteral(resourceName: "iconfinder_Darth Mauls light-sabers_15781"), tag: 2)
        
        viewControllers = [
            mainModel,
            selectFilmModel
        ]
    }
}

extension TabBarView: TabBarViewInput {
    
}

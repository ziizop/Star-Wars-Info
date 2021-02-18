import  UIKit

final class TabBarPresenter {
    weak var  view: TabBarViewInput?
    var interactor: TabBarInteractorInput?
    var router: TabBarRouterInput?
    
}

extension TabBarPresenter: TabBarViewOutput {
    func viewDidLoad() {
        
    }
    
    
    
}

extension TabBarPresenter: TabBarInteractorOutput {
    
    
}

protocol PeoplePageViewInput: class {
    
}

protocol PeoplePageViewOutput {
    
}

final class PeoplePageView: BaseViewController {
    var presenter: PeoplePageViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PeoplePageView: PeoplePageViewInput {
    
}



final class MainPresenter {
    weak var view: MainViewInput?
    var interactor: MainInteractorInput?
    var router: MainRouterInput?
    
    private var sections: [MainSectionViewModel] = []
}

extension MainPresenter: MainViewOutput {
    
    func viewDidLoad() {
        interactor?.makeSection()
    }
    
    func numberOfSections() -> Int {
        MainViewSection.allCases.count
    }
    
    func numberOfRowsInSection(section: MainViewSection) -> Int {
        sections[section.rawValue].rows.count
    }
    
    func titleForHeaderInSection(section: MainViewSection) -> String? {
        sections[section.rawValue].title
    }
    
    func mainCellForRowAt(section: MainViewSection, row: Int) -> MainRowViewModel {
        sections[section.rawValue].rows[row]
    }
    
    func didSelectOption(section: MainViewSection, row: Int) {
        let  optiontype = mainCellForRowAt(section: section, row: row)
        switch optiontype.type {
        case .films:
            router?.showFilmsFormWithMain()
        case .people:
            print("Люди")
            router?.showPeopleFromMain()
        case .species:
            print("Виды")
            router?.showFilmsFormWithMain()
        case .planets:
            print("Планеты")
            router?.showFilmsFormWithMain()
        case .starships:
            print("Звездолеты")
            router?.showFilmsFormWithMain()
        case .vehicles:
            print("Техника")
            router?.showFilmsFormWithMain()
        }
    }
}

extension MainPresenter: MainInteractorOutput {
    func fetchSections(_ section: [MainSectionViewModel]) {
        self.sections = section
    }
}

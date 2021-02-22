protocol MainInteractorInput {
    
    func makeSection()
}

protocol MainInteractorOutput: class {
    
    func fetchSections(_ section: [MainSectionViewModel])
}

class MainInteractor {
    weak var presenter: MainInteractorOutput?
    
}

extension MainInteractor: MainInteractorInput {
    func makeSection() {
        
        let filmsRow = MainRowViewModel(type: .films, image: #imageLiteral(resourceName: "starwars") , title: "Эпизод")
        let filmsSection = MainSectionViewModel(title: "Выберите эпизод", rows: [filmsRow])
        
        let peopleRow = MainRowViewModel(type: .people, image: #imageLiteral(resourceName: "iconfinder_clone-old_15483"), title: "Персонажи")
        let speciesRow = MainRowViewModel(type: .species, image: #imageLiteral(resourceName: "iconfinder_Famous_Character_-_Add_On_1-47_2525049"), title: "Виды")
        let creaturesSection = MainSectionViewModel(title: "Существа", rows: [peopleRow,speciesRow ])
        
        let planetRow = MainRowViewModel(type: .planets, image: #imageLiteral(resourceName: "Death_Star_2nd_35408"), title: "Планеты")
        let planetSection = MainSectionViewModel(title: "Планеты и галактики", rows: [planetRow])
        
        let starshipsRow = MainRowViewModel(type: .starships, image: #imageLiteral(resourceName: "iconfinder_X Wing_15784"), title: "Звездолеты")
        let conveyorBeltRow = MainRowViewModel(type: .vehicles, image: #imageLiteral(resourceName: "iconfinder_anakin_starfighter_15477"), title: "Виды")
        let technicSection = MainSectionViewModel(title: "Техника", rows: [starshipsRow,conveyorBeltRow ])
        
        let sections = [filmsSection, creaturesSection, planetSection, technicSection]
        
        presenter?.fetchSections(sections)
    }
    
    
}

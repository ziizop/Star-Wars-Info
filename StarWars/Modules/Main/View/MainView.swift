import UIKit
import SnapKit

protocol MainViewOutput {
    
    func viewDidLoad()
    func numberOfSections() -> Int
    func numberOfRowsInSection(section: MainViewSection) -> Int
    func mainCellForRowAt(section: MainViewSection, row: Int) -> MainRowViewModel
    func titleForHeaderInSection(section: MainViewSection) -> String?
    func didSelectOption(section: MainViewSection, row: Int)
}

protocol MainViewInput: class {
    
    var navigationController: UINavigationController? { get }
    func reloadTableView()
    
}

final class MainView: BaseViewController {
    
    var presenter: MainViewOutput?
    
    private lazy var tableView: UITableView =  {
        
        var tableView: UITableView
        
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
        
        tableView.register(cellWithClass: MainTableViewCell.self)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    private lazy var findButton: ButtonView = {
        let buttonView = ButtonView(title: "Найти!", target: self, selector: #selector(findButtonTapped(_:)))
        return buttonView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        // Do any additional setup after loading the view.
    }
    
    private func configure() {
        
        navigationItem.title = " Star Wars Universe"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        view.addSubview(findButton)
        presenter?.viewDidLoad()
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        findButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(130)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(58)
        }
    }
    
    @objc private func findButtonTapped(_ sender: UIButton) {
        // temp fix
        // let movieModule = FilmPageAssembly.assembly()
        // navigationController?.pushViewController(movieModule, animated: true)
        
    }
}

// MARK: - MainViewInput
extension MainView: MainViewInput {
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension MainView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let section = MainViewSection(rawValue: indexPath.section)  else { return }
        presenter?.didSelectOption(section: section, row: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let mainSection = MainViewSection(rawValue: section) else {return nil}
        return presenter?.titleForHeaderInSection(section: mainSection)
    }
}
// MARK: - UITableViewDataSource
extension MainView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let mainSection = MainViewSection(rawValue: section) else { return 0 }
        return presenter?.numberOfRowsInSection(section: mainSection) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier) as? MainTableViewCell,
            let mainSection = MainViewSection(rawValue: indexPath.section),
            let mainRow = presenter?.mainCellForRowAt(section: mainSection, row: indexPath.row)
        else {
            return UITableViewCell()
        }
        
        cell.configure(viewModel: mainRow)
        
        return cell
    }
}

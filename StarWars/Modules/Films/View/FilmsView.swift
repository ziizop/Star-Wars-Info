import  UIKit

protocol FilmViewOutput {
    
    func viewDidLoad()
    func numberOfRowsInSection() -> Int
    func mainCellForRowAt(index: Int) -> FilmsDataInfo
    func didSelectViewModel(index: Int)
    func didSelectImageRow(index: Int) -> UIImage
    
}

protocol FilmViewInput: class {
    
    var navigationController: UINavigationController? { get }
    func showLoading()
    func hideLoading()
    func reloadData()
    
}

final class FilmsView: BaseViewController {
    
    var episodes: [FilmsDataInfo]?
    
    private lazy var tableView: UITableView = {
        
        var tableView: UITableView
        
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellWithClass: FilmsTableViewCell.self)
        
        return tableView
    }()
    
    var presenter: FilmViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configure()
    }
    
    private func configure() {
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        navigationItem.title = "Кинохроника"
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - SelectFilmViewInput

extension FilmsView: FilmViewInput {
    func showLoading() {
        showActivityIndicator()
    }
    
    func hideLoading() {
        hideActivityIndicator()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource

extension FilmsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: FilmsTableViewCell.reuseIdentifier, for: indexPath) as? FilmsTableViewCell,
            let episode = presenter?.mainCellForRowAt(index: indexPath.row),
            let banner = presenter?.didSelectImageRow(index: indexPath.row)
        else {
            return UITableViewCell()
        }
        
        cell.configure(number: episode.episode_id, nameEpisod: episode.title, imageBanner: banner)
        
        return cell
    }
}

// MARK: - UITableViewDelegete

extension FilmsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "starwarsHeader")
        
        let headerView = UIView()
        headerView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        130
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
}


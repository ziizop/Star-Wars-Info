import  UIKit

protocol PeoplePageViewInput: class {
    func showLoading()
    
    func hideLoading()
    
    func reloadData()
    
}

protocol PeoplePageViewOutput {
    
    func viewDidLoad()
    func numberOfRowsPeopleInSection() -> Int
    func cellPeopleForRowAt(row:Int) -> PeopleRowData
}

final class PeoplePageView: BaseViewController {
    
    var presenter: PeoplePageViewOutput?
    
    private lazy var tableView: UITableView = {
        let tableView: UITableView
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
        
        tableView.register(cellWithClass: PeoplePageTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        cpnfigure()
    }
    
    private func cpnfigure() {
        navigationItem.title = "People"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.trailing.top.leading.bottom.equalToSuperview()
        }
    }
}
    // MARK: - PeoplePAgeViewInput

extension PeoplePageView: PeoplePageViewInput {
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
    // MARK: - UITableViewDelegate

extension PeoplePageView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
// MARK: - UITableViewDataSource

extension PeoplePageView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRowsPeopleInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: PeoplePageTableViewCell.reuseIdentifier, for: indexPath) as? PeoplePageTableViewCell,
            let text = presenter?.cellPeopleForRowAt(row: indexPath.row)
            else
        {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = text.peopleName
        return cell
    }
    
    
}


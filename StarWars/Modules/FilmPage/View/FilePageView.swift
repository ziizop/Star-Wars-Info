//
//  FilePageView.swift
//  StarWars
//
//  Created by Anastas Smekh on 15.02.2021.
//

import UIKit

protocol FilmPageViewOutput {
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func cellForItemAt(index: Int) -> PeopleRowData
    func loadImage(index: Int) -> UIImage
}

protocol FilmPageViewInput: class  {
    
    func reloadData()
}

final class FilmPageView: BaseViewController {
    
    var presenter: FilmPageViewOutput?
    
    private lazy var bannerImageSize: CGFloat = 0
    
    private lazy var bannerdImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Episod 3")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        
        let contentView = UIView()
        contentView.layer.cornerRadius = 50
        contentView.clipsToBounds = true
        
        if #available(iOS 13.0, *) {
            contentView.backgroundColor = .systemBackground
        } else {
            contentView.backgroundColor = .white
        }
        return contentView
    }()
    
    private lazy var descriptionEpisodLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.text = "War! The Republic is crumbling under attacks by the ruthless Sith Lord, Count Dooku. There are heroes on both sides. Evil is everywhere. In a stunning move, the fiendish droid leader, General Grievous, has swept into the Republic capital and kidnapped Chancellor Palpatine, leader of the Galactic Senate. As the Separatist Droid Army attempts to flee the besieged capital with their valuable hostage, two Jedi Knights lead a desperate mission to rescue the captive Chancellor...."
        return label
    }()
    
    private lazy var episodName: UILabel = {
        let label = UILabel()
        label.text = "Episode III: Revenge of the Sith"
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.alpha = 0.6
        return label
    }()
    
    private lazy var dateCreated: UILabel = {
        let label = UILabel()
        label.text = "05-19-2005"
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.alpha = 0.6
        return label
    }()
    
    private lazy var descriptionLable: UILabel = {
        let label = UILabel()
        label.text = "description:"
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.alpha = 0.6
        return label
    }()
    
    //MARK: - People properties
    
    private lazy var actorsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var  actorsTableView: UITableView = {
        var tableView: UITableView
        
        if #available(iOS 13.0, *) {
            tableView = UITableView(frame: .zero, style: .insetGrouped)
        } else {
            tableView = UITableView(frame: .zero, style: .grouped)
        }
        
        tableView.register(cellWithClass: FilmPageTableViewCell.self)
        
//        tableView.dataSource = self
//        tableView.delegate = self
        
        return tableView
        
    }()
    
    private lazy var actorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 40, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        if #available(iOS 13.0, *) {
            collection.backgroundColor = .systemBackground
        } else {
            collection.backgroundColor = .white
        }
        collection.registers(cellWithClass: FilmPageCollectionViewCell.self)
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    private lazy var actorsName: UILabel = {
        let label = UILabel()
        label.text = "Characters:"
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.alpha = 0.6
        return label
    }()
    
    private var filmDataInfo: FilmsDataInfo?
    private var image: UIImage? {
        didSet {
            self.bannerdImage.image = image
        }
    }
    
    init(filmDataInfo:FilmsDataInfo, image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        self.filmDataInfo = filmDataInfo
        self.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
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
        
        mainScrollView.addSubview(contentView)
        
        view.addSubview(bannerdImage)
        view.addSubview(mainScrollView)
        
        bannerImageSize = (view.bounds.width / (bannerdImage.image!.size.width / bannerdImage.image!.size.height))
        bannerdImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(bannerImageSize)
        }
        
        mainScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(bannerImageSize - 70)
            make.bottom.leading.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(300)
            make.width.equalToSuperview()
        }
        
        contentView.addSubview(episodName)
        episodName.snp.makeConstraints { make  in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(30)
        }
        
        contentView.addSubview(dateCreated)
        dateCreated.snp.makeConstraints { make  in
            make.top.equalTo(episodName.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(30)
        }
        
        contentView.addSubview(descriptionLable)
        descriptionLable.snp.makeConstraints { make in
            make.top.equalTo(dateCreated.snp.bottom).offset(25)
            make.leading.equalToSuperview().inset(30)
        }
        
        contentView.addSubview(descriptionEpisodLable)
        descriptionEpisodLable.snp.makeConstraints { make in
            make.top.equalTo(descriptionLable.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        contentView.addSubview(actorsView)
        actorsView.snp.makeConstraints { make in
            make.top.equalTo(descriptionEpisodLable.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().inset(40)
        }
        
        actorsView.addSubview(actorsName)
        actorsView.addSubview(actorsCollectionView)
        
        actorsName.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(10)
        }
        
        actorsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(actorsName.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        bannerdImage.image = image.self
        
        episodName.text = "Episode \(filmDataInfo!.episode_id): \(filmDataInfo!.title)"
        dateCreated.text = filmDataInfo?.release_date
        descriptionEpisodLable.text = filmDataInfo?.opening_crawl
        
        //        navigationItem.title = "Эпизод"
        //        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension FilmPageView: FilmPageViewInput {
    func reloadData() {
        actorsCollectionView.reloadData()
    }
    
    
}

// MARK: - ScrollView Delegete

extension FilmPageView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        let banner = bannerdImage
        if scrollView.contentOffset.y > (bannerImageSize / 2) {
            UIView.animate(withDuration: 0.3) {
                banner.alpha = 0
            }
            navigationController?.setNavigationBarHidden(false, animated: true)
        } else {
            UIView.animate(withDuration: 0.3) {
                banner.alpha = 1
            }
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension FilmPageView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}

// MARK: - UICollectionViewDataSource

extension FilmPageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItemsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmPageCollectionViewCell.reuseIdentifier, for: indexPath) as? FilmPageCollectionViewCell,
            let data = presenter?.cellForItemAt(index: indexPath.row),
            let image = presenter?.loadImage(index: indexPath.row)
            else
        {
            return UICollectionViewCell()
        }
        myCell.addData(name: data.name, image: image)
        return myCell
    }
   
}

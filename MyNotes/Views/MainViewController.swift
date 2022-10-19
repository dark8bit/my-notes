//
//  MainViewController.swift
//  MyNotes
//
//  Created by Владислав Клепиков on 22.09.2022.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    
}

class MainViewController: UIViewController {
    public weak var delegate: MainViewControllerDelegate?
    
    private var typeTabList: [TypeTab] = [
        TypeTab(name: .all, isChecked: true),
        TypeTab(name: .reminder, isChecked: false),
        TypeTab(name: .audio, isChecked: false),
        TypeTab(name: .images, isChecked: false),
        TypeTab(name: .notifications, isChecked: false),
    ]
    
    private var selectedTypeTab: TypeTab = TypeTab(name: .all, isChecked: true)
    
    private let notenlyListDefault: [Notation] = [
        Notation(title: "Hello world 1", description: "Hi World", date: Date(), contentType: .audio),
        Notation(title: "Hello world 2", description: "Hi World", date: Date(), contentType: .reminder),
        Notation(title: "Hello world 3", description: "Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob", date: Date(), contentType: .reminder),
        Notation(title: "Hello world 4", description: "Hi World", date: Date(), contentType: .notifications),
        Notation(title: "Hello world 5", description: "Hi World", date: Date(), contentType: .audio),
        Notation(title: "Hello world 6", description: "Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob Tum dicere exorsus est laborum et via procedat oratio quaerimus igitur, quid sit. Si sine causa? quae fuerit causa, mox videro; interea hoc tenebo, si ob", date: Date(), contentType: .images),
    ]
    
    private var notenlyList = [Notation]()
    
    //MARK: Container View
    private let containerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: Search Controller
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)

        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        #warning("Временно оставлю (obscuresBackgroundDuringPresentation), так как проблема в исчезновении текста после закрытия инпута поиска")
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search anything"
        searchController.searchBar.layer.cornerRadius = 6
        
        return searchController
    }()
    
    //MARK: CollectionTabView
    lazy var collectionTabView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewLayout.minimumInteritemSpacing = 90
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        
        collection.register(TypeTabCollectionViewCell.self, forCellWithReuseIdentifier: TypeTabCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor(named: "BackgroundCustom")
        
        collection.delegate = self
        collection.dataSource = self
        
        return collection
    }()
    
    //MARK: CollectionNotelyView
    lazy var collectionNotelyView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumLineSpacing = 25
        collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewLayout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collection.register(NotelyCollectionViewCell.self, forCellWithReuseIdentifier: NotelyCollectionViewCell.identifier)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor(named: "BackgroundCustom")
        
        collection.delegate = self
        collection.dataSource = self
        
        return collection
    }()
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        print(typeTabList)
        navigationItem.title = "My Notes"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        notenlyList = notenlyListDefault

        setupViews()
        setupConstrains()
        
        view.backgroundColor = UIColor(named: "BackgroundCustom")
    }
    
    //MARK: Setup Views
    private func setupViews() -> Void {
        containerView.addSubview(collectionTabView)
        containerView.addSubview(collectionNotelyView)
        
        view.addSubview(containerView)
    }
    
    //MARK: Setup Constrains
    private func setupConstrains() -> Void {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 36),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            
            collectionTabView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 150),
            collectionTabView.heightAnchor.constraint(equalToConstant: 68),
            collectionTabView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            collectionTabView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
            
            collectionNotelyView.topAnchor.constraint(equalTo: collectionTabView.bottomAnchor, constant: 0),
            collectionNotelyView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            collectionNotelyView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0),
            collectionNotelyView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0),
        ])
    }
}

//MARK: SearchResult
extension MainViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    #warning("Переписать фильтр по табам")
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchText.isEmpty ? filteredNotenly() : filteredNotenly(text: searchText)
        
        collectionNotelyView.reloadData()
    }
    
    private func filteredNotenly() -> () {
        notenlyList = selectedTypeTab.name == .all ? notenlyListDefault : notenlyListDefault.filter({ $0.contentType == selectedTypeTab.name })
    }
    
    private func filteredNotenly(text: String) -> () {
        notenlyList = notenlyListDefault.filter({$0.title.lowercased().contains(text.lowercased()) && $0.contentType == selectedTypeTab.name})
    }
}

//MARK: UICollectionViewDataSource, UICollectionViewDelegate
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, TypeTabCollectionViewCellDelegate {
    func tabClicked(item: TypeTab) -> () {
        selectedTypeTab = item

        typeTabList = typeTabList.map({ TypeTab(name: $0.name, isChecked: $0.name == selectedTypeTab.name) })
        filteredNotenly()
        
        collectionTabView.reloadData()
        collectionNotelyView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //MARK: CollectionView NumberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case (collectionTabView):
            return typeTabList.count
        case (collectionNotelyView):
            return notenlyList.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case (collectionNotelyView):
            let tabCell = notenlyList[indexPath.row]

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NotelyCollectionViewCell.identifier, for: indexPath) as? NotelyCollectionViewCell else { return UICollectionViewCell() }
            
            cell.notely = tabCell
            
            return cell
        case (collectionTabView):
            let tabCell = typeTabList[indexPath.row]
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TypeTabCollectionViewCell.identifier, for: indexPath) as? TypeTabCollectionViewCell else { return UICollectionViewCell() }
            
            #warning("Переписать в нормальный вид")
            cell.configure(with: tabCell)
            cell.typeTab = tabCell
            cell.delegate = self
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

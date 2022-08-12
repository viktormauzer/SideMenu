//
//  ViewController.swift
//  SideMenu
//
//  Created by Viktor Mauzer on 05.08.2022..
//

import UIKit

enum MenuStatus {
    case opened, closed
}

class MainFeedViewController: UIViewController {
    @IBOutlet var mainFeedTableView: UITableView!
    @IBOutlet var menuView: MenuView!
    @IBOutlet var menuViewLeadingConstraint: NSLayoutConstraint!
    var backgroundView = UIView()
    
    let messages: [Message] = Message.mockData()
    var filteredMessages: [Message] = []
    
    var selectedMenuItem: String? {
        didSet {
            title = selectedMenuItem
        }
    }
    
    var selectedCategory: MessageCategory? {
        didSet {
            filteredMessages = messages.filter({ $0.categories.contains(where: { $0 == selectedCategory }) })
            mainFeedTableView.reloadData()
        }
    }
    
    var menuStatus: MenuStatus = .closed

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }

    //MARK: - Action Methods
    
    @objc
    func menuButtonPressed(_ sender: UIButton) {
        if menuStatus != .opened {
            toggleMenu(.opened)
        }
    }
    
    @objc
    func backgroundViewTapped(_ sender: UITapGestureRecognizer? = nil) {
        removeBackgroundView()
        toggleMenu(.closed)
    }
    
    @objc
    func menuViewDragged(_ panGesture: UIPanGestureRecognizer) {
        let dragAmount = panGesture.translation(in: menuView).x
        
        if dragAmount < 0 {
            menuViewLeadingConstraint.constant = panGesture.translation(in: menuView).x
        }
        
        if panGesture.state == .ended {
            dragAmount < -150 ? toggleMenu(.closed) : toggleMenu(.opened)
        }
    }
    
    //MARK: - Helper Methods
    
    func setupViewController() {
        title = selectedMenuItem ?? "Messages"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: K.Icons.menuButtonIcon), style: .plain, target: self, action: #selector(menuButtonPressed))
        mainFeedTableView.dataSource = self
        mainFeedTableView.delegate = self
        mainFeedTableView.register(UINib(nibName: K.cellName, bundle: nil), forCellReuseIdentifier: K.cellReuseIdentifier)
        menuView.mainFeedViewController = self
        
        // Set defaults for first load
        selectedMenuItem = "Primary"
        selectedCategory = .primary
        
        // Drag gesture for menu view
        let drag = UIPanGestureRecognizer(target: self, action: #selector(menuViewDragged))
        menuView.addGestureRecognizer(drag)
    }
    
    func toggleMenu(_ status: MenuStatus) {
        UIView.animate(withDuration: 0.3) {
            guard let navigation = self.navigationController else { return }
            
            if status == .opened {
                self.menuViewLeadingConstraint.constant = 0
                navigation.navigationBar.layer.zPosition = -1;
                self.menuStatus = .opened
            } else {
                self.menuViewLeadingConstraint.constant = -310
                navigation.navigationBar.layer.zPosition = 0;
                self.removeBackgroundView()
                self.menuStatus = .closed
            }
            
            self.view.layoutIfNeeded()
        }
        
        if status == .opened && !backgroundView.isFirstResponder {
            createBackgroundView()
        }
    }
    
    func createBackgroundView() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = UIColor(white: 0, alpha: 0.05)
        backgroundView.layer.shadowRadius = 10
        backgroundView.layer.shadowColor = UIColor.label.cgColor
        backgroundView.layer.shadowOffset = .zero
        backgroundView.layer.shadowOpacity = 0.8
        view.insertSubview(backgroundView, belowSubview: menuView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(backgroundViewTapped))
        backgroundView.addGestureRecognizer(tap)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func removeBackgroundView() {
        if !backgroundView.isFirstResponder {
            backgroundView.removeFromSuperview()
        }
    }
}

//MARK: - TableView Delegate and Data Source methods

extension MainFeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredMessages.isEmpty {
            return 1
        } else {
            return filteredMessages.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellReuseIdentifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("cannot dequeue reusable cell with typecast")
        }
        
        if filteredMessages.isEmpty {
            let noContentCell = UITableViewCell(style: .default, reuseIdentifier: "noContentCell")
            var content = noContentCell.defaultContentConfiguration()
            content.text = "No messages in this category."
            content.textProperties.alignment = .center
            noContentCell.contentConfiguration = content
            
            return noContentCell
        } else {
            cell.avatarLabel.text = filteredMessages[indexPath.row].avatarLetter
            cell.senderLabel.text = "by: \(filteredMessages[indexPath.row].sender)"
            cell.titleLabel.text = filteredMessages[indexPath.row].title
            cell.descriptionLabel.text = filteredMessages[indexPath.row].description
            
            return cell
        }
    }
}

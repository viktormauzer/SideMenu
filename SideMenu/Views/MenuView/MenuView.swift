//
//  MenuView.swift
//  SideMenu
//
//  Created by Viktor Mauzer on 11.08.2022..
//

import UIKit

class MenuView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet var menuTableView: UITableView!
    var mainFeedViewController: MainFeedViewController!
    
    let menuItems: [MessageCategory] = [.primary, .social, .promotions, .sent, .spam, .trash]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("MenuView", owner: self)
        addSubview(contentView)
        menuTableView.delegate = self
        menuTableView.dataSource = self
    }
}

extension MenuView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "MenuItemCell")
        var content = cell.defaultContentConfiguration()
        content.text = menuItems[indexPath.row].categoryName
        
        switch menuItems[indexPath.row] {
        case .primary:
            content.image = UIImage(systemName: K.Icons.primaryCategoryIcon)
        case .social:
            content.image = UIImage(systemName: K.Icons.socialCategoryIcon)
        case .promotions:
            content.image = UIImage(systemName: K.Icons.promotionsCategoryIcon)
        case .sent:
            content.image = UIImage(systemName: K.Icons.sentCategoryIcon)
        case .spam:
            content.image = UIImage(systemName: K.Icons.spamCategoryIcon)
        case .trash:
            content.image = UIImage(systemName: K.Icons.trashCategoryIcon)
        }
        
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainFeedViewController.toggleMenu(.closed)
        mainFeedViewController.selectedMenuItem = menuItems[indexPath.row].categoryName
        mainFeedViewController.selectedCategory = menuItems[indexPath.row]
    }
    
    
}

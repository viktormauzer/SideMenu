//
//  MenuView.swift
//  SideMenu
//
//  Created by Viktor Mauzer on 10.08.2022..
//

import UIKit

class MenuView: UIView {
    
    let menuItems: [String] = ["Primary", "Social", "Promotions"]

    @IBOutlet var contentView: MenuView!
    @IBOutlet var menuTableView: UITableView!
    
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
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: contentView.topAnchor),
            self.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            self.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 100)
        ])
    }
}

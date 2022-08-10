//
//  ViewController.swift
//  SideMenu
//
//  Created by Viktor Mauzer on 05.08.2022..
//

import UIKit

class MainFeedTableViewController: UITableViewController {
   
    let messages: [Message] = Message.mockData()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Messages"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: K.Icons.menuButtonIcon), style: .plain, target: self, action: #selector(menuButtonPressed))
        
        tableView.register(UINib(nibName: K.cellName, bundle: nil), forCellReuseIdentifier: K.cellReuseIdentifier)
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.cellReuseIdentifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("cannot dequeue reusable cell with typecast")
        }
        
        cell.avatarLabel.text = messages[indexPath.row].avatarLetter
        cell.senderLabel.text = "by: \(messages[indexPath.row].sender)"
        cell.titleLabel.text = messages[indexPath.row].title
        cell.descriptionLabel.text = messages[indexPath.row].description
        
        return cell
    }
    
    @objc
    func menuButtonPressed(_ sender: UIButton) {
        
    }
}

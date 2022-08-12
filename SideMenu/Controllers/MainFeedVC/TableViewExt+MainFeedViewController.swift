//
//  TableViewExt+MainFeedViewController.swift
//  SideMenu
//
//  Created by Viktor Mauzer on 12.08.2022..
//

import UIKit

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: K.detailVCStoryboardID) as? DetailViewController {
            detailVC.message = filteredMessages[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

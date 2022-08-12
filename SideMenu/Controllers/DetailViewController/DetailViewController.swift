//
//  DetailViewController.swift
//  SideMenu
//
//  Created by Viktor Mauzer on 12.08.2022..
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var avatarLabel: UILabel!
    @IBOutlet var messageTitleLabel: UILabel!
    @IBOutlet var messageSenderLabel: UILabel!
    @IBOutlet var messageTextView: UITextView!
    
    var message: Message?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let message = message else {
            return
        }

        avatarLabel.text = message.avatarLetter
        messageTitleLabel.text = message.title
        messageSenderLabel.text = "by: \(message.sender)"
        messageTextView.text = message.body
    }

}
